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
/// a frozen Clocks (clock-tree configuration)
pub struct ClocksSupportFlexcommToken {pub(crate) __: PhantomData<()>}

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

    pub struct SWCLK;
    impl Function for SWCLK {}

    pub struct SWDIO;
    impl Function for SWDIO {}

    pub struct USB0_VBUS;
    impl Function for USB0_VBUS {}

    // these are generated with `generate-flexcomm-pin-driver.py`
    pub struct FC0_CTS_SDA_SSEL0;
    impl Function for FC0_CTS_SDA_SSEL0 {}
    pub struct FC0_RTS_SCL_SSEL1;
    impl Function for FC0_RTS_SCL_SSEL1 {}
    pub struct FC0_RXD_SDA_MOSI_DATA;
    impl Function for FC0_RXD_SDA_MOSI_DATA {}
    pub struct FC0_SCK;
    impl Function for FC0_SCK {}
    pub struct FC0_TXD_SCL_MISO_WS;
    impl Function for FC0_TXD_SCL_MISO_WS {}
    pub struct FC1_CTS_SDA_SSEL0;
    impl Function for FC1_CTS_SDA_SSEL0 {}
    pub struct FC1_RTS_SCL_SSEL1;
    impl Function for FC1_RTS_SCL_SSEL1 {}
    pub struct FC1_RXD_SDA_MOSI_DATA;
    impl Function for FC1_RXD_SDA_MOSI_DATA {}
    pub struct FC1_SCK;
    impl Function for FC1_SCK {}
    pub struct FC1_TXD_SCL_MISO_WS;
    impl Function for FC1_TXD_SCL_MISO_WS {}
    pub struct FC2_CTS_SDA_SSEL0;
    impl Function for FC2_CTS_SDA_SSEL0 {}
    pub struct FC2_RTS_SCL_SSEL1;
    impl Function for FC2_RTS_SCL_SSEL1 {}
    pub struct FC2_RXD_SDA_MOSI_DATA;
    impl Function for FC2_RXD_SDA_MOSI_DATA {}
    pub struct FC2_SCK;
    impl Function for FC2_SCK {}
    pub struct FC2_TXD_SCL_MISO_WS;
    impl Function for FC2_TXD_SCL_MISO_WS {}
    pub struct FC3_CTS_SDA_SSEL0;
    impl Function for FC3_CTS_SDA_SSEL0 {}
    pub struct FC3_RTS_SCL_SSEL1;
    impl Function for FC3_RTS_SCL_SSEL1 {}
    pub struct FC3_RXD_SDA_MOSI_DATA;
    impl Function for FC3_RXD_SDA_MOSI_DATA {}
    pub struct FC3_SCK;
    impl Function for FC3_SCK {}
    pub struct FC3_SSEL2;
    impl Function for FC3_SSEL2 {}
    pub struct FC3_SSEL3;
    impl Function for FC3_SSEL3 {}
    pub struct FC3_TXD_SCL_MISO_WS;
    impl Function for FC3_TXD_SCL_MISO_WS {}
    pub struct FC4_CTS_SDA_SSEL0;
    impl Function for FC4_CTS_SDA_SSEL0 {}
    pub struct FC4_RTS_SCL_SSEL1;
    impl Function for FC4_RTS_SCL_SSEL1 {}
    pub struct FC4_RXD_SDA_MOSI_DATA;
    impl Function for FC4_RXD_SDA_MOSI_DATA {}
    pub struct FC4_SCK;
    impl Function for FC4_SCK {}
    pub struct FC4_SSEL2;
    impl Function for FC4_SSEL2 {}
    pub struct FC4_SSEL3;
    impl Function for FC4_SSEL3 {}
    pub struct FC4_TXD_SCL_MISO_WS;
    impl Function for FC4_TXD_SCL_MISO_WS {}
    pub struct FC5_CTS_SDA_SSEL0;
    impl Function for FC5_CTS_SDA_SSEL0 {}
    pub struct FC5_RTS_SCL_SSEL1;
    impl Function for FC5_RTS_SCL_SSEL1 {}
    pub struct FC5_RXD_SDA_MOSI_DATA;
    impl Function for FC5_RXD_SDA_MOSI_DATA {}
    pub struct FC5_SCK;
    impl Function for FC5_SCK {}
    pub struct FC5_TXD_SCL_MISO_WS;
    impl Function for FC5_TXD_SCL_MISO_WS {}
    pub struct FC6_CTS_SDA_SSEL0;
    impl Function for FC6_CTS_SDA_SSEL0 {}
    pub struct FC6_RTS_SCL_SSEL1;
    impl Function for FC6_RTS_SCL_SSEL1 {}
    pub struct FC6_RXD_SDA_MOSI_DATA;
    impl Function for FC6_RXD_SDA_MOSI_DATA {}
    pub struct FC6_SCK;
    impl Function for FC6_SCK {}
    pub struct FC6_TXD_SCL_MISO_WS;
    impl Function for FC6_TXD_SCL_MISO_WS {}
    pub struct FC7_CTS_SDA_SSEL0;
    impl Function for FC7_CTS_SDA_SSEL0 {}
    pub struct FC7_RTS_SCL_SSEL1;
    impl Function for FC7_RTS_SCL_SSEL1 {}
    pub struct FC7_RXD_SDA_MOSI_DATA;
    impl Function for FC7_RXD_SDA_MOSI_DATA {}
    pub struct FC7_SCK;
    impl Function for FC7_SCK {}
    pub struct FC7_TXD_SCL_MISO_WS;
    impl Function for FC7_TXD_SCL_MISO_WS {}

    pub struct HS_SPI_SCK {}
    impl Function for HS_SPI_SCK {}
    pub struct HS_SPI_MOSI {}
    impl Function for HS_SPI_MOSI {}
    pub struct HS_SPI_MISO {}
    impl Function for HS_SPI_MISO {}
    pub struct HS_SPI_SSEL0 {}
    impl Function for HS_SPI_SSEL0 {}
    pub struct HS_SPI_SSEL1 {}
    impl Function for HS_SPI_SSEL1 {}
    pub struct HS_SPI_SSEL2 {}
    impl Function for HS_SPI_SSEL2 {}
    pub struct HS_SPI_SSEL3 {}
    impl Function for HS_SPI_SSEL3 {}
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
