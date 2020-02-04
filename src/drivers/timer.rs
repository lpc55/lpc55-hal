use crate::traits::wg::timer;

use crate::typestates::{
    init_state,
};
use crate::peripherals::ctimer::{
    Ctimer
};

pub struct Timer<TIMER>
where
    TIMER: Ctimer,
{
    timer: TIMER,
}

impl <TIMER> Timer<TIMER>
where TIMER: Ctimer {

    pub fn new(timer: TIMER) -> Self{
        Self {
            timer: timer,
        }
    }

    pub fn release(self) -> (TIMER) {
        self.timer
    }

}

// impl<TIMER> timer::CountDown for Timer<TIMER> 
// where TIMER: Ctimer
// {
//     type Time = MicroSeconds
// }