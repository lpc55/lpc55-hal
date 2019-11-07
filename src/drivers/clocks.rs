///!* API to configure the clocks.
///!
///! This is very incomplete (e.g., no support for PLL clocks).
///! It is also likely buggy, and more complex than needed
///!
///! It is currently used to prepare for using the USBFSD and
///! Flexcomm peripherals.

use core::cmp::min;
use core::marker::PhantomData;

use crate::typestates::{
    main_clock::MainClock,
    // clock_state,
    ClocksSupportFlexcommToken,
    ClocksSupportUsbfsToken,
};
use crate::{
    peripherals::{
        anactrl::Anactrl,
        pmc::Pmc,
        syscon::Syscon,
    },
    time::{
        Hertz,
        Megahertz,
        U32Ext,
    },
};

// #[allow(unused_imports)]
// use cortex_m_semihosting::{hprintln, dbg};

// UM 41.4.7 says: need >= 12Mhz for USBFS
// Empirically, this does not enumerate though
const MIN_USBFS_FREQ: Megahertz = Megahertz(24);
const DEFAULT_FREQ: Megahertz = Megahertz(12);

#[derive(Debug, Default)]
pub struct ClockRequirements {
    pub system_frequency: Option<Megahertz>,
    pub custom_pll: Option<Pll>,
    pub support_usbfs: bool,
}

#[derive(Debug)]
pub struct Clocks {
    main_clock: MainClock,
    system_frequency: Hertz,
}

impl Clocks {
    pub fn support_flexcomm_token(&self) -> Option<ClocksSupportFlexcommToken> {
        Some(ClocksSupportFlexcommToken {__: PhantomData} )
    }

    pub fn support_usbfs_token(&self) -> Option<ClocksSupportUsbfsToken> {
        let fast_enough = self.system_frequency >= MIN_USBFS_FREQ.into();
        let can_latch_sof = self.main_clock == MainClock::Fro96Mhz;

        if fast_enough && can_latch_sof {
            Some(ClocksSupportUsbfsToken {__: PhantomData} )
        } else {
            None
        }
    }
}

/// Output of Pll is: M/(2NP) times input
///
/// "There may be several ways to obtain the same PLL output frequency.
/// PLL power depends on Fcco (a lower frequency uses less power) and the divider used.
/// Bypassing the input and/or output divider saves power."

// #[allow(dead_code)]
#[derive(Debug)]
pub struct Pll {
    n: u8,
    m: u16,
    p: u8,
    selp: u8,
    seli: u8,
}

impl Pll {
    // allow user to override if they know better...
    pub unsafe fn new(n: u8, m: u16, p: u8) -> Pll {
        // UM 4.6.6.3.2
        let selp = min((m >> 2) + 1, 31) as u8;
        let seli = min(63, match m {
            m if m >= 8000 => 1,
            m if m >= 122 => 8000 / m,
            _ => 2 * (m >> 2) + 3,
        }) as u8;
        // let seli = min(2*(m >> 2) + 3, 63);
        Pll { n, m, p, selp, seli }
    }
}


static mut CONFIGURED: bool = false;

#[derive(Debug)]
pub enum ClocksError {
    // TODO: Add "cause"
    AlreadyConfigured,
    NotFeasible,
    UsbfsNotFeasible,
}

pub type Result<T> = core::result::Result<T, ClocksError>;

// TODO:
// - make sure Fro12Mhz is running for FLEXCOMM0
// - make sure Fro12 and Fro96 are even powered

impl ClockRequirements {
    // TODO: need all these builder methods?
    // Or have user fill the struct by hand, using the defaults?

    /// Ensures that the resulting clock configuration
    /// supports USBFS.
    pub fn support_usbfs(mut self) -> Self {
        self.support_usbfs = true;
        self
    }

    pub fn system_frequency<Freq>(mut self, freq: Freq) -> Self where Freq: Into<Megahertz> {
        self.system_frequency = Some(freq.into());
        self
    }

    // generated via `scripts/generate-pll-settings.py`,
    // massaged a bit by hand
    fn get_pll(freq: u32) -> Pll {
        assert!(freq >= 5);
        assert!(freq <= 150);
        // let ns: [u32; 9] = [1, 2, 3, 4, 6, 8, 12, 16, 24];
        // let ns: [u32; 2] = [1, 2];
        // let ps: [u32; 11] = [2, 3, 4, 6, 8, 9, 12, 16, 18, 24, 30];
        // let ps: [u32; 5] = [6, 8, 12, 16, 24];

        // for n in ns.iter() { for p in ps.iter() { for m in 3..=97 {
        for n in 1..=6 { for p in 1..=30 { for m in 1..=255 {
            // if 2 * freq * (*n) * (*p) == 12 * m {
            if 2 * freq * n * p == 12 * m {
                // UM 4.6.6.3.2
                let selp = (m >> 2) + 1; // <= 31
                let seli = 2 * (m >> 2) + 3; // <= 63
                return Pll {
                    // n: *n as u8,
                    n: n as u8,
                    m: m as u16,
                    // p: *p as u8,
                    p: p as u8,
                    selp: selp as u8,
                    seli: seli as u8,
                }
            }
        }}}

        unreachable!();
    }

