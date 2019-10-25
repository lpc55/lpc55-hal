use core::marker::PhantomData;

/// Contains types that encode the state of hardware initialization
///
/// The default state of peripherals is `Unknown`, which is not
/// quite zero cost, but since we may have been jumped to from a
/// bootloader, we can't rely on reset state as per user manual.
///
/// The exception are peripherals which are "always on", such as `Syscon`.
pub mod init_state {
    pub trait InitState {}

    /// Indicates that the state of the peripheral is not known
    pub struct Unknown;
    impl InitState for Unknown {}

    /// Indicates that the hardware component is enabled
    ///
    /// This usually indicates that the hardware has been initialized and can be
    /// used for its intended purpose. Contains an optional payload that APIs
    /// can use to keep data that is only available while enabled.
    ///
    pub struct Enabled<T = ()>(pub T);
    impl InitState for Enabled {}

    /// Indicates that the hardware component is disabled
    pub struct Disabled;
    impl InitState for Disabled {}
}

pub mod usbfs_mode {
    pub trait UsbfsMode {}

    pub struct Unknown;
    impl UsbfsMode for Unknown {}

    pub struct Device;
    impl UsbfsMode for Device {}

    pub struct Host;
    impl UsbfsMode for Host {}
}

// this should be called clock-tree or similar
pub mod clock_state {
    pub trait ClockState {}

    pub struct Configurable;
    impl ClockState for Configurable {}

    pub struct Frozen;
    impl ClockState for Frozen {}
}

/// Using generics for this seems quite painful
pub mod main_clock {
    #[derive(Copy, Clone, Debug)]
    pub enum MainClock {
        // Unknown,
        Fro12MHz,
        Fro96MHz,
    }
    // pub trait MainClock {}

    // pub struct Unknown;
    // impl MainClock for Unknown {}

    // pub struct Fro12Mhz;
    // impl MainClock for Fro12Mhz {}

    // pub struct Fro96Mhz;
    // impl MainClock for Fro96Mhz {}
}

/// Application can only obtain this token from
/// a frozen Clocks (clock-tree configuration) for
/// which USB clocks have been configured properly.
pub struct ClocksSupportUsbfsToken {pub(crate) __: PhantomData<()>}


pub mod gpio_state {
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

pub mod pin_function {
    #![allow(non_camel_case_types)]
    pub trait Function {}

    pub struct USB0_VBUS;
    impl Function for USB0_VBUS {}
}

/// Contains types that indicate pin states
pub mod pin_state {
    use super::gpio_state::direction::Direction;
    use super::pin_function::Function;

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
