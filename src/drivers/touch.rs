use core::ops::{Deref, DerefMut};
use nb;
// use cortex_m_semihosting::dbg;
// use cortex_m_semihosting::heprintln;
use crate::traits::wg::timer::CountDown;
use crate::{
    typestates::{
        pin::{
            function,
            PinId,
            state,
            gpio::direction,
        },
        init_state,
        ClocksSupportTouchToken,
    },
    drivers::{
        Pin,
        pins,
        timer,
        timer::Lap,
    },
    peripherals::{
        ctimer,
        dma::Dma,
    },
    time::*,
    traits::{
        buttons,
    },
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
    threshold: [u32; 3],
    confidence: u32,
    adc: Adc,
    adc_timer: ctimer::Ctimer1<init_state::Enabled>,
    sample_timer: ctimer::Ctimer2<init_state::Enabled>,
    _buttons: ButtonPins<P1,P2,P3>,
    // pub _state: State,
}

// DMA memory
// Length should be 4-5 samples more than (3 * 2 * running average) to ensure
// there's always at least (2 * running average) samples from a given ADC source.
// Running average == 8 samples
const RESULTS_LEN: usize = 128;             // Total buffer size, should be power of 2 to make more efficient
const RESULTS_LEAD_SIZE: usize = 3;         // Number of initial results to skip, improve latency
const AVERAGES: usize = 16;
static mut RESULTS: [u32; RESULTS_LEN] = [0u32; RESULTS_LEN];

// ADC sample period in us
const CHARGE_PERIOD_US: u32 = 400;

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
    /// Threshold is the ADC sample limit where an is considered.
    /// Confidence is the number of times the threshold needs to be crossed
    pub fn new(
        threshold: [u32; 3], 
        confidence: u32,
        adc: Adc, 
        adc_timer: ctimer::Ctimer1<init_state::Enabled>, 
        sample_timer: ctimer::Ctimer2<init_state::Enabled>, 
        _charge_pin: Pin<pins::Pio1_16, state::Special<function::CTIMER_MAT>>, 
        buttons: ButtonPins<P1,P2,P3>,
    ) -> Self {

        // Last match (3) triggers MAT to TOGGLE (start charging or discharging), interrupt ADC trigger.
        // Use match (2) for general timing info
        adc_timer.mcr.write(|w| {
            w
            .mr3i().set_bit()           // enable interrupt
            .mr3r().set_bit()           // reset timer
            .mr3s().clear_bit()         // do not stop.
        } );

        adc_timer.emr.write(|w| {
            w
            .emc3().toggle()               // match 3 charge
        });

        // MR3 starts charge or discharge.  should give ample time to either charge or discharge;
        adc_timer.mr[3].write(|w| unsafe { w.bits(CHARGE_PERIOD_US) });

        // Clear mr3 interrupt.  Setting bit clears it.
        adc_timer.ir.write(|w| { w.mr3int().set_bit() });

        // Sample timer is used to correlate which is the latest sample,
        // and is syncrondized with ADC DMA transactions
        sample_timer.mcr.write(|w| unsafe {w.bits(0)});
        sample_timer.emr.write(|w| unsafe {w.bits(0)});
        sample_timer.ir.modify(|r,w| unsafe {w.bits(r.bits())});

        // ADC trigger 6 activates from ctimer1 mat3
        adc.tctrl[6].write(|w| unsafe {
            w.hten().set_bit()
            .fifo_sel_a().fifo_sel_a_0()
            .fifo_sel_b().fifo_sel_b_0()
            .tcmd().bits(3)                 // Target cmd 3
            .tpri().bits(2)
        });


        adc.cmdl3.write(|w| unsafe {  
            w.adch().bits(buttons.0.state.channel)
            .ctype().ctype_0()          // A-side single ended 
            .mode().mode_0()            // standard 12-bit resolution
        } );

        adc.cmdh3.write(|w| unsafe { 
            w.avgs().avgs_6()          // 2^6 averages
            .cmpen().bits(0b00)         // no compare
            .loop_().bits(0)            // execute once
            .next().bits(4)             // 3 -> 4
            .wait_trig().set_bit()      // wait for trigger again
        } );


        adc.cmdl4.write(|w| unsafe {  
            w.adch().bits(buttons.1.state.channel)
            .ctype().ctype_0()  
            .mode().mode_0()
        } );
        adc.cmdh4.write(|w| unsafe { 
            w.avgs().avgs_6()
            .cmpen().bits(0b00)
            .loop_().bits(0)
            .next().bits(5)             // 4 -> 5
            .wait_trig().set_bit()
        } );


        adc.cmdl5.write(|w| unsafe {  
            w.adch().bits(buttons.2.state.channel)
            .ctype().ctype_0()  
            .mode().mode_0()
        } );
        adc.cmdh5.write(|w| unsafe { 
            w.avgs().avgs_6()
            .loop_().bits(0)
            .next().bits(3)             // 5 -> 3
            .wait_trig().set_bit()
        } );




        Self {
            adc: adc,
            adc_timer: adc_timer,
            sample_timer: sample_timer,
            _buttons: buttons,
            threshold: threshold,
            confidence: confidence,
            // _state: init_state::Unknown,
        }
    }


}

