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
        syscon::Syscon,
    },
    time::{
        Hertz,
        U32Ext,
    },
};

#[derive(Debug, Default)]
pub struct ClockRequirements {
    pub main_clock_source: Option<MainClock>,
    pub system_clock_freq: Option<Hertz>,
    // pub fro1mhz: bool,
    pub fro12mhz: bool,
    pub fro96mhz: bool,
    pub support_flexcomm: bool,
    pub support_usbfs: bool,
}

#[derive(Debug)]
pub struct Clocks {
    main_clock_source: MainClock,
    system_clock_freq: Hertz,
    fro12mhz: bool,
    fro96mhz: bool,
}

impl Clocks {
    pub fn support_flexcomm_token(&self) -> Option<ClocksSupportFlexcommToken> {
        match self.fro12mhz {
            true => Some(ClocksSupportFlexcommToken {__: PhantomData} ),
            false => None
        }

    }

    pub fn support_usbfs_token(&self) -> Option<ClocksSupportUsbfsToken> {
        match (self.fro96mhz, self.system_clock_freq >= 12.mhz().into()) {
            (true, true) => Some(ClocksSupportUsbfsToken {__: PhantomData} ),
            _ => None,
        }
    }
}

/// Output of Pll is: M/(2NP) times input
///
/// "There may be several ways to obtain the same PLL output frequency.
/// PLL power depends on Fcco (a lower frequency uses less power) and the divider used.
/// Bypassing the input and/or output divider saves power."

#[allow(dead_code)]
pub struct Pll {
    n: u8,
    m: u16,
    p: u8,
    selp: u16,
    seli: u8,
}

impl Pll {
    // allow user to override if they know better...
    pub unsafe fn new(n: u8, m: u16, p: u8) -> Pll {
        // UM 4.6.6.3.2
        let selp = min((m >> 2) + 1, 31);
        let seli = min(63, match m {
            m if m >= 8000 => 1,
            m if m >= 122 => 8000 / m,
            _ => 2 * (m >> 2) + 3,
        }) as u8;
        // let seli = min(2*(m >> 2) + 3, 63);
        Pll { n, m, p, selp, seli }
    }
}


