//! API for the micro-tick timer (UTICK)
//!
//! The entry point to this API is [`UTICK`].
//!
//! The UTICK peripheral is described in the user manual, chapter 26.
//! It is driven by the FRO 1Mhz clock and has a microsecond resolution.
//!
//! # Examples: led.rs, led_utick.rs

// TODO: move this to drivers section,
// possibly merge with ctimers when they're implemented

use crate::traits::wg1;

use crate::{
    peripherals::syscon,
    raw,
    typestates::{init_state, ClocksSupportUtickToken},
};

crate::wrap_stateful_peripheral!(Utick, UTICK0);

pub type EnabledUtick = Utick<init_state::Enabled>;

impl<State> Utick<State> {
    pub fn enabled(
        mut self,
        syscon: &mut syscon::Syscon,
        _clocktree_token: &ClocksSupportUtickToken,
    ) -> EnabledUtick {
        syscon.enable_clock(&mut self.raw);
        syscon.reset(&mut self.raw);

        Utick {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> Utick<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);

        Utick {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
    pub fn start(&mut self, timeout_ms: u32) {
        // Maybe remove again? Empirically, nothing much happens when
        // writing 1 to `delayval`.
        assert!(timeout_ms >= 2);
        self.raw
            .ctrl
            .write(|w| unsafe { w.delayval().bits(timeout_ms - 1) });
        // So... this seems a bit unsafe (what if time is 2?)
        // But: without it, in --release builds the timer behaves erratically.
        // The UM says this on the topic: "Note that the Micro-tick Timer operates from a different
        // (typically slower) clock than the CPU and bus systems.  This means there may be a
        // synchronization delay when accessing Micro-tick Timer registers."
        while self.raw.stat.read().active().bit_is_clear() {}
    }
}

// TODO: Either get rid of `nb` or get rid of this
impl EnabledUtick {
    pub fn blocking_wait(&mut self) {
        while self.raw.stat.read().active().bit_is_set() {}
    }
}

impl wg1::delay::DelayNs for EnabledUtick {
    fn delay_ns(&mut self, ns: u32) {
        self.start(ns.saturating_mul(1000));
        self.blocking_wait();
    }
}
