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
    },
    time,
};

pub struct ButtonPins<P1 : PinId, P2 :  PinId, P3 : PinId>(
    pub Pin<P1, state::Analog<direction::Input>>, 
    pub Pin<P2, state::Analog<direction::Input>>, 
    pub Pin<P3, state::Analog<direction::Input>>, 
);

type Adc = crate::peripherals::adc::Adc<init_state::Enabled>;

const CHARGE_PERIOD_US: u32= 800;

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
// Length should be 4-5 samples more than (3 * 2 * running average) to ensure
// there's always at least (2 * running average) samples from a given ADC source.
// Running average == 20 samples
static mut RESULTS: [u32; 125] = [0u32; 125];

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
        // Use match (2) for general timing info
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
        ctimer.mr[3].write(|w| unsafe { w.bits(CHARGE_PERIOD_US) });

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


use cortex_m_semihosting::heprintln;
use cortex_m_semihosting::dbg;

// for Enabled TouchSensor
impl<P1,P2,P3,> TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{

    /// Count how many elements from a source are available
    pub fn count(&self,bufsel: u8) -> u32{
        let results = unsafe { &RESULTS };
        let mut count = 0u32;
        for i in 0 .. results.len() {
            let src = ((results[i] & (0xf << 24)) >> 24) as u8;

            if src == bufsel {
                count += 1;
            }
        }
        count
    }

    pub fn get_results(&self) -> &[u32] {
        return unsafe {&RESULTS};
    }

    fn measure_buffer(bufsel: u8, filtered: &mut [u32; 30]){
        let results = unsafe { &RESULTS };
        let mut buf = [0u32; 40];
        let mut buf_i = 0;

        // Organize the buffer
        for i in 0 .. results.len() {
            let res = results[i];
            let src = ((res & (0xf << 24)) >> 24) as u8;

            if src == bufsel {
                buf[buf_i] = res & 0xffff;
                buf_i += 1;
                if buf_i == buf.len() {
                    break;
                }
            }
        }

        // Running average of 10 samples to produce 30-length filtered buffer
        for i in 0 .. 30 {
            let mut sum = 0;
            for j in 0 .. 10 {
                let samp = buf[i + j];
                sum += samp;
            }
            filtered[i] = sum / 10;
        }

    }

    pub fn is_touched(&self, bufsel: u8) -> bool{
        let mut filtered = [0u32; 30];

        Self::measure_buffer(bufsel, &mut filtered);

        let mut max_streak = 0;
        let mut streak = 0;

        let mut starting_point = 0;


        for i in 0 .. 30 {
            if filtered[i] > self.threshold {
                starting_point = i;
                break;
            }
        }

        for i in 0 .. 30 {
            if filtered[(i + starting_point) % 30] < self.threshold {
                streak += 1;
                if streak > max_streak {
                    max_streak = streak;
                }
            } else {
                streak = 0;
            }
        }

        return max_streak > 5;
    }

    // pub fn wait_for_touch(&self, bufsel: u8, timeout: time::MicroSeconds) -> Result<(), Timeout>{
    //     let total = timeout.0;
    //     let mut elapse = 0u32;

    //     if !self.is_touched(bufsel) {
            
    //         if self.ctimer.ir.read().mr3int().bit_is_set() {

    //         }
    //     }

    // }

    pub fn get_button_state(&self, ) -> Buttons{
        let mut buts = Buttons{top: ButtonState::NotPressed, bot: ButtonState::NotPressed, mid: ButtonState::NotPressed};

        if self.is_touched(3) {
            buts.top = ButtonState::Pressed;
        }
        if self.is_touched(4) {
            buts.bot = ButtonState::Pressed;
        }
        if self.is_touched(5) {
            buts.mid = ButtonState::Pressed;
        }

        buts
    }
}