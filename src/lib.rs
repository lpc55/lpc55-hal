// #![allow(non_camel_case_types)]
#![no_std]

use embedded_hal as hal;

pub extern crate lpc55s6x_pac as raw;

pub mod syscon;

pub mod prelude {
    pub use crate::hal::prelude::*;
}

#[allow(non_snake_case)]
pub struct Peripherals {

    // /// The GPIO peripheral is enabled by default. See user manual, section
    // /// 5.6.14.
    // pub GPIO: GPIO<init_state::Enabled>,
}