    /// Requirements solver - tries to generate and configure a clock configuration
    /// from (partial) requirements.
    ///
    /// It's a bit ridiculous to do this in code, but no idea how to avoid it.
    ///
    /// Can be called only once, to not invalidate previous configurations
    pub fn configure(self, anactrl: &mut Anactrl, pmc: &mut Pmc, syscon: &mut Syscon) -> Result<Clocks> {
        if unsafe { CONFIGURED } {
            return Err(ClocksError::AlreadyConfigured);
        }

        let default_freq = if self.support_usbfs { MIN_USBFS_FREQ } else { DEFAULT_FREQ };
        let freq: Megahertz = self.system_frequency.unwrap_or(default_freq);

        if self.support_usbfs && freq < MIN_USBFS_FREQ {
            return Err(ClocksError::UsbfsNotFeasible);
        }


        // turn on FRO192M: clear bit 5, according to `fsl_power.h` from the SDK
        // unsafe { pmc.raw.pdruncfgclr0.write(|w| w.bits(1u32 << 5)) };
        // but it's hidden in UM, so let's assume this is always cleared

        // turn on both 12mhz and 96mhz clocks
        anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_96mhzclk().enable());
        anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_12mhzclk().enable());

        let (main_clock, sys_divider) = match freq {
            freq if freq <= 12.mhz() && 12 % freq.0 == 0 => {
                (MainClock::Fro12Mhz, 12 / freq.0)
            },
            freq if freq <= 96.mhz() && 96 % freq.0 == 0 => {
                (MainClock::Fro96Mhz, 96 / freq.0)
            },
            _ => {

                let pll = Self::get_pll(freq.0);
                // hprintln!("pll {:?}", pll).ok();

                pmc.raw.pdruncfg0.modify(|_, w| w
                    .pden_pll0().poweredoff()
                    .pden_pll0_sscg().poweredoff()
                );

                syscon.raw.pll0ctrl.write(|w| unsafe { w
                    .clken().enable()
                    .seli().bits(pll.seli)
                    .selp().bits(pll.selp)
                });

                syscon.raw.pll0ndec.write(|w| unsafe { w
                    .ndiv().bits(pll.n)
                });
                syscon.raw.pll0ndec.write(|w| unsafe { w
                    .ndiv().bits(pll.n)
                    .nreq().set_bit() // latch
                });

                syscon.raw.pll0pdec.write(|w| unsafe { w
                    .pdiv().bits(pll.p)
                });
                syscon.raw.pll0pdec.write(|w| unsafe { w
                    .pdiv().bits(pll.p)
                    .preq().set_bit() // latch
                });

                syscon.raw.pll0sscg0.write(|w| unsafe { w
                    .md_lbs().bits(0)
                });

                syscon.raw.pll0sscg1.write(|w| unsafe { w
                    .mdiv_ext().bits(pll.m)
                });
                syscon.raw.pll0sscg1.write(|w| unsafe { w
                    .mdiv_ext().bits(pll.m)
                    .mreq().set_bit() // latch
                });

                pmc.raw.pdruncfg0.modify(|_, w| w
                    .pden_pll0().poweredon()
                    .pden_pll0_sscg().poweredon()
                );

                // TODO: wait at least 6 ms
                // SDK uses DWT cycles for fastest possible clock speed to do this

                (MainClock::Pll0, 1)
            }
        };
        assert!(sys_divider < 256);
        let sys_divider = sys_divider as u8;

        if self.support_usbfs && main_clock != MainClock::Fro96Mhz {
            return Err(ClocksError::UsbfsNotFeasible);
        }

        let clocks = Clocks {
            main_clock,
            system_frequency: freq.into(),
        };

        // hprintln!("clocks = {:?}", clocks).ok();

        // set highest flash wait cycles
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());

        match main_clock {
            MainClock::Fro12Mhz => {
                // Fro12
                syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());
                // Main A
                syscon.raw.mainclkselb.modify(|_, w| w.sel().enum_0x0());
                unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(sys_divider - 1)) };
            },
            MainClock::Fro96Mhz => {
                // Fro96
                syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x3());
                // Main B
                syscon.raw.mainclkselb.modify(|_, w| w.sel().enum_0x0());
                unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(sys_divider - 1)) };
            },
            MainClock::Pll0 => {
                // Fro12
                syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());
                // Pll0
                syscon.raw.mainclkselb.modify(|_, w| w.sel().enum_0x1());
                unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(sys_divider - 1)) };

            }
        }

        // fix wait cycles
        let wait_cycles = (freq.0 / 11) + 1;
        unsafe { syscon.raw.fmccr.modify(|_, w| w.flashtim().bits(wait_cycles as u8 - 1)) };

        unsafe { CONFIGURED = true };

        Ok(clocks)

    }
}
