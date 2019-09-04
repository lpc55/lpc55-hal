//! API for system configuration (SYSCON)
//!
//! The entry point to this API is [`SYSCON`]. Please refer to [`SYSCON`]'s
//! documentation for additional information.
//!
//! This module mostly provides infrastructure required by other parts of the
//! HAL API. For this reason, only a small subset of SYSCON functionality is
//! currently implemented.
//!
//! The SYSCON peripheral is described in the user manual, chapter 4.

// use core::marker::PhantomData;

// use crate::raw::syscon::{
//     // pdruncfg, presetctrl, starterp1, sysahbclkctrl, PDRUNCFG, PRESETCTRL, STARTERP1, SYSAHBCLKCTRL,
//     // UARTCLKDIV, UARTFRGDIV, UARTFRGMULT,
// };

// use cortex_m_semihosting::dbg;

use crate::raw::syscon::{
    // ahbclkctrl0, ahbclkctrl1, ahbclkctrl2, // clock_ctrl,
    AHBCLKCTRL0,
    AHBCLKCTRL1,
    AHBCLKCTRL2,
    CLOCK_CTRL,
    // presetctrl0, presetctrl1, presetctrl2,  // clock_ctrl,
    PRESETCTRL0,
    PRESETCTRL1,
    PRESETCTRL2,
};

use crate::reg;
use crate::{clock, init_state};

// Let's see if this is overengineered or not, maybe remove
use crate::reg_proxy::RegProxy;

/// Entry point to the SYSCON API
///
/// The SYSCON API is split into multiple parts, which are all available through
/// [`syscon::Parts`]. You can use [`SYSCON::split`] to gain access to
/// [`syscon::Parts`].
///
/// You can also use this struct to gain access to the raw peripheral using
/// [`SYSCON::free`]. This is the main reason this struct exists, as it's no
/// longer possible to do this after the API has been split.
///
/// Use [`Peripherals`] to gain access to an instance of this struct.
///
/// Please refer to the [module documentation] for more information.
///
/// [`syscon::Parts`]: struct.Parts.html
/// [`Peripherals`]: ../struct.Peripherals.html
/// [module documentation]: index.html
pub struct SYSCON {
    syscon: raw::SYSCON,
}

impl SYSCON {
    pub fn new(syscon: raw::SYSCON) -> Self {
        SYSCON { syscon }
    }

    pub fn split(self) -> Parts {
        Parts {
            handle: Handle {
                ahbclkctrl0: RegProxy::new(),
                ahbclkctrl1: RegProxy::new(),
                ahbclkctrl2: RegProxy::new(),
                clock_ctrl: RegProxy::new(),
                presetctrl0: RegProxy::new(),
                presetctrl1: RegProxy::new(),
                presetctrl2: RegProxy::new(),
            },
            fro_1mhz_utick_clock: Fro1MhzUtickClock::new(),
        }
    }

    // TODO: relocate
    pub fn rev_id(&self) -> u8 {
        self.syscon.dieid.read().rev_id().bits()
    }
}

/// The main API for the SYSCON peripheral
///
/// Provides access to all types that make up the SYSCON API. Please refer to
/// the [module documentation] for more information.
///
/// [module documentation]: index.html
pub struct Parts {
    pub handle: Handle,
    pub fro_1mhz_utick_clock: Fro1MhzUtickClock<init_state::Disabled>,
    // more to come obviously
}

/// Handle to the SYSCON peripheral
///
/// This handle to the SYSCON peripheral provides access to the main part of the
/// SYSCON API. It is also required by other parts of the HAL API to synchronize
/// access the the underlying registers, wherever this is required.
///
/// Please refer to the [module documentation] for more information about the
/// PMU.
///
/// [module documentation]: index.html
pub struct Handle {
    ahbclkctrl0: RegProxy<AHBCLKCTRL0>,
    ahbclkctrl1: RegProxy<AHBCLKCTRL1>,
    ahbclkctrl2: RegProxy<AHBCLKCTRL2>,
    clock_ctrl: RegProxy<CLOCK_CTRL>,
    presetctrl0: RegProxy<PRESETCTRL0>,
    presetctrl1: RegProxy<PRESETCTRL1>,
    presetctrl2: RegProxy<PRESETCTRL2>,
}

