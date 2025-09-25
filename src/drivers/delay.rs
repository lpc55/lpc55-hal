use embedded_time::duration::Microseconds;

use super::Timer;

use crate::{peripherals::ctimer::Ctimer, traits::wg1::delay::DelayNs, typestates::init_state};

impl<TIMER> DelayNs for Timer<TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    fn delay_ns(&mut self, ns: u32) {
        self.start(Microseconds::new(ns.max(1).saturating_mul(1000)));
        nb::block!(self.wait()).ok();
    }
}
