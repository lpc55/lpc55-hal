use crate::traits::wg;

use crate::peripherals::ctimer::{
    Ctimer
};
use crate::time::{
    MicroSeconds
};
use crate::typestates::{
    init_state,
    pin::state::{
        Channel,
    }
};

pub struct Pwm <TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    timer: TIMER,
}

impl <TIMER> Pwm <TIMER>
where TIMER: Ctimer<init_state::Enabled> {

    pub fn new(timer: TIMER) -> Self{
        Self {
            timer: timer,
        }
    }

    pub fn release(self) -> TIMER {
        self.timer
    }

}

impl<TIMER> wg::Pwm for Pwm<TIMER> 
where TIMER: Ctimer<init_state::Enabled>
{
    type Channel = Channel;
    type Time = MicroSeconds;
    type Duty = u8;

    fn enable(&mut self, channel: Self::Channel) {
        // Match should reset and stop timer, and generate interrupt.
        self.timer.mcr.modify(|_,w| {
            w
            .mr3i().set_bit() 
            .mr3r().set_bit()
            .mr3s().clear_bit()
        });

        self.timer.pwmc.modify(|_,w| 
            w.
            pwmen3().clear_bit()
        );

        match channel {
            Channel::Channel0 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr0i().set_bit() 
                    .mr0r().clear_bit()
                    .mr0s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen0().set_bit()
                );
            }
            Channel::Channel1 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr1i().set_bit() 
                    .mr1r().clear_bit()
                    .mr1s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen1().set_bit()
                );
            }
            Channel::Channel2 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr2i().set_bit() 
                    .mr2r().clear_bit()
                    .mr2s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen2().set_bit()
                );
            }
            Channel::Channel3 => {
                panic!("Cannot use channel 3 for PWM.");
            }
        }

        // Set max duty cycle to 3rd match register (256 timer counts per pwm period)
        self.timer.mr[3].write(|w| unsafe { w.bits(0xff) });

        // No divsion necessary (1MHz / 256 ~= 4kHz at LED)
        self.timer.pr.write(|w| unsafe {w.bits(0)});

        // Start timer
        self.timer.tcr.write(|w| {
            w.crst().clear_bit()
            .cen().set_bit()
        });
    }

    fn disable(&mut self, channel: Self::Channel) {
        match channel {
            Channel::Channel0 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr0i().clear_bit() 
                    .mr0r().clear_bit()
                    .mr0s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen0().clear_bit()
                );
            }
            Channel::Channel1 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr1i().clear_bit() 
                    .mr1r().clear_bit()
                    .mr1s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen1().clear_bit()
                );
            }
            Channel::Channel2 => {
                self.timer.mcr.modify(|_,w| {
                    w
                    .mr2i().clear_bit() 
                    .mr2r().clear_bit()
                    .mr2s().clear_bit()
                });
                self.timer.pwmc.modify(|_,w| 
                    w.
                    pwmen2().clear_bit()
                );
            }
            Channel::Channel3 => {
                panic!("Cannot use channel 3 for PWM.");
            }
        }
    }

    fn get_period(&self) -> Self::Time {
        MicroSeconds(1_000_000 / 256)
    }

    fn set_period<P>(&mut self, _period: P)
    where
        P: Into<Self::Time>
    {
        panic!("Currently period is fixed.");
    }

    fn get_duty(&self, channel: Self::Channel) -> Self::Duty {
        self.timer.mr[channel as usize].read().bits() as u8
    }

    fn get_max_duty(&self) -> Self::Duty {
        255
    }

    fn set_duty(&mut self, channel: Self::Channel, duty: Self::Duty) {
        self.timer.mr[channel as usize].write(|w| unsafe { w.bits(duty as u32) });
    }

}

