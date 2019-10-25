use crate::states::{
    pin_state,
};

pub enum PinType {
    /// Digital only
    D, // igitalOnly,
    /// Analog or digital
    A, // nalogOrDigital,
    /// I2C or digital
    I, // 2C,
}

/// Implemented by types that identify pins
pub trait PinId {
    /// This is `X` for `PIOX_Y`.
    const PORT: usize;

    /// This is `Y` for `PIOX_Y`.
    const NUMBER: u8;

    /// This is `0x00000001` for [`PIO0_0`], `0x00000002` for [`PIO0_1`],
    /// `0x00000004` for [`PIO0_2`], and so forth.
    const MASK: u32;

    const TYPE: PinType;
}

/// Main API to control for controlling pins
pub struct Pin<T: PinId, S: pin_state::PinState> {
    pub(crate) id: T,
    #[allow(dead_code)]
    pub(crate) state: S,
}