impl<P1,P2,P3,> TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{
    /// Starts DMA and internal timers to enable touch detection
    pub fn enabled(
                mut self,
                dma: &mut Dma<init_state::Enabled>,
                _token: ClocksSupportTouchToken,
            ) -> Self //<init_state::Enabled>
            {

        dma.configure_adc(&mut self.adc, &mut self.sample_timer, unsafe {&mut RESULTS} );

        // Start timers
        self.adc_timer.tcr.write(|w| {
            w.crst().clear_bit()
            .cen().set_bit()
        });

        self.sample_timer.tcr.write(|w| {
            w.crst().clear_bit()
            .cen().set_bit()
        });


        self
    }
}


pub struct TouchResult {
    pub is_active: bool,
    pub at: usize,
}

#[derive(Copy, Clone, Debug, PartialEq)]
enum Edge {
    Rising,
    Falling
}

#[derive(Copy, Clone, Debug, PartialEq)]
enum Compare {
    AboveThreshold,
    BelowThreshold
}



// for Enabled TouchSensor
impl<P1,P2,P3,> TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{

    /// Count how many elements from a source are available
    /// Used for debugging
    pub fn count(&self,bufsel: u8) -> u32{
        let results = unsafe { &RESULTS };
        let mut count = 0u32;

        let starting_point = self.get_starting_point();

        for i in 0 .. (RESULTS_LEN - RESULTS_LEAD_SIZE) {
            let src = ((results[(starting_point + i) % RESULTS_LEN] & (0xf << 24)) >> 24) as u8;

            if src == bufsel {
                count += 1;
            }
        }
        count
    }

    /// For debugging
    pub(crate) fn get_results(&self) -> &mut [u32] {
        return unsafe {&mut RESULTS};
    }

    /// Used after an edge is detected to prevent the same
    /// edge being detected twice
    fn reset_results(&self, button: buttons::Button, offset: i32) {
        let results = unsafe {&mut RESULTS};
        match button {
            buttons::ButtonTop => {
                for i in 0 .. RESULTS_LEN {
                    if (results[i] & (0xf << 24)) == (3 << 24) {
                        results[i] = (results[i] & (!0xffff)) | (self.threshold[0] as i32 + offset) as u32;
                    }
                }
            }
            buttons::ButtonBot => {
                for i in 0 .. RESULTS_LEN {
                    if (results[i] & (0xf << 24)) == (4 << 24) {
                        results[i] = (results[i] & (!0xffff)) | (self.threshold[1] as i32 + offset) as u32;
                    }
                }
            }
            buttons::ButtonMid => {
                for i in 0 .. RESULTS_LEN {
                    if (results[i] & (0xf << 24)) == (5 << 24) {
                        results[i] = (results[i] & (!0xffff)) | (self.threshold[2] as i32 + offset) as u32;
                    }
                }
            }
            _ => {
                panic!("Invalid button for buffer selection");
            }
        }

    }

