/// Contains types that encode the state of hardware initialization
///
/// The default state of peripherals is `Unknown`, which is not
/// quite zero cost, but since we may have been jumped to from a
/// bootloader, we can't rely on reset state as per user manual.
///
/// The exception are peripherals which are "always on", such as `Syscon`.
pub mod init_state {
    /// Indicates that the state of the peripheral is not known
    pub struct Unknown;

    /// Indicates that the hardware component is enabled
    ///
    /// This usually indicates that the hardware has been initialized and can be
    /// used for its intended purpose. Contains an optional payload that APIs
    /// can use to keep data that is only available while enabled.
    ///
    pub struct Enabled<T = ()>(pub T);

    /// Indicates that the hardware component is disabled
    pub struct Disabled;
}

pub mod usbfs_mode {
    pub struct Unknown;
    pub struct Device;
    pub struct Host;
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

        pub trait NotOutput: Direction {}
        impl NotOutput for Unknown {}
        impl NotOutput for Input {}
    }

    // pub trait Level;
    // pub struct Low;
    // impl Level for Low;
    // pub struct High;
    // impl Level for High;

    pub enum Level {
        Low,
        High,
    }
}

/// Contains types that indicate pin states
pub mod pin_state {
    use super::gpio::direction::Direction;

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
}
