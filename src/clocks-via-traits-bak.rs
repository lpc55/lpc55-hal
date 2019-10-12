use crate::states::main_clock::*;
use crate::syscon::Syscon;
// use main_clock::*;

// pub mod main_clock {
//     pub trait MainClock {}

//     pub struct Unknown;
//     impl MainClock for Unknown {}

//     pub struct Fro12Mhz;
//     impl MainClock for Fro12Mhz {}

//     pub struct Fro96Mhz;
//     impl MainClock for Fro96Mhz {}

//     pub struct Fro1Mhz;
//     impl MainClock for Fro12Mhz {}

//     pub struct Fro1Mhz;
//     impl MainClock for Fro96Mhz {}
// }

// use hal::{reg_read, reg_modify};

// TODO: as of now, this is unsafe.
// Need to implement "freezing" the clocktree configuration

pub struct Clocks<MAIN: MainClock = Unknown> {
    main_clock: MAIN,
    pub valid_usb: bool,
}

impl Clocks {
    pub fn new() -> Clocks {
        Clocks {
            main_clock: Unknown,
            valid_usb: false,
        }
    }
}

    // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x0); // FRO 12 MHz
    // reg_modify!(hal, SYSCON, fmccr, flashtim, flashtim8);
    // unsafe { reg_modify!(hal, SYSCON, ahbclkdiv, div, 0u8) }; // This is actually the reset value
    // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x3); // FRO 96 MHz
    // unsafe { reg_modify!(hal, SYSCON, usb0clkdiv, div, 1u8) };
    // reg_modify!(hal, SYSCON, usb0clkdiv, halt, run); // <-- toootally don't forget this ~groans~
    // reg_modify!(hal, SYSCON, usb0clksel, sel, enum_0x0); // FRO 96 MHz

impl<MAIN: MainClock> Clocks<MAIN> {
    pub fn use_fro12mhz_as_main(self, syscon: &mut Syscon) -> Clocks<Fro12Mhz> {
        // briefly switch to Fro1MHz
        // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x2);
        // syscon.fro1mhz_as_main_clk();
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x2());

        // configure Fro12Mhz
        // reg_modify!(hal, SYSCON, fmccr, flashtim, flashtim4);
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim4());
        // unsafe { reg_modify!(hal, SYSCON, ahbclkdiv, div, 0u8) }
        unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };

        // use Fro12Mhz
        // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x0);
        // syscon.fro_12m_as_main_clk();
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

        Clocks {
            main_clock: Fro12Mhz,
            valid_usb: false,
        }
    }

    pub fn use_fro96mhz_as_main(self, syscon: &mut Syscon) -> Clocks<Fro96Mhz> {
        // briefly switch to Fro1MHz
        // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x2);
        // syscon.fro1mhz_as_main_clk();
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

        // configure Fro96Mhz
        // reg_modify!(hal, SYSCON, fmccr, flashtim, flashtim8);
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());
        unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };
        // unsafe { reg_modify!(hal, SYSCON, ahbclkdiv, div, 0u8) };

        // use Fro96Mhz
        // reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x3);
        // syscon.fro_96m_as_main_clk();
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x3());

        Clocks {
            main_clock: Fro96Mhz,
            valid_usb: false,
        }
    }
}

impl Clocks<Fro96Mhz> {
    pub fn enable_usb(self, syscon: &mut Syscon) -> Self {
        // unsafe { reg_modify!(hal, SYSCON, usb0clkdiv, div, 1u8) };
        unsafe { syscon.raw.usb0clkdiv.modify(|_, w| w.div().bits(1)) };
        // reg_modify!(hal, SYSCON, usb0clkdiv, halt, run); // <-- toootally don't forget this ~groans~
        syscon.raw.usb0clkdiv.modify(|_, w| w.halt().run());
        // reg_modify!(hal, SYSCON, usb0clksel, sel, enum_0x0); // FRO 96 MHz
        syscon.raw.usb0clksel.modify(|_, w| w.sel().enum_0x0());
        while syscon.raw.usb0clkdiv.read().reqflag().is_ongoing() {}
        // while reg_read!(SYSCON, usb0clkdiv, reqflag, is_ongoing) {}  // never stops for div=1 *before* selecting it

        Clocks {
            main_clock: Fro96Mhz,
            valid_usb: true,
        }
    }
}