    /// Calculates the oldest sample from ADC in the circular buffer.
    fn get_starting_point(&self) -> usize {
        let sync_time = self.sample_timer.tc.read().bits();

        // Skip +RESULTS_LEN samples after the last sample written. (iterate through)
        if sync_time < 1192 {
            RESULTS_LEAD_SIZE
        } else {
            ((((sync_time - 1192)/802) as usize) + RESULTS_LEN + 1)
        }
    }

    /// Calculate moving average of samples from a specified ADC source/channel
    fn measure_buffer(&self, bufsel: u8, filtered: &mut [u32; 40 - AVERAGES]){
        let results = unsafe { &RESULTS };
        let mut buf = [0u32; 40];
        let mut buf_i = 0;

        let starting_point = self.get_starting_point();

        for i in 0 .. (RESULTS_LEN - RESULTS_LEAD_SIZE) {
            let res = results[(starting_point + i) % RESULTS_LEN];
            let src = ((res & (0xf << 24)) >> 24) as u8;

            if src == bufsel {
                buf[buf_i] = res & 0xffff;
                buf_i += 1;
                if buf_i == buf.len() {
                    break;
                }
            }
        }

        // Running average of AVERAGES samples to produce (40 - AVERAGES) length filtered buffer
        for i in 0 .. (40 - AVERAGES) {
            let mut sum = 0;
            for j in 0 .. AVERAGES {
                let samp = buf[i + j];
                sum += samp;
            }
            filtered[i] = sum / (AVERAGES as u32);
        }

    }

    /// Use threshold and confidence value to see if indicated state has occured in current buffer
    fn get_state(&self, bufsel: u8, ctype: Compare) -> TouchResult {
        let mut filtered = [0u32; 40 - AVERAGES];

        self.measure_buffer(bufsel, &mut filtered);

        if bufsel == 5 {
            // dbg!(bufsel);
            // dbg!(filtered);
        }

        let mut streak = 0u32;

        match ctype {
            Compare::AboveThreshold => {
                for i in 0 .. (40 - AVERAGES) {
                    if filtered[i] > self.threshold[(5 - bufsel) as usize] {
                        streak += 1;
                        if streak > self.confidence {
                            return TouchResult{is_active: true, at: i};
                        }
                    }
                }
            }
            Compare::BelowThreshold => {
                for i in 0 .. (40 - AVERAGES) {
                    if filtered[i] < self.threshold[(5 - bufsel) as usize] {
                        streak += 1;
                        if streak > self.confidence {
                            return TouchResult{is_active: true, at: i};
                        }
                    }
                }
            }
        }
        TouchResult{is_active: false, at: 0}
    }

    /// Map internal cmd number to Button type
    fn button_get_state (&self, button: buttons::Button, ctype: Compare) -> buttons::Button {
        match button {
            buttons::ButtonTop => {
                if self.get_state(3, ctype).is_active { return button };
            }
            buttons::ButtonBot => {
                if self.get_state(4, ctype).is_active { return button };
            }
            buttons::ButtonSides => {
                if self.get_state(4, ctype).is_active && self.get_state(3, ctype).is_active
                    { return button };
            }
            buttons::ButtonMid=> {
                if self.get_state(5, ctype).is_active  { return button };
            }
            buttons::ButtonAny => {
                if self.get_state(5, ctype).is_active { return buttons::ButtonMid };
                if self.get_state(4, ctype).is_active { return buttons::ButtonBot};
                if self.get_state(3, ctype).is_active { return buttons::ButtonTop};
            }
            buttons::ButtonNone => {
                return button;
            }
        }
        return buttons::ButtonNone;
    }


