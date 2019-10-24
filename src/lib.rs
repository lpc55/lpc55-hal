// #![allow(non_camel_case_types)]
#![no_std]

// Meh, maybe `hal_traits` instead?
use embedded_hal as hal;

pub extern crate lpc55s6x_pac as raw;

pub mod anactrl;
pub mod casper;
pub mod clock;
pub mod clocks;
pub mod gpio;
pub mod iocon;
pub mod pins;
pub mod pmc;
pub mod rng;
pub mod sleep;
pub mod syscon;
pub mod usbfs;
pub mod utick;

#[macro_use]
pub(crate) mod reg_proxy;

#[macro_use]
pub mod macros;

// currently, all sorts of traits
pub mod prelude;

pub mod states;
use states::init_state;

/// All the HAL peripherals
pub use {
    anactrl::Anactrl,
    casper::Casper,
    gpio::Gpio,
    iocon::Iocon,
    pmc::Pmc,
    syscon::Syscon,
    usbfs::Usbfs,
    usbfs::EnabledUsbfsDevice,
};

/// This is the entry point to the HAL API. Before you can do anything else, you
/// need to get an instance of this struct via [`Peripherals::take`] or
/// [`Peripherals::steal`].
///
/// # Safe Use of the API
///
/// Since it should be impossible (outside of unsafe code) to access the
/// peripherals before this struct is initialized, you can rely on the
/// peripheral states being correct, as long as there's no bug in the API, and
/// you're not using unsafe code to do anything that the HAL API can't account
/// for.
///
/// If you directly use unsafe code to access peripherals or manipulate this
/// API, this will be really obvious from the code. But please note that if
/// you're using other APIs to access the hardware, such conflicting hardware
/// access might not be obvious, as the other API might use unsafe code under
/// the hood to access the hardware (just like this API does).
///
/// If you do access the peripherals in any way not intended by this API, please
/// make sure you know what you're doing. In specific terms, this means you
/// should be fully aware of what your code does, and whether that is a valid
/// use of the hardware.
#[allow(non_snake_case)]
pub struct Peripherals {
    /// Analog control
    pub anactrl: anactrl::Anactrl,

    /// Cryptographic Accelerator and Signal Processing Engine with RAM sharing
    pub casper: casper::Casper,

    /// General-purpose I/O (GPIO)
    pub gpio: gpio::Gpio, // <init_state::Unknown>,

    /// I/O configuration
    pub iocon: iocon::Iocon, // <init_state::Unknown>,

    /// Power configuration
    pub pmc: pmc::Pmc,

    /// System configuration
    pub syscon: syscon::Syscon,

    // /// USB full-speed device
    // pub USBFSD: usbfs::device::UsbFsDev<init_state::Disabled>,

    // /// USB full-speed host
    // pub USBFSH: usbfs::host::UsbFsHost<init_state::Disabled>,

    // USB full-speed device or host
    pub usbfs: usbfs::Usbfs,

    /// Micro-Tick Timer
    pub UTICK: utick::Utick<init_state::Disabled>,

    /// Analog-to-Digital Converter (ADC) - not HAL-ified.
    pub ADC0: raw::ADC0,

    /// CRC engine - not HAL-ified.
    pub CRC_ENGINE: raw::CRC_ENGINE,

    /// Standard counter/timer (CTIMER) - not HAL-ified.
    pub CTIMER0: raw::CTIMER0,

    /// Flash - not HAL-ified.
    pub FLASH: raw::FLASH,

    /// CPUID - core peripheral
    pub CPUID: raw::CPUID,

    /// Debug Control Block (DCB) - core peripheral
    pub DCB: raw::DCB,

    /// Data Watchpoint and Trace unit (DWT) - core peripheral
    pub DWT: raw::DWT,

    /// Memory Protection Unit (MPU) - core peripheral
    pub MPU: raw::MPU,

    /// Nested Vector Interrupt Controller (NVIC) - core peripheral
    pub NVIC: raw::NVIC,

