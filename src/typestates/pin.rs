//! All the traits and typestates related to pins.

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

pub enum PinType {
    /// Digital only
    D, // igitalOnly,
    /// Analog or digital
    A, // nalogOrDigital,
    /// I2C or digital
    I, // 2C,
}

/// Contains types that indicate pin states
pub mod state {
    use super::gpio::direction::Direction;
    use super::function::Function;

    /// Implemented by types that indicate pin state
    pub trait PinState {}

    /// Marks a [`Pin`] as being unused
    pub struct Unused;
    impl PinState for Unused {}

    /// Marks a [`Pin`]  as being assigned to general-purpose I/O
    pub struct Gpio<D: Direction> {
        pub(crate) dirset: crate::reg_proxy::RegClusterProxy<raw::gpio::DIRSET>,
        pub(crate) pin: crate::reg_proxy::RegClusterProxy<raw::gpio::PIN>,
        pub(crate) set: crate::reg_proxy::RegClusterProxy<raw::gpio::SET>,
        pub(crate) clr: crate::reg_proxy::RegClusterProxy<raw::gpio::CLR>,

        pub(crate) _direction: D,
    }

    impl<D> PinState for Gpio<D> where D: Direction {}

    pub struct Special<F: Function> {
        pub(crate) _function: F,
    }

    impl<F> PinState for Special<F> where F: Function {}
}
pub mod gpio {
    pub mod direction {
        /// Implemented by types that indicate GPIO pin direction
        pub trait Direction {}

        pub struct Unknown;
        impl Direction for Unknown {}

        pub struct Input;
        impl Direction for Input {}

        pub struct Output;
        impl Direction for Output {}

        pub trait NotInput: Direction {}
        impl NotInput for Unknown {}
        impl NotInput for Output {}

        pub trait NotOutput: Direction {}
        impl NotOutput for Unknown {}
        impl NotOutput for Input {}
    }

    pub enum Level {
        Low,
        High,
    }
}

pub mod function;

pub mod flexcomm;
