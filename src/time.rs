// This is a bit of a hodgepodge of more standard stm32-rs
// and less standard lpc-rs approaches.
//
// Will see what ends where and how.

use cortex_m::asm;
use embedded_hal::timer::CountDown;

use crate::{
    peripherals::{
        utick::EnabledUtick,
    },
};

//////////////////////////////
// stm32-f4
//////////////////////////////
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Hertz(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Kilohertz(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Megahertz(pub u32);

impl From<Megahertz> for Hertz {
    fn from(mhz: Megahertz) -> Self {
        Hertz(1_000_000 * mhz.0)
    }
}

pub trait U32Ext {
    /// Wrap in `Hertz`
    fn hz(self) -> Hertz;

    /// Wrap in `MegaHertz`
    fn khz(self) -> Kilohertz;

    /// Wrap in `MegaHertz`
    fn mhz(self) -> Megahertz;
}

impl U32Ext for u32 {
    fn hz(self) -> Hertz {
        Hertz(self)
    }

    fn khz(self) -> Kilohertz {
        Kilohertz(self)
    }

    fn mhz(self) -> Megahertz {
        Megahertz(self)
    }
}


//////////////////////////////
// lpc-rs
//////////////////////////////
pub struct Ticks<'clock, C: 'clock> {
    pub value: u32,

    /// Reference to the clock
    ///
    /// Kept to prevent changes of the clock configuration.
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

pub trait Frequency {
    /// This method must never return `0`.
    fn hz(&self) -> u32;
}

pub mod clock {
    // only meant for clocks
    pub trait Enabled {}
}

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
    Clock: clock::Enabled + crate::peripherals::utick::Clock,
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

// TODO-ish: there's also "Regular" sleep, which means entering a sleep
// mode, and exiting on an interrupt.
