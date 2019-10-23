///! API to configure the clocks.
///!
///! This is very incomplete (e.g., no support for PLL clocks).
///!
///! It is currently used to prepare for using the USBFSD peripheral,
use core::marker::PhantomData;
use crate::states::{
    main_clock::MainClock,
    // clock_state,
    ClocksSupportUsbfsToken,
};
use crate::{
    anactrl::Anactrl,
    pmc::Pmc,
    syscon::Syscon,
};

// use cortex_m_semihosting::dbg;

#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Hertz(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Megahertz(pub u32);

impl Into<Hertz> for Megahertz {
    fn into(self) -> Hertz {
        Hertz(self.0 * 1_000_000)
    }
}

impl Into<Hertz> for u32 {
    fn into(self) -> Hertz {
        Hertz(self)
    }
}

pub trait U32Ext {
    /// Wrap in `Hertz`
    fn hz(self) -> Hertz;

    /// Wrap in `MegaHertz`
    fn mhz(self) -> Megahertz;
}

impl U32Ext for u32 {
    fn hz(self) -> Hertz {
        Hertz(self)
    }

    fn mhz(self) -> Megahertz {
        Megahertz(self)
    }
}

#[derive(Debug, Default)]
pub struct ClockRequirements {
    pub main_clock_source: Option<MainClock>,
    pub system_clock_freq: Option<Hertz>,
    pub support_usbfs: bool,
}

/// The PhantomData makes this unconstructable
#[derive(Debug)]
pub struct Clocks {
    main_clock_source: MainClock,
    system_clock_freq: Hertz,
}

impl Clocks {
    pub fn support_usbfs_token(&self) -> Option<ClocksSupportUsbfsToken> {
        match (self.main_clock_source, self.system_clock_freq >= 12_000_000.into()) {
            (MainClock::Fro96MHz, true) => Some(ClocksSupportUsbfsToken {__: PhantomData} ),
            _ => None,
        }
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

    /// Ensures that the resulting clock configuration
    /// supports USBFS.
    pub fn support_usbfs(mut self) -> Self {
        self.support_usbfs = true;
        self
    }

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
    pub fn configure(mut self, anactrl: &mut Anactrl, pmc: &mut Pmc, syscon: &mut Syscon) -> Result<Clocks> {
        if unsafe { CONFIGURED } {
            return Err(ClocksError::AlreadyConfigured);
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
        if self.system_clock_freq.is_some() && self.system_clock_freq.unwrap() < 12_000_000.into() {
                return Err(ClocksError::UsbfsNotFeasible);
        }

        let system_clock_freq: u32 = self.system_clock_freq.unwrap_or(Megahertz(12).into()).0;

        let main_clock_source = self.main_clock_source.unwrap_or(
            if system_clock_freq > 12_000_000 {
                MainClock::Fro96MHz
            } else {
                MainClock::Fro12MHz
            }
        );

        let main_clock_freq: u32 = match main_clock_source {
            MainClock::Fro12MHz => 12_000_000,
            MainClock::Fro96MHz => 96_000_000,
        };

        let sys_divider = {
            if system_clock_freq > main_clock_freq {
                return Err(ClocksError::NotFeasible);
            }
            if main_clock_freq % system_clock_freq != 0 {
                return Err(ClocksError::NotFeasible);
            }
            main_clock_freq / system_clock_freq
        };

        if sys_divider >= 256 {
            return Err(ClocksError::NotFeasible);
        }
        let sys_divider = sys_divider as u8;

        // dbg!(sys_divider);

        let clocks = Clocks {
            main_clock_source,
            system_clock_freq: system_clock_freq.into(),
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
        let mut system_clock_freq_mhz = system_clock_freq / 1_000_000;
        if system_clock_freq % 1_000_000 != 0 {
            system_clock_freq_mhz += 1;
        }
        let wait_cycles = (system_clock_freq_mhz / 11) + 1;
            // 0..11 => 1,
            // 12..22 => 2,
            // 23..33 => 3,
            // 34..44 => 4,
            // 45..55 => 5,
            // 56..66 => 6,
            // 67..77 => 7,
            // 78..88 => 8,
            // _ => 9,
        // };
        // dbg!(wait_cycles);
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
