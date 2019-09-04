pub use crate::hal::prelude::*;
// Uhh get rid of this as soon as Vadim did v3
pub use crate::hal::digital::v2::OutputPin as _embedded_hal_digital_v2_OutputPin;
pub use crate::hal::digital::v2::StatefulOutputPin as _embedded_hal_digital_v2_StatefulOutputPin;
pub use crate::sleep::Sleep as _lpc82x_hal_sleep_Sleep;