// generated via `scripts/generate-pll-settings.py`,
// massaged a bit by hand
pub fn get_pll(freq: u32) -> Pll {
    assert!(freq >= 5);
    assert!(freq <= 100);
    // let ns: [u32; 9] = [1, 2, 3, 4, 6, 8, 12, 16, 24];
    let ns: [u32; 2] = [1, 2];
    // let ps: [u32; 11] = [2, 3, 4, 6, 8, 9, 12, 16, 18, 24, 30];
    let ps: [u32; 5] = [6, 8, 12, 16, 24];

    for n in ns.iter() {
        for p in ps.iter() {
            for m in 3..=97 {
                if 2 * freq * (*n) * (*p) == 96 * m {
                    // UM 4.6.6.3.2
                    let selp = (m >> 2) + 1; // <= 31
                    let seli = 2 * (m >> 2) + 3; // <= 63
                    return Pll {
                        n: *n as u8,
                        m: m as u16,
                        p: *p as u8,
                        selp: selp as u16,
                        seli: seli as u8,
                    }
                }
            }
        }
    }

    unreachable!();
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
// - make sure Fro12MHz is running for FLEXCOMM0
// - make sure Fro12 and Fro96 are even powered

impl ClockRequirements {
    // TODO: need all these builder methods?
    // Or have user fill the struct by hand, using the defaults?

    pub fn fro12mhz_main_clock(mut self) -> Self {
        self.main_clock_source = Some(MainClock::Fro12MHz);
        self
    }

    pub fn fro96mhz_main_clock(mut self) -> Self {
        self.main_clock_source = Some(MainClock::Fro96MHz);
        self
    }

    // pub fn with_fro1mhz(mut self) -> Self {
    //     self.fro1mhz = true;
    //     self
    // }

    pub fn with_fro12mhz(mut self) -> Self {
        self.fro12mhz = true;
        self
    }

    pub fn with_fro96mhz(mut self) -> Self {
        self.fro96mhz = true;
        self
    }

    /// Ensures that the resulting clock configuration
    /// supports Flexcomm drivers.
    pub fn support_flexcomm(mut self) -> Self {
        self.support_flexcomm = true;
        self
    }

    /// Ensures that the resulting clock configuration
    /// supports USBFS.
    pub fn support_usbfs(mut self) -> Self {
        self.support_usbfs = true;
        self
    }

    // NB: "The Flexcomm Interface (0 to 7) function clock
    // frequency must not be higher than 48 MHz."
    // pub fn support_flexcomm(mut self) -> Self {
    //     notimplemented!();
    // }

    pub fn system_freq<Freq>(mut self, freq: Freq) -> Self where Freq: Into<Hertz> {
        self.system_clock_freq = Some(freq.into());
        self
    }

    /// Requirements solver - tries to generate and configure a clock configuration
    /// from (partial) requirements.
    ///
    /// It's a bit ridiculous to do this in code, but no idea how to avoid it.
    ///
    /// Can be called only once, to not invalidate previous configurations
    pub fn configure(mut self, anactrl: &mut Anactrl, syscon: &mut Syscon) -> Result<Clocks> {
        if unsafe { CONFIGURED } {
            return Err(ClocksError::AlreadyConfigured);
        }

        if self.support_flexcomm {
            self.fro12mhz = true;
        }

        if self.support_usbfs {
            self.fro96mhz = true;
        }

        // need Fro96MHz for USBFS
        match (self.main_clock_source, self.support_usbfs) {
            (Some(MainClock::Fro12MHz), true) => {
                return Err(ClocksError::UsbfsNotFeasible);
            },
            (None, true) => {
                self.main_clock_source = Some(MainClock::Fro96MHz);
            },
            _ => { }
        }

        // need >= 12MHz for USBFS
        if self.system_clock_freq.is_some() && self.system_clock_freq.unwrap() < 12.mhz().into() {
                return Err(ClocksError::UsbfsNotFeasible);
        }

        let system_clock_freq: Hertz = self.system_clock_freq.unwrap_or(12.mhz().into());

        let main_clock_source = self.main_clock_source.unwrap_or(
            if system_clock_freq > 12.mhz().into() {
                MainClock::Fro96MHz
            } else {
                MainClock::Fro12MHz
            }
        );

        let main_clock_freq: Hertz = match main_clock_source {
            MainClock::Fro12MHz => {
                self.fro12mhz = true;
                12.mhz().into()
            },
            MainClock::Fro96MHz => {
                self.fro96mhz = true;
                96.mhz().into()
            },
        };

        if self.fro12mhz {
            self.fro96mhz = true;
        }

        if self.fro96mhz {
            // turn it on
            anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_96mhzclk().enable());
        }

        // TODO: what does ena_48mhzclk do??

        if self.fro12mhz {
            anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_12mhzclk().enable());
        }

        let sys_divider = {
            if system_clock_freq > main_clock_freq {
                return Err(ClocksError::NotFeasible);
            }
            if main_clock_freq.0 % system_clock_freq.0 != 0 {
                return Err(ClocksError::NotFeasible);
            }
            main_clock_freq.0 / system_clock_freq.0
        };

        if sys_divider >= 256 {
            return Err(ClocksError::NotFeasible);
        }
        let sys_divider = sys_divider as u8;

        // dbg!(sys_divider);

        let clocks = Clocks {
            main_clock_source,
            system_clock_freq: system_clock_freq.into(),
            fro12mhz: self.fro12mhz,
            fro96mhz: self.fro96mhz,
        };

        // set highest flash wait cycles
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());

        // set main clock
        match main_clock_source {
            MainClock::Fro12MHz => {
                anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_12mhzclk().enable());
                syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());
            },

            MainClock::Fro96MHz => {
                anactrl.raw.fro192m_ctrl.modify(|_, w| w.ena_96mhzclk().enable());
                syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x3());
            },
        }

        // set system clock divider
        unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(sys_divider - 1)) };

        // fix wait cycles
        // TODO
        let mut system_clock_freq_mhz = system_clock_freq.0 / 1_000_000;
        if system_clock_freq.0 % 1_000_000 != 0 {
            system_clock_freq_mhz += 1;
        }
        let wait_cycles = (system_clock_freq_mhz / 11) + 1;
            // 0..11 => 1, 12..22 => 2, 23..33 => 3, 34..44 => 4, 45..55 => 5,
            // 56..66 => 6, 67..77 => 7, 78..88 => 8, _ => 9, };
        unsafe { syscon.raw.fmccr.modify(|_, w| w.flashtim().bits(wait_cycles as u8 - 1)) };


        // syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());

        // configure peripheral clocks if necessary

        unsafe { CONFIGURED = true };

        Ok(clocks)

    }
}

