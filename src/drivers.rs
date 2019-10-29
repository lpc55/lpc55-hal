//! Drivers for device functionality.
//!
//! Typically, these drivers take ownership of one or more HAL peripherals,
//! and expose functionality defined in a separate trait.

pub mod clocks;
pub use clocks::ClockRequirements;

pub mod i2c;
pub use i2c::I2cMaster;

// hopefully, rustc's type inference will improve, and
// we can remove these types again
pub use i2c::I2c0Master;
pub use i2c::I2c1Master;
pub use i2c::I2c2Master;
pub use i2c::I2c3Master;
pub use i2c::I2c4Master;
pub use i2c::I2c5Master;
pub use i2c::I2c6Master;
pub use i2c::I2c7Master;

pub mod pins;
pub use pins::{
    Pin,
    Pins,
};

pub mod rng;

pub mod usbd;
pub use usbd::UsbBus;
