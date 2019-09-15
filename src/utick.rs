//! API for the micro-tick timer (UTICK)
//!
//! The entry point to this API is [`UTICK`].
//!
//! The UTICK peripheral is described in the user manual, chapter 26.
//! It is driven by the FRO 1Mhz clock and has a microsecond resolution.
//!
//! # Examples: led.rs, led_utick.rs

use embedded_hal::timer;
use nb;
use void::Void;

use crate::{
    // pmu::LowPowerClock,
    raw::{
        self,
        // utick::ctrl,
    },
    states::init_state,
    syscon::{self, Fro1MhzUtickClock},
};

pub type EnabledUtick<'fro1mhz> =
    Utick<init_state::Enabled<&'fro1mhz Fro1MhzUtickClock<init_state::Enabled>>>;

/// Interface to the micro-tick timer (UTICK)
pub struct Utick<State = init_state::Disabled> {
    raw: raw::UTICK,
    pub _state: State,
}

pub fn wrap(utick: raw::UTICK) -> Utick<init_state::Disabled> {
    Utick::new(utick)
}

impl Utick {
    /// Return the raw peripheral
    pub fn release(self) -> raw::UTICK {
        self.raw
    }
}

impl Utick<init_state::Disabled> {
    // pub(crate) fn new(utick: raw::UTICK) -> Self {
    pub fn new(utick: raw::UTICK) -> Self {
        Utick {
            raw: utick,
            _state: init_state::Disabled,
        }
    }

    /// Enable the UTICK
    ///
    /// Consume a UTICK in `Disabled` state, return an instance in `Enabled` state.
    pub fn enabled<'fro1mhz>(
        mut self,
        syscon: &mut syscon::Syscon,
        fro1mhz: &'fro1mhz Fro1MhzUtickClock<init_state::Enabled>,
    ) -> EnabledUtick<'fro1mhz> {
        syscon.enable_clock(&mut self.raw);

        // Below is no longer needed, since we require passing in an enabled FRO1MHZ.
        // Maybe these references will have to go again though due to RTFM...
        //
        // NB: UM says bit 4 (FRO_HF_FREQM_ENA), which is incorrect
        // Empirically, it is enough to enable `fro1mhz_utick_ena`,
        // even if `fro1mhz_clk_ena` is explicitly disabled.
        // unsafe { &*crate::raw::SYSCON::ptr() }
        //     .clock_ctrl
        //     .modify(|_, w| w.fro1mhz_utick_ena().enable());

        Utick {
            raw: self.raw,
            _state: init_state::Enabled(fro1mhz),
        }
    }
}

impl EnabledUtick<'_> {
    /// Disable the UTICK
    ///
    /// Consume a UTICK in `Enabled` state, return an instance in `Disabled` state.
    pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> Utick<init_state::Disabled> {
        // unsafe { &*crate::raw::SYSCON::ptr() }
        //     .clock_ctrl
        //     .modify(|_, w| w.fro1mhz_utick_ena().disable());
        syscon.disable_clock(&mut self.raw);

        Utick {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

impl timer::Cancel for EnabledUtick<'_> {
    type Error = Void;

    fn cancel(&mut self) -> Result<(), Self::Error> {
        // A value of 0 stops the timer.
        self.raw.ctrl.write(|w| unsafe { w.delayval().bits(0) });
        Ok(())
    }
}

// TODO: also implement Periodic for UTICK
impl timer::CountDown for EnabledUtick<'_> {
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
        self.raw
            .ctrl
            .write(|w| unsafe { w.delayval().bits(time - 1) });
        // So... this seems a bit unsafe (what if time is 2?)
        // But: without it, in --release builds the timer behaves erratically.
        // The UM says this on the topic: "Note that the Micro-tick Timer operates from a different
        // (typically slower) clock than the CPU and bus systems.  This means there may be a
        // synchronization delay when accessing Micro-tick Timer registers."
        while self.raw.stat.read().active().bit_is_clear() {}
    }

    fn wait(&mut self) -> nb::Result<(), Void> {
        if self.raw.stat.read().active().bit_is_clear() {
            return Ok(());
        }

        Err(nb::Error::WouldBlock)
    }
}

impl EnabledUtick<'_> {
    pub fn blocking_wait(&mut self) {
        while self.raw.stat.read().active().bit_is_set() {}
    }
}

/// A clock that is usable by the micro-tick timer (UTICK)
///
/// This trait is implemented for all clocks that are supported by the UTICK,
/// which is just FRO1MHZ.
/// The user shouldn't need to implement this trait themselves.
pub trait Clock {}

impl Clock for Fro1MhzUtickClock<init_state::Enabled> {}
