#![no_std]

//! This HAL takes a layered approach.
//!
//! 1. raw PAC peripherals
//! 1. HAL peripheral wrappers (under `peripherals`)
//! 1. HAL drivers (under `drivers`, typically take ownership of one or more peripherals)
//!
//! The middle layer is quite thin, notably we model pins and the clock tree
//! as drivers.
//!
//! In as much as possible, it is a goal for this HAL that drivers implement
//! general interfaces (under `traits`).
//!
//! The main intended use case of this HAL is in the context of RTFM.
//!
//! To get started without RTFM, try something like:
//! ```
//! let hal = hal::new(); // layer 2
//! let pins = hal::Pins::take().unwrap(); // layer 3
//!
//! let mut syscon = hal.syscon;
//! let mut gpio = hal.gpio.enabled(&mut syscon);
//! let mut iocon = hal.iocon.enabled(&mut syscon);
//!
//! let mut red_led = pins.pio1_6
//!     .into_gpio_pin(&mut iocon, &mut gpio)
//!     .into_output(Level::High);
//!
//! loop {
//!     red.set_low().unwrap();
//!     hal::wait_at_least(300_000);
//!     red.set_high().unwrap();
//!     hal::wait_at_least(300_000);
//! }
//! ```

pub extern crate lpc55s6x_pac as raw;

pub mod prelude;

#[macro_use]
pub mod macros;

pub mod time;
pub mod traits;
pub mod typestates;

pub mod peripherals;
pub use peripherals::{
    anactrl::Anactrl,
    casper::Casper,
    flash::Flash,
    flexcomm::Flexcomm,
    gpio::Gpio,
    iocon::Iocon,
    pmc::Pmc,
    rng::Rng,
    syscon::Syscon,
    usbfs::Usbfs,
    utick::Utick,
};

pub mod drivers;
pub use drivers::{
    ClockRequirements,
    // Flash,
    I2cMaster,
    SpiMaster,
    Pin,
    Pins,
    UsbBus,
};


/// This is the main (monolithic) entry point to the HAL for non-RTFM applications.
/// For RTFM, use `hal::<Peripheral>::from(<raw_peripheral>)` as needed.
pub fn new() -> Peripherals {
    Peripherals::from((
        raw::Peripherals::take().expect("raw device peripherals already taken elsewhere"),
        raw::CorePeripherals::take().expect("raw core peripherals already taken elsewhere"),
    ))
}

/// This is the entry point to the HAL API.
///
/// Before you can do anything else, you need to get an instance of this struct,
/// via `hal::new` or `hal::steal`.
#[allow(non_snake_case)]
pub struct Peripherals {
    /// Analog control
    pub anactrl: Anactrl,

    /// Cryptographic Accelerator and Signal Processing Engine with RAM sharing
    pub casper: Casper,

    /// Flash
    pub flash: Flash,

    /// Flexcomm Interface Serial Communication
    pub flexcomm: Flexcomm,

    /// General-purpose I/O (GPIO)
    pub gpio: Gpio,

    /// I/O configuration
    pub iocon: Iocon,

    /// Power configuration
    pub pmc: Pmc,

    /// System configuration
    pub syscon: Syscon,

    /// USB full-speed device or, not implemented, host
    pub usbfs: Usbfs,

    /// Micro-Tick Timer
    pub utick: Utick,

    /// Analog-to-Digital Converter (ADC) - not HAL-ified.
    pub ADC0: raw::ADC0,

    /// CRC engine - not HAL-ified.
    pub CRC_ENGINE: raw::CRC_ENGINE,

    /// Standard counter/timer (CTIMER) - not HAL-ified.
    pub CTIMER0: raw::CTIMER0,

    /// Stateful counter/timer (SCTIMER) - not HAL-ified.
    pub SCT0: raw::SCT0,

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
    fn new(p: raw::Peripherals, cp: raw::CorePeripherals) -> Self {
        Peripherals {
            // HAL peripherals
            anactrl: Anactrl::from(p.ANACTRL),
            casper: Casper::from(p.CASPER),
            flash: Flash::from(p.FLASH),
            flexcomm: (
                peripherals::flexcomm::Flexcomm0::from((p.FLEXCOMM0, p.I2C0, p.I2S0, p.SPI0, p.USART0)),
                peripherals::flexcomm::Flexcomm1::from((p.FLEXCOMM1, p.I2C1, p.I2S1, p.SPI1, p.USART1)),
                peripherals::flexcomm::Flexcomm2::from((p.FLEXCOMM2, p.I2C2, p.I2S2, p.SPI2, p.USART2)),
                peripherals::flexcomm::Flexcomm3::from((p.FLEXCOMM3, p.I2C3, p.I2S3, p.SPI3, p.USART3)),
                peripherals::flexcomm::Flexcomm4::from((p.FLEXCOMM4, p.I2C4, p.I2S4, p.SPI4, p.USART4)),
                peripherals::flexcomm::Flexcomm5::from((p.FLEXCOMM5, p.I2C5, p.I2S5, p.SPI5, p.USART5)),
                peripherals::flexcomm::Flexcomm6::from((p.FLEXCOMM6, p.I2C6, p.I2S6, p.SPI6, p.USART6)),
                peripherals::flexcomm::Flexcomm7::from((p.FLEXCOMM7, p.I2C7, p.I2S7, p.SPI7, p.USART7)),
                peripherals::flexcomm::Flexcomm8::from((p.FLEXCOMM8, p.SPI8)),
            ),
            gpio: Gpio::from(p.GPIO),
            iocon: Iocon::from(p.IOCON),
            pmc: Pmc::from(p.PMC),
            syscon: Syscon::from(p.SYSCON),
            usbfs: Usbfs::from((p.USB0, p.USBFSH)),
            utick: Utick::from(p.UTICK0),

            // Raw peripherals
            ADC0: p.ADC0,
            CRC_ENGINE: p.CRC_ENGINE,
            CTIMER0: p.CTIMER0,
            SCT0: p.SCT0,

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

    pub fn take() -> Option<Self> {
        Some(Self::new(
            raw::Peripherals::take()?,
            raw::CorePeripherals::take()?,
        ))
    }

    pub unsafe fn steal() -> Self {
        Self::new(raw::Peripherals::steal(), raw::CorePeripherals::steal())
    }

}

impl From<(raw::Peripherals, raw::CorePeripherals)> for Peripherals {
    fn from(raw: (raw::Peripherals, raw::CorePeripherals)) -> Self {
        Peripherals::new(raw.0, raw.1)
    }
}

pub fn enable_cycle_counter() {
    unsafe { &mut raw::CorePeripherals::steal().DWT }.enable_cycle_counter();
}

pub fn get_cycle_count() -> u32 {
    raw::DWT::get_cycle_count()
}

/// Delay of last resort :-))
pub fn wait_at_least(delay_usecs: u32) {
    enable_cycle_counter();
    let max_cpu_speed = 150_000_000; // via PLL
    let period = max_cpu_speed / 1_000_000;

    let current = get_cycle_count() as u64;
    let mut target = current + period as u64 * delay_usecs as u64;
    if target > 0xFFFF_FFFF {
        // wait for wraparound
        target -= 0xFFFF_FFFF;
        while target < get_cycle_count() as u64 { continue; }
    }
    while target > get_cycle_count() as u64 { continue; }
}