// pub struct Clocks<State: clock_state::ClockState = clock_state::Frozen> {
//     main_clock: MainClock,
//     fro12mhz_enabled: Option<bool>,
//     fro96mhz_enabled: Option<bool>,
//     valid_usb: bool,
//     _state: State,
// }

// static mut TAKEN: bool = false;

// impl Clocks<clock_state::Configurable> {
//     // pub fn new() -> Clocks<clock_state::Configurable> {
//     //     Clocks {
//     //         main_clock: MainClock::Unknown,
//     //         valid_usb: false,
//     //         _state: clock_state::Configurable,
//     //     }
//     // }

//     pub fn take() -> Option<Self> {
//         if unsafe { TAKEN } {
//             None
//         } else {
//             Some({
//                 unsafe { TAKEN = true };
//                 Clocks {
//                     main_clock: MainClock::Unknown,
//                     fro12mhz_enabled: None,
//                     fro96mhz_enabled: None,
//                     valid_usb: false,
//                     _state: clock_state::Configurable,
//                 }
//             })
//         }
//     }

// }

// impl Clocks<clock_state::Configurable> {
//     pub fn use_fro12mhz_as_main(self, anactrl: &mut Anactrl, syscon: &mut Syscon) -> Self {
//         // // briefly switch to Fro1MHz
//         // syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x2());
//         anactrl.

//         // configure Fro12Mhz
//         syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim4());
//         unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };

//         // use Fro12Mhz
//         // syscon.fro_12m_as_main_clk();
//         syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

//         Clocks {
//             main_clock: MainClock::Fro12MHz,
//             valid_usb: false,
//             _state: clock_state::Configurable,
//         }
//     }

//     pub fn use_fro96mhz_as_main(self, syscon: &mut Syscon) -> Self {
//         // briefly switch to Fro12MHz
//         // Philosophically, would want to use Fro1MHz here, but it crashes the debugger?!
//         syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

//         // configure Fro96Mhz
//         syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());
//         unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };

//         // use Fro96Mhz
//         syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x3());

//         Clocks {
//             main_clock: MainClock::Fro96MHz,
//             valid_usb: false,
//             _state: clock_state::Configurable,
//         }
//     }

//     pub fn configure_usb(self, syscon: &mut Syscon) -> Self {
//         match self.main_clock {
//             MainClock::Fro96MHz => {
//                 unsafe { syscon.raw.usb0clkdiv.modify(|_, w| w.div().bits(1)) };
//                 syscon.raw.usb0clkdiv.modify(|_, w| w.halt().run());
//                 syscon.raw.usb0clksel.modify(|_, w| w.sel().enum_0x0());
//                 while syscon.raw.usb0clkdiv.read().reqflag().is_ongoing() {}

//                 Clocks {
//                     main_clock: MainClock::Fro96MHz,
//                     valid_usb: true,
//             _state: clock_state::Configurable,
//                 }
//             },
//             _ => { unimplemented!() },
//         }
//     }

//     pub fn freeze(self) -> Clocks<clock_state::Frozen> {
//         Clocks {
//             main_clock: self.main_clock,
//             valid_usb: self.valid_usb,
//             _state: clock_state::Frozen,
//         }
//     }
// }

// impl Clocks<clock_state::Frozen> {
//     pub fn valid_usb_clock_token(&self) -> Option<ValidUsbClockToken> {
//         // Clippy complains...
//         // match self.valid_usb {
//         //     true => Some(ValidUsbClockToken{_private: PhantomData}),
//         //     false => None,
//         // }
//         if self.valid_usb {
//            Some(ValidUsbClockToken{__: PhantomData})
//         } else {
//             None
//         }
//     }
// }
