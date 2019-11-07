// TODO: clean this up, *-imports are horrible
pub use crate::traits::wg::prelude::*;

// Uhh get rid of this as soon as Vadim did v3
pub use crate::traits::wg::digital::v2::OutputPin as _embedded_hal_digital_v2_OutputPin;
pub use crate::traits::wg::digital::v2::StatefulOutputPin as _embedded_hal_digital_v2_StatefulOutputPin;

pub use crate::time::Sleep as _lpc55s6x_hal_time_Sleep;
pub use crate::time::U32Ext as _lpc55s6x_hal_time_U32Ext;

// Good idea? Bad idea?
// Compare and contrast with renaming of above traits
pub use super::drivers::prelude::*;
