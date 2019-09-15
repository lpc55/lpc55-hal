//! Higher-level sleep API
//!
//! This module provides a higher-level API layer that can be used to put the
//! microcontroller to sleep for a given amount of time.
//!
//! Both sleeping via busy waiting and via regular sleep mode are supported.
//! Please refer to [`sleep::Busy`] and [`sleep::Regular`] for more details.
//!
//! [`sleep::Busy`]: struct.Busy.html
//! [`sleep::Regular`]: struct.Regular.html

use cortex_m::asm;
use embedded_hal::prelude::*;
use nb;

use crate::{
    clock::{self, Ticks},
    // pmu,
    // raw::{
    //     self,
    //     Interrupt,
    // },
    utick::{self, EnabledUtick},
};

/// Trait for putting the processor to sleep
///
/// There will typically one implementation of `Sleep` per sleep mode that is
/// available on a given microcontroller.
pub trait Sleep<Clock>
where
    Clock: clock::Enabled,
{
    /// Puts the processor to sleep for the given number of ticks of the clock
    fn sleep<'clock, T>(&mut self, ticks: T)
    where
        Clock: 'clock,
        T: Into<Ticks<'clock, Clock>>;
}

/// Sleep mode based on busy waiting
///
/// Provides a [`Sleep`] implementation based on busy waiting and uses the [UTICK]
/// to measure the time. An interrupt handler is not required.
///
/// Examples: led_utick.rs
pub struct Busy<'utick, 'fro1mhz> {
    utick: &'utick mut EnabledUtick<'fro1mhz>,
}

impl<'utick, 'fro1mhz> Busy<'utick, 'fro1mhz> {
    /// Prepare busy sleep mode
    ///
    /// Returns an instance of `sleep::Busy`, which implements [`Sleep`] and can
    /// therefore be used to put the microcontroller to sleep.
    ///
    /// Requires a mutable reference to [`UTICK`]. The reference will be borrowed
    /// for as long as the `sleep::Busy` instance exists, as it will be needed
    /// to count down the time in every call to [`Sleep::sleep`].
    pub fn wrap(utick: &'utick mut EnabledUtick<'fro1mhz>) -> Self {
        Busy { utick }
    }
}

impl<'utick, 'fro1mhz, Clock> Sleep<Clock> for Busy<'utick, 'fro1mhz>
where
    Clock: clock::Enabled + utick::Clock,
{
    fn sleep<'clock, T>(&mut self, ticks: T)
    where
        Clock: 'clock,
        T: Into<Ticks<'clock, Clock>>,
    {
        let ticks: Ticks<Clock> = ticks.into();

        // If we try to sleep for zero cycles, we'll never wake up again.
        if ticks.value == 0 {
            return;
        }

        self.utick.start(ticks.value);
        while let Err(nb::Error::WouldBlock) = self.utick.wait() {
            asm::nop();
        }
    }
}

/*
/// Regular sleep mode
///
/// Provides a [`Sleep`] implementation for the regular sleep mode and uses the
/// [UTICK] to wake the microcontroller up again, at the right time. Only clocks
/// that the UTICK supports can be used. See [`utick::Clock`] for more details.
///
/// # Examples
///
/// ``` no_run
/// use lpc82x_hal::prelude::*;
/// use lpc82x_hal::{
///     raw,
///     sleep,
///     Peripherals,
/// };
/// use lpc82x_hal::clock::Ticks;
///
/// let mut p = Peripherals::take().unwrap();
///
/// let mut pmu    = p.PMU.split();
/// let mut syscon = p.SYSCON.split();
/// let mut utick    = p.UTICK.enable(&mut syscon.handle);
///
/// let clock = syscon.irc_derived_clock;
///
/// let mut sleep = sleep::Regular::prepare(
///     &mut p.NVIC,
///     &mut pmu.handle,
///     &mut p.SCB,
///     &mut utick,
/// );
///
/// let delay = Ticks { value: 750_000, clock: &clock }; // 1000 ms
///
/// // This will put the microcontroller into sleep mode.
/// sleep.sleep(delay);
/// ```
pub struct Regular<'r> {
    nvic: &'r mut raw::NVIC,
    pmu : &'r mut pmu::Handle,
    scb : &'r mut raw::SCB,
    utick : &'r mut UTICK,
}

impl<'r> Regular<'r> {
    /// Prepare regular sleep mode
    ///
    /// Returns an instance of `sleep::Regular`, which implements [`Sleep`] and
    /// can therefore be used to put the microcontroller to sleep.
    ///
    /// Requires references to various peripherals, which will be borrowed for
    /// as long as the `sleep::Regular` instance exists, as they will be needed
    /// for every call to [`Sleep::sleep`].
    pub fn prepare(
        nvic: &'r mut raw::NVIC,
        pmu : &'r mut pmu::Handle,
        scb : &'r mut raw::SCB,
        utick : &'r mut UTICK,
    )
        -> Self
    {
        Regular {
            nvic: nvic,
            pmu : pmu,
            scb : scb,
            utick : utick,
        }
    }
}

impl<'r, Clock> Sleep<Clock> for Regular<'r>
    where Clock: clock::Enabled + utick::Clock
{
    fn sleep<'clock, T>(&mut self, ticks: T)
        where
            Clock: 'clock,
            T: Into<Ticks<'clock, Clock>>
    {
        let ticks: Ticks<Clock> = ticks.into();

        // If we try to sleep for zero cycles, we'll never wake up again.
        if ticks.value == 0 {
            return;
        }

        self.utick.select_clock::<Clock>();
        self.utick.start(ticks.value);

        // Within the this closure, interrupts are enabled, but interrupt
        // handlers won't run. This means that we'll exit sleep mode when the
        // UTICK interrupt is fired, but there won't be an interrupt handler that
        // will require the UTICK's alarm flag to be reset. This means the `wait`
        // method can use the alarm flag, which would otherwise need to be reset
        // to exit the interrupt handler.
        interrupt::free(|_| {
            self.nvic.enable(Interrupt::UTICK);

            while let Err(nb::Error::WouldBlock) = self.utick.wait() {
                self.pmu.enter_sleep_mode(self.scb);
            }

            // If we don't do this, the (possibly non-existing) interrupt
            // handler will be called as soon as we exit this closure.
            self.nvic.disable(Interrupt::UTICK);
        });
    }
}
*/