    /// System Control Block (SCB) - core peripheral
    pub SCB: raw::SCB,

    /// SysTick: System Timer - core peripheral
    pub SYST: raw::SYST,
}

impl Peripherals {
    /// Take the peripherals safely
    ///
    /// This method can only be called one time to access the peripherals. It
    /// will return `Some(Peripherals)` when called for the first time, then
    /// `None` on any subsequent calls.
    ///
    /// Applications should call this method once, at the beginning of their
    /// main method, to get access to the full API. Any other parts of the
    /// program should just expect to be passed whatever parts of the HAL API
    /// they need.
    ///
    /// Calling this method from a library is considered an anti-pattern.
    /// Libraries should just require whatever they need to be passed as
    /// arguments and leave the initialization to the application that calls
    /// them.
    ///
    /// For an alternative way to gain access to the hardware, please take a
    /// look at [`Peripherals::steal`].
    ///
    /// # Example
    ///
    /// ``` no_run
    /// use lpc55s6x_hal::Peripherals;
    ///
    /// // This code should be at the beginning of your program. As long as this
    /// // is the only place that calls `take`, the following should never
    /// // panic.
    /// let p = Peripherals::take().unwrap();
    /// ```
    pub fn take() -> Option<Self> {
        Some(Self::new(
            raw::Peripherals::take()?,
            raw::CorePeripherals::take()?,
        ))
    }

    pub unsafe fn steal() -> Self {
        Self::new(raw::Peripherals::steal(), raw::CorePeripherals::steal())
    }

    fn new(p: raw::Peripherals, cp: raw::CorePeripherals) -> Self {
        Peripherals {
            // HAL peripherals
            anactrl: Anactrl::from(p.ANACTRL),
            casper: Casper::from(p.CASPER),
            // NOTE(unsafe) The init state of the gpio peripheral is enabled,
            // thus it's safe to create an already initialized gpio port
            gpio: Gpio::from(p.GPIO),
            iocon: Iocon::from(p.IOCON),
            pmc: Pmc::from(p.PMC),
            syscon: syscon::wrap(p.SYSCON),
            // USBFSD: usbfs::device::wrap(p.USB0),
            // USBFSH: usbfs::host::wrap(p.USBFSH),
            usbfs: Usbfs::from((p.USB0, p.USBFSH)),
            UTICK: utick::wrap(p.UTICK0),

            // Raw peripherals
            ADC0: p.ADC0,
            CRC_ENGINE: p.CRC_ENGINE,
            CTIMER0: p.CTIMER0,
            FLASH: p.FLASH,

            // Core peripherals
            CPUID: cp.CPUID,
            DCB: cp.DCB,
            DWT: cp.DWT,
            MPU: cp.MPU,
            NVIC: cp.NVIC,
            SCB: cp.SCB,
            SYST: cp.SYST,
        }
    }
}

impl From<(raw::Peripherals, raw::CorePeripherals)> for Peripherals {
    fn from(raw: (raw::Peripherals, raw::CorePeripherals)) -> Self {
        Peripherals::new(raw.0, raw.1)
    }
}

// fn init() -> Peripherals {
//     Peripherals::from((
//         raw::CorePeripherals::take().unwrap(),
//         raw::Peripherals::take().unwrap(),
//     ))
// }

/// This is the main (monolithic) entry point to the HAL.
///
/// If you are using RTFM, prefer using `hal::<Peripheral>::from(<raw_peripheral>)`
/// as needed.
pub fn new() -> Peripherals {
    Peripherals::from((
        raw::Peripherals::take().expect("raw device peripherals already taken elsewhere"),
        raw::CorePeripherals::take().expect("raw core peripherals already taken elsewhere"),
    ))
}

pub fn get_cycle_count() -> u32 {
    raw::DWT::get_cycle_count()
}

extern "C" {
    pub fn POWER_SetVoltageForFreq(freq: u32);
}

