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

use cortex_m_semihosting::dbg;

use crate::raw::syscon::{
    ahbclkctrl0, ahbclkctrl1, ahbclkctrl2,  // clock_ctrl,
    AHBCLKCTRL0, AHBCLKCTRL1, AHBCLKCTRL2,  // CLOCK_CTRL,
    // presetctrl0, presetctrl1, presetctrl2,  // clock_ctrl,
    // PRESETCTRL0, PRESETCTRL1, PRESETCTRL2,  // CLOCK_CTRL,
};

use crate::reg;

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
                // clock_ctrl: RegProxy::new(),
                ahbclkctrl0: RegProxy::new(),
                ahbclkctrl1: RegProxy::new(),
                ahbclkctrl2: RegProxy::new(),
            },
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
    // clock_ctrl: RegProxy<CLOCK_CTRL>,
    ahbclkctrl0: RegProxy<AHBCLKCTRL0>,
    #[allow(dead_code)]
    ahbclkctrl1: RegProxy<AHBCLKCTRL1>,
    ahbclkctrl2: RegProxy<AHBCLKCTRL2>,
}

// reg!(CLOCK_CTRL, CLOCK_CTRL, raw::SYSCON, clock_ctrl);
reg!(AHBCLKCTRL0, AHBCLKCTRL0, raw::SYSCON, ahbclkctrl0);
reg!(AHBCLKCTRL1, AHBCLKCTRL1, raw::SYSCON, ahbclkctrl1);
reg!(AHBCLKCTRL2, AHBCLKCTRL2, raw::SYSCON, ahbclkctrl2);

impl Handle {
    /// Enable peripheral clock

    /// Enables the clock for a peripheral or other hardware component. HAL
    /// users usually won't have to call this method directly, as other
    /// peripheral APIs will do this for them.
    pub fn enable_clock0<P: ClockControl0>(&mut self, peripheral: &P) {
        self.ahbclkctrl0.modify(|_, w| peripheral.enable_clock(w));
    }

    /// Disable peripheral clock
    pub fn disable_clock0<P: ClockControl0>(&mut self, peripheral: &P) {
        self.ahbclkctrl0
            .modify(|_, w| peripheral.disable_clock(w));
    }

    /// Check if peripheral clock is enabled
    pub fn is_clock_enabled0<P: ClockControl0>(&self, peripheral: &P) -> bool {
        peripheral.is_clock_enabled(&self.ahbclkctrl0.read())
    }

    /// Enables the clock for a peripheral or other hardware component
    pub fn enable_clock1<P: ClockControl1>(&mut self, peripheral: &P) {
        self.ahbclkctrl1.modify(|_, w| peripheral.enable_clock(w));
    }

    /// Disable peripheral clock
    pub fn disable_clock1<P: ClockControl1>(&mut self, peripheral: &P) {
        self.ahbclkctrl1
            .modify(|_, w| peripheral.disable_clock(w));
    }

    /// Check if peripheral clock is enabled
    pub fn is_clock_enabled1<P: ClockControl1>(&self, peripheral: &P) -> bool {
        peripheral.is_clock_enabled(&self.ahbclkctrl1.read())
    }

    /// Enables the clock for a peripheral or other hardware component
    pub fn enable_clock2<P: ClockControl2>(&mut self, peripheral: &P) {
        self.ahbclkctrl2.modify(|_, w| peripheral.enable_clock(w));
    }

    /// Disable peripheral clock
    pub fn disable_clock2<P: ClockControl2>(&mut self, peripheral: &P) {
        self.ahbclkctrl2
            .modify(|_, w| peripheral.disable_clock(w));
    }

    /// Check if peripheral clock is enabled
    pub fn is_clock_enabled2<P: ClockControl2>(&self, peripheral: &P) -> bool {
        peripheral.is_clock_enabled(&self.ahbclkctrl2.read())
    }

}

/// Internal trait for controlling peripheral clocks
///
/// This trait is an internal implementation detail and should neither be
/// implemented nor used outside of LPC82x HAL. Any changes to this trait won't
/// be considered breaking changes.
///
///// Please refer to [`syscon::Handle::enable_clock`] and
///// [`syscon::Handle::disable_clock`] for the public API that uses this trait.
/////
///// [`syscon::Handle::enable_clock`]: struct.Handle.html#method.enable_clock
///// [`syscon::Handle::disable_clock`]: struct.Handle.html#method.disable_clock
pub trait ClockControl0 {
    /// Internal method to enable a peripheral clock
    fn enable_clock<'w>(&self, w: &'w mut ahbclkctrl0::W) -> &'w mut ahbclkctrl0::W;

    /// Internal method to disable a peripheral clock
    fn disable_clock<'w>(&self, w: &'w mut ahbclkctrl0::W) -> &'w mut ahbclkctrl0::W;

    /// Check if peripheral clock is enabled
    fn is_clock_enabled(&self, r: &ahbclkctrl0::R) -> bool;

}

pub trait ClockControl1 {
    /// Internal method to enable a peripheral clock
    fn enable_clock<'w>(&self, w: &'w mut ahbclkctrl1::W) -> &'w mut ahbclkctrl1::W;

    /// Internal method to disable a peripheral clock
    fn disable_clock<'w>(&self, w: &'w mut ahbclkctrl1::W) -> &'w mut ahbclkctrl1::W;

    /// Check if peripheral clock is enabled
    fn is_clock_enabled(&self, r: &ahbclkctrl1::R) -> bool;
}

