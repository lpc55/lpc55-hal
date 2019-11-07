use core::marker::PhantomData;

/// Encodes the state of peripherals: Unknown, Enabled, or Disabled.
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

pub mod pin;

pub mod usbfs_mode {
    pub trait UsbfsMode {}

    pub struct Unknown;
    impl UsbfsMode for Unknown {}

    pub struct Device;
    impl UsbfsMode for Device {}

    pub struct Host;
    impl UsbfsMode for Host {}
}

/// Encodes the state of the clock-tree: still Configurable, or Frozen.
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
/// a frozen Clocks (clock-tree configuration)
pub struct ClocksSupportFlexcommToken {pub(crate) __: PhantomData<()>}

/// Application can only obtain this token from
/// a frozen Clocks (clock-tree configuration) for
/// which USB clocks have been configured properly.
pub struct ClocksSupportUsbfsToken {pub(crate) __: PhantomData<()>}


pub mod flash_state {
}

pub mod reg_proxy;
