//! API for the micro-tick timer (UTICK)
//!
//! The entry point to this API is [`UTICK`].
//!
//! The UTICK peripheral is described in the user manual, chapter 26.
//! It is driven by the FRO 1Mhz clock and has a microsecond resolution.
//!
//! # Examples
//!
//! ``` no_run
//! extern crate lpc55S6x_hal;
//! extern crate nb;
//!
//! use lpc55S6x_hal::prelude::*;
//! use lpc55S6x_hal::Peripherals;
//!
//! let mut p = Peripherals::take().unwrap();
//!
//! let mut syscon = p.SYSCON.split();
//! let mut timer  = p.UTICK.enable(&mut syscon.handle);
//!
//! // Start the timer at 1_000_000. Sine the UTICK tuner 1 MHz,
//! // this translates to a one second wait.
//! timer.start(1_000_000u32);
//!
//! while let Err(nb::Error::WouldBlock) = timer.wait() {
//!     // do stuff
//! }
//! ```
//!
//! Please refer to the [examples in the repository] for more example code.

use embedded_hal::timer;
use nb;
use void::Void;

use crate::{
    init_state,
    // pmu::LowPowerClock,
    raw::{
        self,
        // utick::ctrl,
    },
    syscon::{self, Fro1MhzUtickClock},
};

/// Interface to the micro-tick timer (UTICK)
pub struct UTICK<State = init_state::Enabled> {
    utick: raw::UTICK,
    _state: State,
}

impl UTICK<init_state::Disabled> {
    pub(crate) fn new(utick: raw::UTICK) -> Self {
        UTICK {
            utick: utick,
            _state: init_state::Disabled,
        }
    }

    /// Enable the UTICK
    ///
    /// Consume a UTICK in `Disabled` state, return an instance in `Enabled` state.
    pub fn enable(mut self, syscon: &mut syscon::Handle) -> UTICK<init_state::Enabled> {
        syscon.enable_clock(&mut self.utick);

        // TODO: require passing in an enabled FRO1MHZ instead,
        //       so we don't silently enable it.
        // NB: UM says bit 4 (FRO_HF_FREQM_ENA), which is incorrect
        // Empirically, it is enough to enable `fro1mhz_utick_ena`,
        // even if `fro1mhz_clk_ena` is explicitly disabled.
        // Hence I think we can claim to "own" `fro1mhz_utick_ena` and
        // do things silently after all.

        // unsafe { &*crate::raw::SYSCON::ptr() }.clock_ctrl.modify(|_, w| w.fro1mhz_clk_ena().enable());
        // unsafe { &*crate::raw::SYSCON::ptr() }.clock_ctrl.modify(|_, w| w.fro1mhz_clk_ena().disable());
        unsafe { &*crate::raw::SYSCON::ptr() }
            .clock_ctrl
            .modify(|_, w| w.fro1mhz_utick_ena().enable());

        UTICK {
            utick: self.utick,
            _state: init_state::Enabled(()),
        }
    }
}

impl UTICK<init_state::Enabled> {
    /// Disable the UTICK
    ///
    /// Consume a UTICK in `Enabled` state, return an instance in `Disabled` state.
    pub fn disable(mut self, syscon: &mut syscon::Handle) -> UTICK<init_state::Disabled> {
        unsafe { &*crate::raw::SYSCON::ptr() }
            .clock_ctrl
            .modify(|_, w| w.fro1mhz_utick_ena().disable());
        syscon.disable_clock(&mut self.utick);

        UTICK {
            utick: self.utick,
            _state: init_state::Disabled,
        }
    }
}

impl timer::Cancel for UTICK<init_state::Enabled> {
    type Error = Void;

    fn cancel(&mut self) -> Result<(), Self::Error> {
        // A value of 0 stops the timer.
        self.utick.ctrl.write(|w| unsafe { w.delayval().bits(0) });
        Ok(())
    }
}

// TODO: also implement Periodic for UTICK
impl timer::CountDown for UTICK<init_state::Enabled> {
    type Time = u32;

    fn start<T>(&mut self, timeout: T)
    where
        T: Into<Self::Time>,
    {
        // The delay will be equal to DELAYVAL + 1 periods of the timer clock.
        // The minimum usable value is 1, for a delay of 2 timer clocks. A value of 0 stops the timer.
        let time = timeout.into();
        // Maybe remove again? Empirically, nothing much happens when
        // writing 1 to `delayval`.
        assert!(time >= 2);
        self.utick
            .ctrl
            .write(|w| unsafe { w.delayval().bits(time - 1) });
    }

    fn wait(&mut self) -> nb::Result<(), Void> {
        if self.utick.stat.read().active().bit_is_clear() {
            return Ok(());
        }

        Err(nb::Error::WouldBlock)
    }
}

impl<State> UTICK<State> {
    /// Return the raw peripheral
    ///
    /// This method serves as an escape hatch from the HAL API. It returns the
    /// raw peripheral, allowing you to do whatever you want with it, without
    /// limitations imposed by the API.
    ///
    /// If you are using this method because a feature you need is missing from
    /// the HAL API, please [open an issue] or, if an issue for your feature
    /// request already exists, comment on the existing issue, so we can
    /// prioritize it accordingly.
    ///
    /// [open an issue]: https://github.com/lpc-rs/lpc8xx-hal/issues
    pub fn free(self) -> raw::UTICK {
        self.utick
    }
}

/// A clock that is usable by the micro-tick timer (UTICK)
///
/// This trait is implemented for all clocks that are supported by the UTICK,
/// which is just FRO1MHZ.
/// The user shouldn't need to implement this trait themselves.
pub trait Clock {}

impl<State> Clock for Fro1MhzUtickClock<State> {}
