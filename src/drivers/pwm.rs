use crate::{peripherals::ctimer::Ctimer, traits::wg1, typestates::init_state};

pub struct Pwm<TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    timer: TIMER,
}

impl<TIMER> Pwm<TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    pub fn new(timer: TIMER) -> Self {
        // Match should reset and stop timer, and generate interrupt.
        timer
            .mcr
            .modify(|_, w| w.mr3i().set_bit().mr3r().set_bit().mr3s().clear_bit());

        timer.pwmc.modify(|_, w| w.pwmen3().clear_bit());

        // Set max duty cycle to 3rd match register (256 timer counts per pwm period)
        timer.mr[3].write(|w| unsafe { w.bits(0xff) });

        timer.mr[0].write(|w| unsafe { w.bits(0x0) });
        timer.mr[1].write(|w| unsafe { w.bits(0x0) });
        timer.mr[2].write(|w| unsafe { w.bits(0x0) });

        timer.mcr.modify(|_, w| {
            w.mr0i()
                .set_bit()
                .mr0r()
                .clear_bit()
                .mr0s()
                .clear_bit()
                .mr1i()
                .set_bit()
                .mr1r()
                .clear_bit()
                .mr1s()
                .clear_bit()
                .mr2i()
                .set_bit()
                .mr2r()
                .clear_bit()
                .mr2s()
                .clear_bit()
        });
        timer
            .pwmc
            .modify(|_, w| w.pwmen0().set_bit().pwmen1().set_bit().pwmen2().set_bit());

        // No divsion necessary (1MHz / 256 ~= 4kHz at LED)
        timer.pr.write(|w| unsafe { w.bits(0) });

        // Start timer
        timer.tcr.write(|w| w.crst().clear_bit().cen().set_bit());

        Self { timer }
    }

    pub fn release(self) -> TIMER {
        self.timer
    }

    /// Increase maximum value for the duty cycle.
    pub fn scale_max_duty_by(&mut self, duty: u32) {
        self.timer.mr[3].write(|w| unsafe { w.bits(0xff * duty) });
    }

    pub fn channels(&mut self) -> (PwmPin<'_, TIMER>, PwmPin<'_, TIMER>, PwmPin<'_, TIMER>) {
        (
            PwmPin {
                timer: self,
                channel: 0,
            },
            PwmPin {
                timer: self,
                channel: 1,
            },
            PwmPin {
                timer: self,
                channel: 2,
            },
        )
    }
}
//pin: & Pin<impl PinId, state::Analog<direction::Input>>

pub struct PwmPin<'timer, TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    timer: &'timer Pwm<TIMER>,
    channel: u8,
}

impl<'timer, TIMER> wg1::pwm::ErrorType for PwmPin<'timer, TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    type Error = wg1::pwm::ErrorKind;
}

impl<'timer, TIMER> wg1::pwm::SetDutyCycle for PwmPin<'timer, TIMER>
where
    TIMER: Ctimer<init_state::Enabled>,
{
    fn max_duty_cycle(&self) -> u16 {
        self.timer.timer.mr[3].read().bits() as _
    }

    fn set_duty_cycle(&mut self, duty: u16) -> Result<(), Self::Error> {
        self.timer.timer.mr[self.channel as usize].write(|w| unsafe { w.bits(duty as u32) });
        Ok(())
    }
}
