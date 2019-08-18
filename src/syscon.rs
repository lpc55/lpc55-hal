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


use core::marker::PhantomData;

// use crate::raw::syscon::{
//     // pdruncfg, presetctrl, starterp1, sysahbclkctrl, PDRUNCFG, PRESETCTRL, STARTERP1, SYSAHBCLKCTRL,
//     // UARTCLKDIV, UARTFRGDIV, UARTFRGMULT,
// };

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

        Parts {}

    }
}

/// The main API for the SYSCON peripheral
///
/// Provides access to all types that make up the SYSCON API. Please refer to
/// the [module documentation] for more information.
///
/// [module documentation]: index.html
pub struct Parts {
}

///// Internal trait for controlling peripheral clocks
/////
///// This trait is an internal implementation detail and should neither be
///// implemented nor used outside of LPC82x HAL. Any changes to this trait won't
///// be considered breaking changes.
/////
///// Please refer to [`syscon::Handle::enable_clock`] and
///// [`syscon::Handle::disable_clock`] for the public API that uses this trait.
/////
///// [`syscon::Handle::enable_clock`]: struct.Handle.html#method.enable_clock
///// [`syscon::Handle::disable_clock`]: struct.Handle.html#method.disable_clock
//pub trait ClockControl {
//    /// Internal method to enable a peripheral clock
//    fn enable_clock<'w>(&self, w: &'w mut sysahbclkctrl::W) -> &'w mut sysahbclkctrl::W;

//    /// Internal method to disable a peripheral clock
//    fn disable_clock<'w>(&self, w: &'w mut sysahbclkctrl::W) -> &'w mut sysahbclkctrl::W;
//}

//macro_rules! impl_clock_control {
//    ($clock_control:ty, $clock:ident) => {
//        impl ClockControl for $clock_control {
//            fn enable_clock<'w>(&self, w: &'w mut sysahbclkctrl::W) -> &'w mut sysahbclkctrl::W {
//                w.$clock().enable()
//            }

//            fn disable_clock<'w>(&self, w: &'w mut sysahbclkctrl::W) -> &'w mut sysahbclkctrl::W {
//                w.$clock().disable()
//            }
//        }
//    };
//}