reg!(AHBCLKCTRL0, AHBCLKCTRL0, raw::SYSCON, ahbclkctrl0);
reg!(AHBCLKCTRL1, AHBCLKCTRL1, raw::SYSCON, ahbclkctrl1);
reg!(AHBCLKCTRL2, AHBCLKCTRL2, raw::SYSCON, ahbclkctrl2);
reg!(CLOCK_CTRL, CLOCK_CTRL, raw::SYSCON, clock_ctrl);
reg!(PRESETCTRL0, PRESETCTRL0, raw::SYSCON, presetctrl0);
reg!(PRESETCTRL1, PRESETCTRL1, raw::SYSCON, presetctrl1);
reg!(PRESETCTRL2, PRESETCTRL2, raw::SYSCON, presetctrl2);

impl Handle {
    /// Enables the clock for a peripheral or other hardware component
    pub fn enable_clock<P: ClockControl>(&mut self, peripheral: &P) {
        peripheral.enable_clock(self);
    }

    /// Disable peripheral clock
    pub fn disable_clock<P: ClockControl>(&mut self, peripheral: &P) {
        peripheral.disable_clock(self);
    }

    /// Check if peripheral clock is enabled
    pub fn is_clock_enabled<P: ClockControl>(&self, peripheral: &P) -> bool {
        peripheral.is_clock_enabled(&self)
    }
}

/// Internal trait for controlling peripheral clocks
///
/// This trait is an internal implementation detail and should neither be
/// implemented nor used outside of LPC82x HAL. Any changes to this trait won't
/// be considered breaking changes.
///
/// Compared to https://git.io/fjpf9 (in lpc-rs/lpc8xx-hal/lpc8xx-hal-common)
/// we use a less minimal API in order to hide the fact that there are three
/// different AHLBCKLCTRL?, which a HAL user shouldn't really need to know about.
pub trait ClockControl {
    /// Internal method to enable a peripheral clock
    fn enable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle;

    /// Internal method to disable a peripheral clock
    fn disable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle;

    /// Check if peripheral clock is enabled
    fn is_clock_enabled(&self, r: &Handle) -> bool;
}

//
// Unwrapped implementation for easier understanding
//
// impl ClockControl for raw::UTICK {
//     fn enable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
//         h.ahbclkctrl1.modify(|_, w| w.utick0().enable());
//         h
//     }

//     fn disable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
//         h.ahbclkctrl1.modify(|_, w| w.utick0().disable());
//         h
//     }

//     fn is_clock_enabled(&self, h: &Handle) -> bool {
//         h.ahbclkctrl1.read().utick0().is_enable()
//     }
// }

macro_rules! impl_clock_control {
    ($clock_control:ty, $clock:ident, $register:ident) => {
        impl ClockControl for $clock_control {
            fn enable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
                h.$register.modify(|_, w| w.$clock().enable());
                h
            }

            fn disable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
                h.$register.modify(|_, w| w.$clock().disable());
                h
            }

            fn is_clock_enabled(&self, h: &Handle) -> bool {
                h.$register.read().$clock().is_enable()
            }
        }
    };
}

impl_clock_control!(raw::ADC0, adc, ahbclkctrl0);
impl_clock_control!(raw::FLASH, flash, ahbclkctrl0);
impl_clock_control!(raw::IOCON, iocon, ahbclkctrl0);
impl_clock_control!(raw::GINT0, gint, ahbclkctrl0);
impl_clock_control!(raw::PINT, pint, ahbclkctrl0);

impl_clock_control!(raw::USB0, usb0_dev, ahbclkctrl1);
impl_clock_control!(raw::UTICK, utick0, ahbclkctrl1);

impl_clock_control!(raw::ANACTRL, analog_ctrl, ahbclkctrl2);
impl_clock_control!(raw::CASPER, casper, ahbclkctrl2);
// there is no GPIO_SEC. what to do? create a PhantomData one?
// impl_clock_control!(raw::GPIO_SEC, gpio_sec, ahbclkctrl2);
impl_clock_control!(raw::PUF, puf, ahbclkctrl2);
impl_clock_control!(raw::RNG, rng, ahbclkctrl2);

