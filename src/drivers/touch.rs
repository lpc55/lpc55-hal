use core::ops::{Deref, DerefMut};
use crate::drivers::{
    Timer,
    Pin,
};
use crate::traits::{
    wg::{
        digital::v2::{
            StatefulOutputPin,
            OutputPin,
        },
        timer::{
            Cancel,
            CountDown,
        }
    }
};
use crate::peripherals::{
    ctimer::Ctimer,
};
use crate::typestates::{
    pin::{
        function,
        PinId,
        state,
        gpio::direction,
    },
};
use crate::{
    typestates::{
        init_state,
        ClocksSupportTouchToken,
    }
};
use crate::time::MicroSeconds;
use crate::prelude::*;
use crate::drivers::timer::Lap;

type Adc = crate::peripherals::adc::Adc<init_state::Enabled>;

type Result<T> = core::result::Result<T, ()>;

// Pin<T, state::Gpio<direction::Output>>
pub struct TouchSensor<C: Ctimer>
where
{
    timer: Timer<C>,
    adc: Adc,
    high_threshold: u16,
    low_threshold: u16,
}

impl<C> Deref for TouchSensor<C>
where
    C: Ctimer,
{
    type Target = Adc;
    fn deref(&self) -> &Self::Target {
        &self.adc
    }
}   

impl<C> DerefMut for TouchSensor<C>
where
    C: Ctimer,
{
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.adc
    }
}   

impl<C> TouchSensor<C>
where
    C: Ctimer,
{
    pub fn new(mut adc: Adc, timer: Timer<C>, pin: & Pin<impl PinId, state::Special<function::CTIMER_MAT>>, 
        low_threshold: u16, high_threshold: u16, _token: ClocksSupportTouchToken) -> Result<Self> {

        // pin.set_low()?;

       
        Ok(Self {
            adc: adc,
            timer: timer,
            high_threshold: high_threshold,
            low_threshold: low_threshold,
        })
    }

    pub fn discharge(&mut self) -> Result<()>{
        // self.charge_pin.set_low()?;
        Ok(())
    }

    pub fn charge(&mut self) -> Result<()>{
        // self.charge_pin.set_high()?;
        Ok(())
    }



    pub fn measure(&mut self, channel: &Pin<impl PinId, state::Analog<direction::Input>>) -> Result<MicroSeconds> {
        // assert!(self.charge_pin.is_set_low()?);

        self.arm_comparator_channel(channel.state.channel);

        // Compare high threshold
        self.adc.set_threshold(0, self.high_threshold);
 
        self.timer.start(3.ms());

        //get sample + start charge
        self.adc.swtrig.write(|w| unsafe {w.bits(1)});
        // self.charge_pin.set_high()?;
        while self.fctrl[0].read().fcount().bits() == 0 {
            if self.timer.lap().0 > 900 {
                self.cancel_compare();
                self.timer.cancel().ok();
                return Ok(MicroSeconds(1000));
            }
        }
        let result = self.resfifo[0].read().bits();
        assert!( (result & 0x80000000) != 0 );

        // 
        // self.adc.set_threshold(self.low_threshold, 0x7fff);
        // self.adc.swtrig.write(|w| unsafe {w.bits(1)});
        // self.charge_pin.set_low()?;
        // while self.fctrl[0].read().fcount().bits() == 0 {
        //     if self.timer.lap().0 > 1900 {
        //         self.cancel_compare();
        //         self.timer.cancel().ok();
        //         return Ok(MicroSeconds(2000));
        //     }
        // }
        // let result = self.resfifo[0].read().bits();
        // assert!( (result & 0x80000000) != 0 );

        let duration = self.timer.lap();
        self.timer.cancel().ok();

        Ok(duration)
    }

}