    /// Indicate if an edge has occured in current buffer.  Does not reset.
    fn has_edge (&self, bufsel: u8, edge_type: Edge,) -> bool {
        let low = self.get_state(bufsel, Compare::BelowThreshold);
        let high= self.get_state(bufsel, Compare::AboveThreshold);

        if high.is_active && low.is_active {
            match edge_type {
                Edge::Rising => {
                        return low.at < high.at;
                }
                Edge::Falling=> {
                        return high.at < low.at;
                }
            }
        }
        false
    }

    /// Map internal cmd number to Button type
    fn button_has_edge (&self, button: buttons::Button, edge_type: Edge,) -> buttons::Button {
        match button {
            buttons::ButtonTop => {
                if self.has_edge(3, edge_type) { return button }
            }
            buttons::ButtonBot => {
                if self.has_edge(4, edge_type) { return button }
            }
            buttons::ButtonSides => {
                if 
                    self.has_edge(3, edge_type) &&
                    self.has_edge(4, edge_type)
                        { return button }
            }
            buttons::ButtonMid=> {
                if 
                    self.has_edge(5, edge_type)
                        {  return button }
            }
            buttons::ButtonAny => {
                if self.has_edge(3, edge_type) {return buttons::ButtonTop}
                if self.has_edge(4, edge_type) {return buttons::ButtonBot}
                if self.has_edge(5, edge_type) {return buttons::ButtonMid}
            }
            buttons::ButtonNone => {}
        }

        buttons::ButtonNone
    }
    

}

impl<P1,P2,P3,> buttons::ButtonPress for TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{
    fn is_pressed(&self, button: buttons::Button) -> bool {
        self.button_get_state(button, Compare::BelowThreshold) != buttons::ButtonNone
    }

    fn is_released(&self, button: buttons::Button) -> bool {
        self.button_get_state(button, Compare::AboveThreshold) != buttons::ButtonNone
    }


    fn get_status(&self) -> buttons::Buttons {
        buttons::Buttons {
            top: self.is_pressed(buttons::ButtonTop),
            bot: self.is_pressed(buttons::ButtonBot),
            mid: self.is_pressed(buttons::ButtonMid),
        }
    }

}

impl<P1,P2,P3,> buttons::ButtonEdge for TouchSensor<P1, P2, P3, >
where P1: PinId, P2: PinId, P3: PinId, 
{
    fn wait_for_press(&self, button: buttons::Button) -> buttons::Result {
        let button = self.button_has_edge(button, Edge::Falling);

        // Erase edge with pressed status.
        if button != buttons::ButtonNone {
            self.reset_results(button, -1)
        } else {
            return Err(nb::Error::WouldBlock);
        }

        Ok(button)
    }

    fn wait_for_release(&self, button: buttons::Button) -> buttons::Result {
        let button = self.button_has_edge(button, Edge::Rising);

        // Erase edge with released status.
        if button != buttons::ButtonNone {
            self.reset_results(button, 1)
        } else {
            return Err(nb::Error::WouldBlock);
        }

        Ok(button)
    }

    /// See wait_for_press
    fn wait_for_any_press(&self, ) -> buttons::Result{
        self.wait_for_press(buttons::ButtonAny)
    }

    /// See wait_for_release
    fn wait_for_any_release(&self, ) -> buttons::Result{
        self.wait_for_release(buttons::ButtonAny)
    }
}

/// Used when debugging to correlate the sync timer to which sample in the circular buffer is newest
pub fn profile_touch_sensing(touch_sensor: &mut TouchSensor<impl PinId, impl PinId, impl PinId>, 
                             delay_timer: &mut timer::Timer<impl ctimer::Ctimer<init_state::Enabled>>,
                            copy: &mut [u32],
                            times: &mut [u32],
                            ){

    let start = delay_timer.lap().0;
    let results = touch_sensor.get_results();

    delay_timer.start(300.ms());

    loop {
        let mut has_zero = false;
        for i in 0 .. 125 {
            if results[i] != 0 {
                if times[i] == 0 {
                    times[i] = delay_timer.lap().0 - start;
                    copy[i] = results[i];
                }
            }
            else {
                has_zero = true;
            }
        }
        if !has_zero {
            break;
        }
    }


}