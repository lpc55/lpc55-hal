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

use crate::raw;
use crate::{clock, states::init_state};

/// Entry point to the SYSCON API
pub struct Syscon {
    // TODO: do we want init_state here too?
    raw: raw::SYSCON,
}

pub fn wrap(syscon: raw::SYSCON) -> Syscon {
    Syscon::new(syscon)
}

impl Syscon {
    pub fn release(self) -> raw::SYSCON {
        self.raw
    }
}

impl Syscon {
    pub fn new(syscon: raw::SYSCON) -> Self {
        Syscon { raw: syscon }
    }

    // TODO: relocate
    pub fn rev_id(&self) -> u8 {
        self.raw.dieid.read().rev_id().bits()
    }
}

/// The main API for the SYSCON peripheral
///
/// Provides access to all types that make up the SYSCON API. Please refer to
/// the [module documentation] for more information.
///
/// [module documentation]: index.html
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

impl Syscon {
    /// Enables the clock for a peripheral or other hardware component
    pub fn enable_clock<P: ClockControl>(&mut self, peripheral: &mut P) {
        peripheral.enable_clock(self);
    }

    /// Disable peripheral clock
    pub fn disable_clock<P: ClockControl>(&mut self, peripheral: &mut P) {
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
    fn enable_clock(&self, s: &mut Syscon);

    /// Internal method to disable a peripheral clock
    fn disable_clock(&self, s: &mut Syscon);

    /// Check if peripheral clock is enabled
    fn is_clock_enabled(&self, s: &Syscon) -> bool;
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
            fn enable_clock(&self, s: &mut Syscon) {
                s.raw.$register.modify(|_, w| w.$clock().enable());
            }

            fn disable_clock(&self, s: &mut Syscon) {
                s.raw.$register.modify(|_, w| w.$clock().disable());
            }

            fn is_clock_enabled(&self, s: &Syscon) -> bool {
                s.raw.$register.read().$clock().is_enable()
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
    fn enable_clock(&self, s: &mut Syscon) {
        s.raw.ahbclkctrl0.modify(|_, w| w.gpio0().enable());
        s.raw.ahbclkctrl0.modify(|_, w| w.gpio1().enable());
    }

    fn disable_clock(&self, s: &mut Syscon) {
        s.raw.ahbclkctrl0.modify(|_, w| w.gpio0().disable());
        s.raw.ahbclkctrl0.modify(|_, w| w.gpio1().disable());
    }

    #[allow(clippy::nonminimal_bool)]
    fn is_clock_enabled(&self, s: &Syscon) -> bool {
        s.raw.ahbclkctrl0.read().gpio0().is_enable() && s.raw.ahbclkctrl0.read().gpio1().is_enable()
    }
}

/*
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
*/

static mut FRO1MHZUTICKCLOCK_TAKEN: bool = false;

pub struct Fro1MhzUtickClock<State = init_state::Disabled> {
    _state: State,
}

impl Fro1MhzUtickClock<init_state::Disabled> {
    pub fn take() -> Option<Self> {
        if unsafe { FRO1MHZUTICKCLOCK_TAKEN } {
            None
        } else {
            Some(unsafe {
                FRO1MHZUTICKCLOCK_TAKEN = true;
                Fro1MhzUtickClock::steal()
            })
        }
    }

    pub fn release(self) {
        unsafe { FRO1MHZUTICKCLOCK_TAKEN = false };
    }

    pub unsafe fn steal() -> Self {
        Fro1MhzUtickClock {
            _state: init_state::Disabled,
        }
    }

    /// Enable the FRO1MHZ UTICK clock
    pub fn enable(self, syscon: &mut Syscon) -> Fro1MhzUtickClock<init_state::Enabled> {
        syscon
            .raw
            .clock_ctrl
            .modify(|_, w| w.fro1mhz_utick_ena().enable());

        Fro1MhzUtickClock {
            _state: init_state::Enabled(()),
        }
    }
}

impl Fro1MhzUtickClock<init_state::Enabled> {
    /// Disable the FRO1MHZ UTICK clock
    pub fn disable(self, syscon: &mut Syscon) -> Fro1MhzUtickClock<init_state::Disabled> {
        syscon
            .raw
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
