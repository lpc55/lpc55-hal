// This is a bit of a hodgepodge of more standard stm32-rs
// and less standard lpc-rs approaches.
//
// Will see what ends where and how.

// use embedded_hal::timer::CountDown;

// use crate::{
//     peripherals::{
//         utick::EnabledUtick,
//     },
// };

//////////////////////////////
// stm32-f4
//////////////////////////////
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Hertz(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Kilohertz(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Megahertz(pub u32);

impl From<Kilohertz> for Hertz {
    fn from(khz: Kilohertz) -> Self {
        Hertz(1_000 * khz.0)
    }
}

impl From<Megahertz> for Kilohertz {
    fn from(mhz: Megahertz) -> Self {
        Kilohertz(1_000 * mhz.0)
    }
}

impl From<Megahertz> for Hertz {
    fn from(mhz: Megahertz) -> Self {
        Hertz(1_000_000 * mhz.0)
    }
}

#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Baud(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Kilobaud(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Megabaud(pub u32);

impl From<Kilobaud> for Baud {
    fn from(kbd: Kilobaud) -> Self {
        Baud(1_000 * kbd.0)
    }
}

impl From<Megabaud> for Kilobaud {
    fn from(mbd: Megabaud) -> Self {
        Kilobaud(1_000 * mbd.0)
    }
}

impl From<Megabaud> for Baud {
    fn from(mbd: Megabaud) -> Self {
        Baud(1_000_000 * mbd.0)
    }
}

#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct Seconds(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct MiliSeconds(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct MicroSeconds(pub u32);
#[derive(PartialEq, PartialOrd, Clone, Copy, Debug)]
pub struct NanoSeconds(pub u32);

impl From<Seconds> for MiliSeconds{
    fn from(s: Seconds) -> Self {
        MiliSeconds(1_000 * s.0)
    }
}

impl From<Seconds> for MicroSeconds{
    fn from(s: Seconds) -> Self {
        MicroSeconds(1_000_000 * s.0)
    }
}

impl From<MiliSeconds> for MicroSeconds {
    fn from(ms: MiliSeconds) -> Self {
        MicroSeconds(1_000 * ms.0)
    }
}

/// Do this more systematically in the future (and maybe use embedded-time).
/// For now, this is to allow generic drivers using our timers.
impl From<core::time::Duration> for MicroSeconds {
    fn from(duration: core::time::Duration) -> Self {
        let micros: u128 = duration.as_micros();
        debug_assert!(micros < u32::MAX as _);
        MicroSeconds(micros as u32)
    }
}

impl From<MicroSeconds> for NanoSeconds{
    fn from(us: MicroSeconds) -> Self {
        NanoSeconds(1_000 * us.0)
    }
}

pub trait U32Ext {
    /// Wrap in `Hertz`
    fn hz(self) -> Hertz;

    /// Wrap in `Kilohertz`
    fn khz(self) -> Kilohertz;

    /// Wrap in `Megahertz`
    fn mhz(self) -> Megahertz;

    /// Wrap in `Baud`
    fn bps(self) -> Baud;

    /// Wrap in `Kilobaud`
    fn kbps(self) -> Kilobaud;

    /// Wrap in `Megabaud`
    fn mbps(self) -> Megabaud;

    /// Wrap in `Seconds`
    fn s(self) -> Seconds;

    /// Wrap in `MiliSeconds`
    fn ms(self) -> MiliSeconds;

    /// Wrap in `MicroSeconds`
    fn us(self) -> MicroSeconds;

    /// Wrap in `NanoSeconds`
    fn ns(self) -> NanoSeconds;
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

    fn bps(self) -> Baud {
        Baud(self)
    }

    fn kbps(self) -> Kilobaud {
        Kilobaud(self)
    }

    fn mbps(self) -> Megabaud {
        Megabaud(self)
    }

    fn s(self) -> Seconds {
        Seconds(self)
    }

    fn ms(self) -> MiliSeconds {
        MiliSeconds(self)
    }

    fn us(self) -> MicroSeconds {
        MicroSeconds(self)
    }

    fn ns(self) -> NanoSeconds {
        NanoSeconds(self)
    }
}



////////////////////////////////////
//
// lpc-rs
//
// TODO: This stuff has way too
// many references and lifetimes...
//
////////////////////////////////////


//pub struct Ticks<'clock, C: 'clock> {
//    pub value: u32,

//    /// Reference to the clock
//    ///
//    /// Kept to prevent changes of the clock configuration.
//    pub clock: &'clock C,
//}

//impl<'clock, Clock> Clone for Ticks<'clock, Clock> {
//    fn clone(&self) -> Self {
//        Ticks {
//            value: self.value,
//            clock: self.clock,
//        }
//    }
//}

//impl<'clock, Clock> Copy for Ticks<'clock, Clock> {}

//pub trait Frequency {
//    /// This method must never return `0`.
//    fn hz(&self) -> u32;
//}

//pub mod clock {
//    // only meant for clocks
//    pub trait Enabled {}
//}

//pub trait Sleep<Clock>
//where
//    Clock: clock::Enabled,
//{
//    /// Puts the processor to sleep for the given number of ticks of the clock
//    fn sleep<'clock, T>(&mut self, ticks: T)
//    where
//        Clock: 'clock,
//        T: Into<Ticks<'clock, Clock>>;
//}

//pub struct Busy<'utick> {
//    utick: &'utick mut EnabledUtick,
//}

//impl<'utick> Busy<'utick> {
//    /// Prepare busy sleep mode
//    ///
//    /// Returns an instance of `sleep::Busy`, which implements [`Sleep`] and can
//    /// therefore be used to put the microcontroller to sleep.
//    ///
//    /// Requires a mutable reference to [`UTICK`]. The reference will be borrowed
//    /// for as long as the `sleep::Busy` instance exists, as it will be needed
//    /// to count down the time in every call to [`Sleep::sleep`].
//    pub fn wrap(utick: &'utick mut EnabledUtick) -> Self {
//        Busy { utick }
//    }
//}

//impl<'utick, Clock> Sleep<Clock> for Busy<'utick>
//where
//    Clock: clock::Enabled// + crate::peripherals::utick::Clock,
//{
//    fn sleep<'clock, T>(&mut self, ticks: T)
//    where
//        Clock: 'clock,
//        T: Into<Ticks<'clock, Clock>>,
//    {
//        let ticks: Ticks<Clock> = ticks.into();

//        // If we try to sleep for zero cycles, we'll never wake up again.
//        if ticks.value == 0 {
//            return;
//        }

//        self.utick.start(ticks.value);
//        while let Err(nb::Error::WouldBlock) = self.utick.wait() {
//            asm::nop();
//        }
//    }
//}

//// TODO-ish: there's also "Regular" sleep, which means entering a sleep
//// mode, and exiting on an interrupt.
