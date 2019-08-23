// #![allow(non_camel_case_types)]
#![no_std]

use embedded_hal as hal;

pub extern crate lpc55s6x_pac as raw;

pub mod rng;
pub mod syscon;
#[macro_use]
pub(crate) mod reg_proxy;

pub mod prelude {
    pub use crate::hal::prelude::*;
}

/// Contains types that encode the state of hardware initialization
///
/// The types in this module are used by structs representing peripherals or
/// other hardware components, to encode the initialization state of the
/// underlying hardware as part of the type.
pub mod init_state {
    /// Indicates that the hardware component is enabled
    ///
    /// This usually indicates that the hardware has been initialized and can be
    /// used for its intended purpose. Contains an optional payload that APIs
    /// can use to keep data that is only available while enabled.
    pub struct Enabled<T = ()>(pub T);

    /// Indicates that the hardware component is disabled
    pub struct Disabled;
}

#[allow(non_snake_case)]
pub struct Peripherals {

    // /// The GPIO peripheral is enabled by default. See user manual, section
    // /// 5.6.14.
    // pub GPIO: GPIO<init_state::Enabled>,
}

