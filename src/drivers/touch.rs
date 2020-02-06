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
    pin::PinId,
    pin::state,
    pin::gpio::direction,
};
use crate::{
    typestates::{
        init_state,
    }
};
use crate::time::MicroSeconds;
use crate::prelude::*;
use crate::drivers::timer::Lap;

type Adc = crate::peripherals::adc::Adc<init_state::Enabled>;

type Result<T, PIN > = core::result::Result<T, <PIN as OutputPin>::Error>;

// Pin<T, state::Gpio<direction::Output>>
pub struct TouchSensor<PIN, C: Ctimer>
where
    PIN: OutputPin + StatefulOutputPin,
{
    timer: Timer<C>,
    adc: Adc,
    charge_pin: PIN,
}

impl<PIN, C> Deref for TouchSensor<PIN, C>
where
    PIN: OutputPin + StatefulOutputPin,
    C: Ctimer,
{
    type Target = Adc;
    fn deref(&self) -> &Self::Target {
        &self.adc
    }
}   

impl<PIN, C> DerefMut for TouchSensor<PIN, C>
where
    PIN: OutputPin + StatefulOutputPin,
    C: Ctimer,
{
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.adc
    }
}   

impl<PIN, C> TouchSensor<PIN, C>
where
    PIN: OutputPin + StatefulOutputPin,
    C: Ctimer,
{
    pub fn new(mut adc: Adc, timer: Timer<C>, mut pin: PIN, threshold: u16) -> Result<Self, PIN> {

        pin.set_low()?;

        // Configure compare operation to (result > CThreshold ? true : false)
        adc.set_threshold(0, threshold);
        
        Ok(Self {
            adc: adc,
            timer: timer,
            charge_pin: pin,
        })
    }

    pub fn discharge(&mut self) -> Result<(), PIN>{
        self.charge_pin.set_low()?;
        Ok(())
    }

    pub fn measure(&mut self, channel: &Pin<impl PinId, state::Analog<direction::Input>>) -> Result<MicroSeconds, PIN> {
        assert!(self.charge_pin.is_set_low()?);

        self.arm_comparator_channel(channel.state.channel);
        self.raw.cmdl1.read().bits();
        self.timer.start(1.ms());

        //get sample + start charge
        self.adc.swtrig.write(|w| unsafe {w.bits(1)});
        self.charge_pin.set_high()?;
        while self.fctrl[0].read().fcount().bits() == 0 {
            if self.timer.lap().0 > 900 {
                self.cancel_compare();
                self.timer.cancel().ok();
                return Ok(MicroSeconds(1000));
            }
        }
        let result = self.resfifo[0].read().bits();
        assert!( (result & 0x80000000) != 0 );

        let duration = self.timer.lap();
        self.timer.cancel().ok();

        Ok(duration)
    }

}
