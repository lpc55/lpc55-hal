//! This HAL now uses `embedded-time`.

pub use embedded_time::{
    duration::{Microseconds, Milliseconds, Nanoseconds, Seconds},
    rate::{Baud, Hertz, Kilobaud, Kilohertz, Megabaud, Megahertz},
};

pub use embedded_time::duration::Extensions as DurationExtensions;
pub use embedded_time::rate::Extensions as RateExtensions;
