use core::ops::{Deref, DerefMut};
use crate::drivers::{
    Pin,
    pins,
};

use crate::peripherals::{
    ctimer,
    dma::Dma,
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
    }
};

pub struct ButtonPins<P1 : PinId, P2 :  PinId, P3 : PinId>(
    pub Pin<P1, state::Analog<direction::Input>>, 
    pub Pin<P2, state::Analog<direction::Input>>, 
    pub Pin<P3, state::Analog<direction::Input>>, 
);

type Adc = crate::peripherals::adc::Adc<init_state::Enabled>;


pub struct TouchSensor<P1 : PinId, P2 :  PinId, P3 : PinId, 
// State : init_state::InitState
>
{
    threshold: u32,
    adc: Adc,
    ctimer: ctimer::Ctimer1<init_state::Enabled>,
    _buttons: ButtonPins<P1,P2,P3>,
    // pub _state: State,
}

// DMA memory
static mut RESULTS: [u32; 112] = [0u32; 112];

impl<P1,P2,P3> Deref for TouchSensor<P1, P2, P3>
where P1: PinId, P2: PinId, P3: PinId
{
    type Target = Adc;
    fn deref(&self) -> &Self::Target {
        &self.adc
    }
}   

impl<P1,P2,P3> DerefMut for TouchSensor<P1, P2, P3>
where P1: PinId, P2: PinId, P3: PinId
{
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.adc
    }
}   

impl<P1,P2,P3, > TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId
{
    pub fn new(
                threshold: u32, 
                adc: Adc, 
                ctimer: ctimer::Ctimer1<init_state::Enabled>, 
                _charge_pin: Pin<pins::Pio1_16, state::Special<function::CTIMER_MAT>>, 
                buttons: ButtonPins<P1,P2,P3>,
            ) -> Self {

        // Last match (3) triggers MAT to TOGGLE (start charging or discharging), interrupt ADC trigger.
        ctimer.mcr.write(|w| {
            w
            .mr3i().set_bit()           // enable interrupt
            .mr3r().set_bit()           // reset timer
            .mr3s().clear_bit()         // do not stop.
        } );

        ctimer.emr.write(|w| {
            w
            .emc3().toggle()               // match 3 charge
        });

        // MR3 starts charge or discharge.  should give ample time to either charge or discharge;
        ctimer.mr[3].write(|w| unsafe { w.bits(800) });

        // Clear mr3 interrupt.  Setting bit clears it.
        ctimer.ir.write(|w| { w.mr3int().set_bit() });

        // ADC trigger 6 activates from ctimer1 mat3
        adc.tctrl[6].write(|w| unsafe {
            w.hten().set_bit()
            .fifo_sel_a().fifo_sel_a_0()
            .fifo_sel_b().fifo_sel_b_0()
            .tcmd().bits(3)                 // Target cmd 3
            .tpri().bits(2)
        });


        adc.cmdl3.write(|w| unsafe {  w.adch().bits(buttons.0.state.channel)
                                    .ctype().ctype_0()          // A-side single ended 
                                    .mode().mode_0()            // standard 12-bit resolution
                                    } );
        adc.cmdh3.write(|w| unsafe { w.avgs().avgs_7()          // 2^7 averages
                                    .cmpen().bits(0b00)         // no compare
                                    .loop_().bits(0)            // execute once
                                    .next().bits(4)             // 3 -> 4
                                    .wait_trig().set_bit()      // wait for trigger again
                                } );


        adc.cmdl4.write(|w| unsafe {  w.adch().bits(buttons.1.state.channel)
                                    .ctype().ctype_0()  
                                    .mode().mode_0()
                                    } );
        adc.cmdh4.write(|w| unsafe { w.avgs().avgs_7()
                                    .cmpen().bits(0b00)
                                    .loop_().bits(0)
                                    .next().bits(5)             // 4 -> 5
                                    .wait_trig().set_bit()
                                } );


        adc.cmdl5.write(|w| unsafe {  w.adch().bits(buttons.2.state.channel)
                                    .ctype().ctype_0()  
                                    .mode().mode_0()
                                    } );
        adc.cmdh5.write(|w| unsafe { w.avgs().avgs_7()
                                    .loop_().bits(0)
                                    .next().bits(3)             // 5 -> 3
                                    .wait_trig().set_bit()
                                } );




        Self {
            adc: adc,
            ctimer: ctimer,
            _buttons: buttons,
            threshold: threshold,
            // _state: init_state::Unknown,
        }
    }


}

impl<P1,P2,P3,> TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{
    // Starts timer and DMA to enable touch detection
    pub fn enabled(
                mut self,
                dma: &mut Dma<init_state::Enabled>,
            ) -> Self //<init_state::Enabled>
            {

        dma.configure_adc(&mut self.adc, unsafe {&mut RESULTS} );

        // Start timer
        self.ctimer.tcr.write(|w| {
            w.crst().clear_bit()
            .cen().set_bit()
        });

        self
    }
}

#[derive(PartialEq)]
pub enum ButtonState{
    Pressed,
    NotPressed
}

pub struct Buttons{
    pub top: ButtonState,
    pub bot: ButtonState,
    pub mid: ButtonState,
}


// for Enabled TouchSensor
impl<P1,P2,P3,> TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{

    /// Dumb average / level-states
    pub fn get_button_state(&self, ) -> Buttons{
        let mut buts = Buttons{top: ButtonState::NotPressed, bot: ButtonState::NotPressed, mid: ButtonState::NotPressed};
        let results = unsafe { RESULTS };

        let mut counts = [1u32; 3];
        let mut sums = [0u32; 3];

        // calculate running average for three buttons.
        // readings for each are mixed in the array.
        for i in 0 .. results.len() {
            let res = results[i];
            let sample = res & 0xffff;
            let src = ((res & (0xf << 24)) >> 24) as u8;

            if src == 3 {
                counts[0] += 1;
                sums[0] += sample;
            }
            else if src == 4 {
                counts[1] += 1;
                sums[1] += sample;
            }
            else if src == 5 {
                counts[2] += 1;
                sums[2] += sample;
            }
            else {
                // assert!(false);
            }
        }

        if sums[0]/counts[0] < self.threshold {
            buts.top = ButtonState::Pressed;
        }
        if sums[1]/counts[1] < self.threshold {
            buts.bot= ButtonState::Pressed;
        }
        if sums[2]/counts[2] < self.threshold {
            buts.mid = ButtonState::Pressed;
        }

        buts
    }
}