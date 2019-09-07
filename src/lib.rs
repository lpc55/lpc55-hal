// #![allow(non_camel_case_types)]
#![no_std]

// Meh, maybe `hal_traits` instead?
use embedded_hal as hal;

pub extern crate lpc55s6x_pac as raw;

pub mod clock;
pub mod gpio;
pub mod iocon;
pub mod pins;
pub mod rng;
pub mod sleep;
pub mod syscon;
pub mod utick;

#[macro_use]
pub(crate) mod reg_proxy;

// currently, all sorts of traits
pub mod prelude;

pub mod states;
use states::{
    init_state,
};

///
/// This is the entry point to the HAL API. Before you can do anything else, you
/// need to get an instance of this struct via [`Peripherals::take`] or
/// [`Peripherals::steal`].
///
/// The HAL API tracks the state of peripherals at compile-time, to prevent
/// potential bugs before the program can even run. Many parts of this
/// documentation call this "type state". The peripherals available in this
/// struct are set to their initial state (i.e. their state after a system
/// reset). See user manual, section 5.6.14.
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
    /// General-purpose I/O (GPIO)
    ///
    /// The GPIO peripheral is enabled by default.
    /// TODO: do *not* rely on this
    pub GPIO: gpio::Gpio<init_state::Disabled>,

    /// I/O configuration
    pub IOCON: iocon::Iocon<init_state::Disabled>,

    /// System configuration
    pub SYSCON: syscon::SYSCON,

    /// Micro-Tick Timer
    pub UTICK: utick::Utick<init_state::Disabled>,

    /// Analog-to-Digital Converter (ADC)
    ///
    /// A HAL API for this peripheral has not been implemented yet. In the
    /// meantime, this field provides you with the raw register mappings, which
    /// allow you full, unprotected access to the peripheral.
    pub ADC0: raw::ADC0,

    /// CRC engine
    ///
    /// A HAL API for this peripheral has not been implemented yet. In the
    /// meantime, this field provides you with the raw register mappings, which
    /// allow you full, unprotected access to the peripheral.
    pub CRC_ENGINE: raw::CRC_ENGINE,

    /// Standard counter/timer (CTIMER)
    ///
    /// A HAL API for this peripheral has not been implemented yet. In the
    /// meantime, this field provides you with the raw register mappings, which
    /// allow you full, unprotected access to the peripheral.
    pub CTIMER0: raw::CTIMER0,

    /// Flash
    ///
    /// A HAL API for this peripheral has not been implemented yet. In the
    /// meantime, this field provides you with the raw register mappings, which
    /// allow you full, unprotected access to the peripheral.
    pub FLASH: raw::FLASH,

    /// CPUID
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub CPUID: raw::CPUID,

    /// Debug Control Block (DCB)
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub DCB: raw::DCB,

    /// Data Watchpoint and Trace unit (DWT)
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub DWT: raw::DWT,

    /// Memory Protection Unit (MPU)
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub MPU: raw::MPU,

    /// Nested Vector Interrupt Controller (NVIC)
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub NVIC: raw::NVIC,

    /// System Control Block (SCB)
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
    pub SCB: raw::SCB,

    /// SysTick: System Timer
    ///
    /// This is a core peripherals that's available on all ARM Cortex-M0+ cores.
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

    /// Steal the peripherals
    ///
    /// This function returns an instance of `Peripherals`, whether or not such
    /// an instance exists somewhere else. This is highly unsafe, as it can lead
    /// to conflicting access of the hardware, mismatch between actual hardware
    /// state and peripheral state as tracked by this API at compile-time, and
    /// in general a full nullification of all safety guarantees that this API
    /// would normally make.
    ///
    /// If at all possible, you should always prefer `Peripherals::take` to this
    /// method. The only legitimate use of this API is code that can't access
    /// `Peripherals` the usual way, like a panic handler, or maybe temporary
    /// debug code in an interrupt handler.
    ///
    /// # Safety
    ///
    /// This method returns an instance of `Peripherals` that might conflict
    /// with either other instances of `Peripherals` that exist in the program,
    /// or other means of accessing the hardware. This is only sure, if you make
    /// sure of the following:
    /// 1. No other code can access the hardware at the same time.
    /// 2. You don't change the hardware state in any way that could invalidate
    ///    the type state of other `Peripherals` instances.
    /// 3. The type state in your `Peripherals` instance matches the actual
    ///    state of the hardware.
    ///
    /// Items 1. and 2. are really tricky, so it is recommended to avoid any
    /// situations where they apply, and restrict the use of this method to
    /// situations where the program has effectively ended and the hardware will
    /// be reset right after (like a panic handler).
    ///
    /// Item 3. applies to all uses of this method, and is generally very tricky
    /// to get right. The best way to achieve that is probably to force the API
    /// into a type state that allows you to execute operations that are known
    /// to put the hardware in a safe state. Like forcing the type state for a
    /// peripheral API to the "disabled" state, then enabling it, to make sure
    /// it is enabled, regardless of wheter it was enabled before.
    ///
    /// Since there are no means within this API to forcibly change type state,
    /// you will need to resort to something like [`core::mem::transmute`].
    pub unsafe fn steal() -> Self {
        Self::new(raw::Peripherals::steal(), raw::CorePeripherals::steal())
    }

    fn new(p: raw::Peripherals, cp: raw::CorePeripherals) -> Self {
        Peripherals {
            // HAL peripherals
            // NOTE(unsafe) The init state of the gpio peripheral is enabled,
            // thus it's safe to create an already initialized gpio port
            GPIO: gpio::take(p.GPIO),
            IOCON: iocon::take(p.IOCON),
            SYSCON: syscon::SYSCON::new(p.SYSCON),
            UTICK: utick::take(p.UTICK),

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

pub fn get_cycle_count() -> u32 {
    raw::DWT::get_cycle_count()
}
