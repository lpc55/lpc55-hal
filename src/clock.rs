//! Common types for system clocks
//!
//! This module defines types that are helpful for working with system clocks.

/// Represents a number of ticks of a given clock
///
/// This struct is used to represent an amount of time, a duration, but in a
/// low-level way that hardware peripherals can understand and handle. It is
/// meant to be a common denominator that higher-level time APIs can be built on
/// top of.
pub struct Ticks<'clock, C: 'clock> {
    /// The number of ticks
    pub value: u32,

    /// Reference to the clock
    ///
    /// Kept to prevent changes of the clock configuration, which would likely
    /// change its frequency and invalidate the `Ticks` instance by representing
    /// a different duration of time.
    pub clock: &'clock C,
}

impl<'clock, Clock> Clone for Ticks<'clock, Clock> {
    fn clone(&self) -> Self {
        Ticks {
            value: self.value,
            clock: self.clock,
        }
    }
}

impl<'clock, Clock> Copy for Ticks<'clock, Clock> {}

/// Implemented by clocks that can return a frequency
///
/// Implementations of this trait might be very simple, for clocks that run at
/// one specific frequency. Or they might be more complex, for clocks whose
/// frequency can be configured.
///
/// Some clocks might not have an implementation of this trait at all. An
/// example of this might be a type that represents an external clock that is
/// fed into the microcontroller via a pin.
pub trait Frequency {
    /// The frequency of the clock in Hz
    ///
    /// This method must never return `0`.
    fn hz(&self) -> u32;
}

/// Marker trait that identifies a clock as currently being enabled
///
/// A clock that is always enabled can just implement this trait
/// unconditionally. Clocks that can be disabled can use a different type or a
/// type parameter to implement this trait conditionally.
///
/// HAL users will typically use this trait to ensure that a clock that is
/// passed as a parameter is enabled.
///
/// As an example, see `utick::`syscon::Fro1MhzUtickClock` and
/// `clock::Sleep`.
pub trait Enabled {}