pub trait ClockControl2 {
    /// Internal method to enable a peripheral clock
    fn enable_clock<'w>(&self, w: &'w mut ahbclkctrl2::W) -> &'w mut ahbclkctrl2::W;

    /// Internal method to disable a peripheral clock
    fn disable_clock<'w>(&self, w: &'w mut ahbclkctrl2::W) -> &'w mut ahbclkctrl2::W;

    /// Check if peripheral clock is enabled
    fn is_clock_enabled(&self, r: &ahbclkctrl2::R) -> bool;
}

// pub trait GenericClockControl {
//     type ahbclkctrl;

//     /// Internal method to enable a peripheral clock
//     fn enable_clock<'w>(&self, w: &'w mut Self::ahbclkctrl::W) -> &'w mut Self::ahbclkctrl::W;

//     /// Internal method to disable a peripheral clock
//     fn disable_clock<'w>(&self, w: &'w mut Self::ahbclkctrl::W) -> &'w mut Self::ahbclkctrl::W;

//     /// Check if peripheral clock is enabled
//     fn is_clock_enabled(&self, r: &Self::ahbclkctrl::R) -> bool;
// }

// macro_rules! impl_generic_clock_control {
//     ($clock_control:ty, $clock:ident, $register_type:ty, $register:ident) => {
//         impl GenericClockControl for $clock_control {
//             type ahbclkctrl = $register_type;

//             fn is_clock_enabled(&self, r: &$register::R) -> bool {
//                 r.$clock().is_enable()
//             }
//         }
//     };
// }

// impl_generic_clock_control!(raw::ADC0, adc, AHBCLKCTRL0, ahbclkctrl0);

macro_rules! impl_clock_control {
    ($clock_control:ty, $clock:ident, $register:ident, $trait:ident) => {
        impl $trait for $clock_control {
            fn enable_clock<'w>(&self, w: &'w mut $register::W) -> &'w mut $register::W {
                w.$clock().enable()
            }

            fn disable_clock<'w>(&self, w: &'w mut $register::W) -> &'w mut $register::W {
                w.$clock().disable()
            }

            fn is_clock_enabled(&self, r: &$register::R) -> bool {
                r.$clock().is_enable()
            }
        }
    };
}

// TODO: be able to just pass 0 here instead of both ahbclkctrl0 and ClockControl0
impl_clock_control!(raw::ADC0, adc, ahbclkctrl0, ClockControl0);
impl_clock_control!(raw::FLASH, flash, ahbclkctrl0, ClockControl0);
impl_clock_control!(raw::IOCON, iocon, ahbclkctrl0, ClockControl0);
impl_clock_control!(raw::GINT0, gint, ahbclkctrl0, ClockControl0);
impl_clock_control!(raw::PINT, pint, ahbclkctrl0, ClockControl0);

impl_clock_control!(raw::USB0, usb0_dev, ahbclkctrl1, ClockControl1);
impl_clock_control!(raw::UTICK0, utick0, ahbclkctrl1, ClockControl1);

impl_clock_control!(raw::ANACTRL, analog_ctrl, ahbclkctrl2, ClockControl2);
impl_clock_control!(raw::CASPER, casper, ahbclkctrl2, ClockControl2);
// there is no GPIO_SEC. what to do? create a PhantomData one?
// impl_clock_control!(raw::GPIO_SEC, gpio_sec, ahbclkctrl2, ClockControl2);
impl_clock_control!(raw::PUF, puf, ahbclkctrl2, ClockControl2);
impl_clock_control!(raw::RNG, rng, ahbclkctrl2, ClockControl2);

// there are so many PIOs, need special casing
impl ClockControl0 for raw::GPIO {
    fn enable_clock<'w>(&self, w: &'w mut ahbclkctrl0::W) -> &'w mut ahbclkctrl0::W {
        w.gpio0().enable().gpio1().enable().gpio2().enable().gpio3().enable()
    }

    fn disable_clock<'w>(&self, w: &'w mut ahbclkctrl0::W) -> &'w mut ahbclkctrl0::W {
        w.gpio0().disable().gpio1().disable().gpio2().disable().gpio3().disable()
    }

    fn is_clock_enabled(&self, r: &ahbclkctrl0::R) -> bool {
        r.gpio0().is_enable() && r.gpio1().is_enable() &&
        r.gpio2().is_enable() && r.gpio3().is_enable()
    }
}

impl ClockControl2 for raw::GPIO {
    fn enable_clock<'w>(&self, w: &'w mut ahbclkctrl2::W) -> &'w mut ahbclkctrl2::W {
        w.gpio4().enable().gpio5().enable()
    }

    fn disable_clock<'w>(&self, w: &'w mut ahbclkctrl2::W) -> &'w mut ahbclkctrl2::W {
        w.gpio4().disable().gpio5().disable()
    }

    fn is_clock_enabled(&self, r: &ahbclkctrl2::R) -> bool {
        r.gpio4().is_enable() && r.gpio5().is_enable()
    }
}
