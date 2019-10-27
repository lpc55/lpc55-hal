//! Drivers for device functionality.
//!
//! Typically, these drivers take ownership of one or more HAL peripherals,
//! and expose functionality defined in a separate trait.

pub mod clocks;
pub use clocks::ClockRequirements;

pub mod i2c;
pub use i2c::I2cMaster;

pub mod pins;
pub use pins::{
    Pin,
    Pins,
};

pub mod rng;

pub mod usbd;
pub use usbd::UsbBus;
