use core::marker::PhantomData;
use crate::states::{
    main_clock::MainClock,
    clock_state,
    ValidUsbClockToken,
};
use crate::syscon::Syscon;

pub struct Clocks<State: clock_state::ClockState = clock_state::Frozen> {
    main_clock: MainClock,
    valid_usb: bool,
    _state: State,
}

static mut TAKEN: bool = false;

impl Clocks<clock_state::Configurable> {
    // pub fn new() -> Clocks<clock_state::Configurable> {
    //     Clocks {
    //         main_clock: MainClock::Unknown,
    //         valid_usb: false,
    //         _state: clock_state::Configurable,
    //     }
    // }

    pub fn take() -> Option<Self> {
        if unsafe { TAKEN } {
            None
        } else {
            Some({
                unsafe { TAKEN = true };
                Clocks {
                    main_clock: MainClock::Unknown,
                    valid_usb: false,
                    _state: clock_state::Configurable,
                }
            })
        }
    }

}

impl Clocks<clock_state::Configurable> {
    pub fn use_fro12mhz_as_main(self, syscon: &mut Syscon) -> Self {
        // // briefly switch to Fro1MHz
        // syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x2());

        // configure Fro12Mhz
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim4());
        unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };

        // use Fro12Mhz
        // syscon.fro_12m_as_main_clk();
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

        Clocks {
            main_clock: MainClock::Fro12MHz,
            valid_usb: false,
            _state: clock_state::Configurable,
        }
    }

    pub fn use_fro96mhz_as_main(self, syscon: &mut Syscon) -> Self {
        // briefly switch to Fro12MHz
        // Philosophically, would want to use Fro1MHz here, but it crashes the debugger?!
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x0());

        // configure Fro96Mhz
        syscon.raw.fmccr.modify(|_, w| w.flashtim().flashtim8());
        unsafe { syscon.raw.ahbclkdiv.modify(|_, w| w.div().bits(0)) };

        // use Fro96Mhz
        syscon.raw.mainclksela.modify(|_, w| w.sel().enum_0x3());

        Clocks {
            main_clock: MainClock::Fro96MHz,
            valid_usb: false,
            _state: clock_state::Configurable,
        }
    }

    pub fn configure_usb(self, syscon: &mut Syscon) -> Self {
        match self.main_clock {
            MainClock::Fro96MHz => {
                unsafe { syscon.raw.usb0clkdiv.modify(|_, w| w.div().bits(1)) };
                syscon.raw.usb0clkdiv.modify(|_, w| w.halt().run());
                syscon.raw.usb0clksel.modify(|_, w| w.sel().enum_0x0());
                while syscon.raw.usb0clkdiv.read().reqflag().is_ongoing() {}

                Clocks {
                    main_clock: MainClock::Fro96MHz,
                    valid_usb: true,
            _state: clock_state::Configurable,
                }
            },
            _ => { unimplemented!() },
        }
    }

    pub fn freeze(self) -> Clocks<clock_state::Frozen> {
        Clocks {
            main_clock: self.main_clock,
            valid_usb: self.valid_usb,
            _state: clock_state::Frozen,
        }
    }
}

impl Clocks<clock_state::Frozen> {
    pub fn valid_usb_clock_token(&self) -> Option<ValidUsbClockToken> {
        // Clippy complains...
        // match self.valid_usb {
        //     true => Some(ValidUsbClockToken{_private: PhantomData}),
        //     false => None,
        // }
        if self.valid_usb {
           Some(ValidUsbClockToken{__: PhantomData})
        } else {
            None
        }
    }
}
