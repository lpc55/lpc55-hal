#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

#[macro_use(block)]
extern crate nb;

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;

use lpc55_hal as hal;
use hal::prelude::*;
use hal::{
    drivers::{
        Pins,
        Timer,
        TouchSensor,
    }
};
pub use hal::typestates::pin::state;
pub use hal::typestates::pin::gpio::{
    direction,
};

#[derive(PartialEq)]
enum ButtonState{
    Pressed,
    NotPressed
}

struct Buttons{
    top: ButtonState,
    bot: ButtonState,
    mid: ButtonState,
}

fn get_button_state(results: &[u32]) -> Buttons{
    let mut buts = Buttons{top: ButtonState::NotPressed, bot: ButtonState::NotPressed, mid: ButtonState::NotPressed};

    let mut counts = [0u32; 3];
    let mut sums = [0u32; 3];

    // calculate running average for three buttons.
    // readings for each are mixed in the array.
    for i in 0 .. results.len() {
        let res = results[i];
        let sample = (res & 0xffff);
        let src = ((res & (0xf << 24)) >> 24) as u8;

        match src {
            3 => {
                counts[0] += 1;
                sums[0] += sample;
            }
            4 => {
                counts[1] += 1;
                sums[1] += sample;
            }
            5 => {
                counts[2] += 1;
                sums[2] += sample;
            }

            _ => {
                assert!(false);
            }
        }
    }

    if sums[0]/counts[0] < 10_000 {
        buts.top = ButtonState::Pressed;
    }
    if sums[1]/counts[1] < 10_000 {
        buts.bot= ButtonState::Pressed;
    }
    if sums[2]/counts[2] < 10_000 {
        buts.mid = ButtonState::Pressed;
    }

    buts
}


#[entry]
fn main() -> ! {

    heprintln!("Hello Touch").unwrap();


    // Get pointer to all device peripherals.
    let mut hal = hal::new();

    let clocks = hal::ClockRequirements::default()
        .system_frequency(96.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();

    let _touch_token = clocks.support_touch_token().unwrap();


    let mut gpio = hal.gpio.enabled(&mut hal.syscon);



    let mut iocon = hal.iocon.enabled(&mut hal.syscon);
    let pins = Pins::take().unwrap();

    let _but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);        // channel 12
    let _but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);       // channel 3
    let _but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);       // channel 2

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);
    let mut dma = hal::Dma::from(hal.DMA0).enabled(&mut hal.syscon);

    let mut cdriver = Timer::new(hal.ctimer.2.enabled(&mut hal.syscon));

    let mut adc = adc.release();

    let _charge_pin = pins.pio1_16.into_ctimer1_mat3(&mut iocon);

    let touch_timer = Timer::new(hal.ctimer.1.enabled(&mut hal.syscon));
    let touch_timer = touch_timer.release().release();

    // First match (0) triggers MAT to go LOW, discharge.
    // Last match (3) triggers MAT to go HIGH, start charging, interrupt ADC trigger.
    touch_timer.mcr.write(|w| {
        w
        // .mr0i().set_bit()          // no interrupt
        // .mr0r().clear_bit()           // no reset
        // .mr0s().clear_bit()         // do not stop.

        .mr3i().set_bit()          // enable interrupt
        .mr3r().set_bit()           // reset timer
        .mr3s().clear_bit()         // do not stop.
    } );

    touch_timer.emr.write(|w| {
        w
        // .emc0().clear()             // match 0 discharge
        .emc3().toggle()               // match 3 charge
    });


    // MR3 starts charge or discharge.  1000 us should be ample time to either charge or discharge;
    touch_timer.mr[3].write(|w| unsafe { w.bits(800) });

    // Clear mr3 interrupt
    touch_timer.ir.write(|w| { w.mr3int().set_bit() });     // setting bit clears it

    // CTIMER1 MAT3 trigger == 6 (Table 736.)
    adc.tctrl[6].write(|w| unsafe {
        w.hten().set_bit()
        .fifo_sel_a().fifo_sel_a_0()
        .fifo_sel_b().fifo_sel_b_0()
        .tcmd().bits(3)                 // Target cmd 3
        .tpri().bits(2)
    });


    adc.cmdl3.write(|w| unsafe {  w.adch().bits(12)
                                .ctype().ctype_0()  
                                .mode().mode_0()
                                } );
    adc.cmdh3.write(|w| unsafe { w.avgs().avgs_7()
                                .cmpen().bits(0b00)        // no compare
                                .loop_().bits(0)
                                .next().bits(4)
                                .wait_trig().set_bit()
                            } );


    adc.cmdl4.write(|w| unsafe {  w.adch().bits(3)
                                .ctype().ctype_0()  
                                .mode().mode_0()
                                } );
    adc.cmdh4.write(|w| unsafe { w.avgs().avgs_7()
                                .cmpen().bits(0b00)        // no compare
                                .loop_().bits(0)
                                .next().bits(5)
                                .wait_trig().set_bit()
                            } );


    adc.cmdl5.write(|w| unsafe {  w.adch().bits(2)
                                .ctype().ctype_0()  
                                .mode().mode_0()
                                } );
    adc.cmdh5.write(|w| unsafe { w.avgs().avgs_7()
                                .loop_().bits(0)
                                .next().bits(3)
                                .wait_trig().set_bit()
                            } );

    let mut samples = [0u32; 112];

    dma.configure_adc(&mut adc, &mut samples);

    // Start timer
    touch_timer.tcr.write(|w| {
        w.crst().clear_bit()
        .cen().set_bit()
    });

    cdriver.start(200.ms());
    block!(cdriver.wait()).unwrap();

    for i in 0 .. samples.len() {
        assert!( samples[i] != 0 );
    }

    heprintln!("looping").unwrap();

    loop {

        let buts = get_button_state(&samples);

        if buts.top == ButtonState::Pressed {
            heprintln!("top").unwrap();
        }
        if buts.bot == ButtonState::Pressed {
            heprintln!("bot").unwrap();
        }
        if buts.mid == ButtonState::Pressed {
            heprintln!("mid").unwrap();
        }

    }
}