// GPIO needs a separate implementation
impl ClockControl for raw::GPIO {
    // There are all these GPIO? registers, but only GPIO0 and GPIO1
    // actually exist according to UM
    fn enable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
        h.ahbclkctrl0.modify(|_, w| w.gpio0().enable());
        h.ahbclkctrl0.modify(|_, w| w.gpio1().enable());
        // h.ahbclkctrl0.modify(|_, w| w.gpio2().enable());
        // h.ahbclkctrl0.modify(|_, w| w.gpio3().enable());
        // h.ahbclkctrl2.modify(|_, w| w.gpio4().enable());
        // h.ahbclkctrl2.modify(|_, w| w.gpio5().enable());
        h
    }

    fn disable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
        h.ahbclkctrl0.modify(|_, w| w.gpio0().disable());
        h.ahbclkctrl0.modify(|_, w| w.gpio1().disable());
        // h.ahbclkctrl0.modify(|_, w| w.gpio2().disable());
        // h.ahbclkctrl0.modify(|_, w| w.gpio3().disable());
        // h.ahbclkctrl2.modify(|_, w| w.gpio4().disable());
        // h.ahbclkctrl2.modify(|_, w| w.gpio5().disable());
        h
    }

    #[allow(clippy::nonminimal_bool)]
    fn is_clock_enabled(&self, h: &Handle) -> bool {
        h.ahbclkctrl0.read().gpio0().is_enable() &&
        h.ahbclkctrl0.read().gpio1().is_enable() &&
        // h.ahbclkctrl0.read().gpio2().is_enable() &&
        // h.ahbclkctrl0.read().gpio3().is_enable() &&
        // h.ahbclkctrl2.read().gpio4().is_enable() &&
        // h.ahbclkctrl2.read().gpio5().is_enable() &&
        true
    }
}

pub trait ResetControl {
    /// Internal method to assert peripheral reset
    fn assert_reset<'h>(&self, h: &'h mut Handle) -> &'h mut Handle;

    /// Internal method to clear peripheral reset
    fn clear_reset<'h>(&self, h: &'h mut Handle) -> &'h mut Handle;
}

// TODO: check whether we're calling asserted/released is correct
macro_rules! impl_reset_control {
    ($reset_control:ty, $field:ident, $register:ident) => {
        impl<'a> ResetControl for $reset_control {
            fn assert_reset<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
                h.$register.modify(|_, w| w.$field().asserted());
                h
            }

            fn clear_reset<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
                h.$register.modify(|_, w| w.$field().released());
                h
            }
        }
    };
}

// to be completed
impl_reset_control!(raw::IOCON, iocon_rst, presetctrl0);
impl_reset_control!(raw::CASPER, casper_rst, presetctrl2);
impl_reset_control!(raw::UTICK, utick0_rst, presetctrl1);
impl_reset_control!(raw::USB0, usb0_dev_rst, presetctrl1);

pub struct Fro1MhzUtickClock<State = init_state::Disabled> {
    _state: State,
}

impl Fro1MhzUtickClock<init_state::Disabled> {
    pub(crate) fn new() -> Self {
        Fro1MhzUtickClock {
            _state: init_state::Disabled,
        }
    }

    /// Enable the FRO1MHZ UTICK clock
    pub fn enable(self, syscon: &mut Handle) -> Fro1MhzUtickClock<init_state::Enabled> {
        syscon
            .clock_ctrl
            .modify(|_, w| w.fro1mhz_utick_ena().enable());

        Fro1MhzUtickClock {
            _state: init_state::Enabled(()),
        }
    }
}

impl Fro1MhzUtickClock<init_state::Enabled> {
    /// Disable the FRO1MHZ UTICK clock
    pub fn disable(self, syscon: &mut Handle) -> Fro1MhzUtickClock<init_state::Disabled> {
        syscon
            .clock_ctrl
            .modify(|_, w| w.fro1mhz_utick_ena().disable());

        Fro1MhzUtickClock {
            _state: init_state::Disabled,
        }
    }
}

impl<State> clock::Frequency for Fro1MhzUtickClock<State> {
    fn hz(&self) -> u32 {
        1_000_000
    }
}

impl clock::Enabled for Fro1MhzUtickClock<init_state::Enabled> {}
