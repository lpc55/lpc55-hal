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
        timer::Lap,
        TouchSensor,
    }
};
pub use hal::typestates::pin::state;
pub use hal::typestates::pin::gpio::{
    direction,
};
struct Buttons(
    hal::drivers::pins::Pin<hal::drivers::pins::Pio1_9, state::Analog<direction::Input>>, 
    hal::drivers::pins::Pin<hal::drivers::pins::Pio0_31, state::Analog<direction::Input>>, 
    hal::drivers::pins::Pin<hal::drivers::pins::Pio0_15, state::Analog<direction::Input>>, 
);

fn get_average(arr: &[u16]) -> u32{
    let mut sum = 0u32;
    for i in 0 .. arr.len() {
        sum += arr[i] as u32;
    }
    
    sum / (arr.len() as u32)
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

    let touch_token = clocks.support_touch_token().unwrap();


    let mut gpio = hal.gpio.enabled(&mut hal.syscon);


    let mut iocon = hal.iocon.enabled(&mut hal.syscon);
    let pins = Pins::take().unwrap();

    let but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);        // channel 12
    let but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);       // channel 3
    let but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);       // channel 2
    let buttons = Buttons(but1,but2,but3);

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);

    let mut cdriver = Timer::new(hal.ctimer.2.enabled(&mut hal.syscon));

    let adc = adc.release();

    let charge_pin = pins.pio1_16.into_ctimer1_mat3(&mut iocon);

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
    touch_timer.mr[3].write(|w| unsafe { w.bits(1000) });

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

    // Start timer
    touch_timer.tcr.write(|w| {
        w.crst().clear_bit()
        .cen().set_bit()
    });


    heprintln!("looping").unwrap();
    let mut hist1 = [0u16; 32];
    let mut hist2 = [0u16; 32];
    let mut hist3 = [0u16; 32];
    let mut iter1 = 0;
    let mut iter2 = 0;
    let mut iter3 = 0;

    let mut hist_source = [0u8; 32];

    cdriver.start(300.ms());
    let mut total = 0u32;

    loop {

        let count = adc.fctrl[0].read().fcount().bits();
        if count > 0 {



            let result = adc.resfifo[0].read().bits();
            assert!((result & 0x80000000) != 0);
            let sample = (result & 0xffff) as u16;

            let src = ((result & (0xf << 24)) >> 24) as u8;

            match src {
                3 => {
                    hist1[iter1] = sample;
                    iter1 = (iter1 + 1) % 32;
                },
                4 => {
                    hist2[iter2] = sample;
                    iter2 = (iter2 + 1) % 32;
                },
                5 => {
                    hist3[iter3] = sample;
                    iter3 = (iter3 + 1) % 32;
                },
                _ => {
                    assert!(false);
                }
            };

            total += 1;

            // heprintln!("{} ({})", sample, count).unwrap();

        }

        if cdriver.wait().is_ok() {
            cdriver.start(1000.ms());
            heprintln!("av: {:05} {:05} {:05} ({}, {})", get_average(&hist1), get_average(&hist2), get_average(&hist3), count, total).unwrap();
            // dbg!(hist_source);
            total = 0;

        }

        // heprintln!("timer: {:02x}, {:02x}, {}", touch_timer.tcr.read().bits(), touch_timer.emr.read().bits(), touch_timer.tc.read().bits()).unwrap();

        // Some delay before start of period.
        // block!(cdriver.wait()).unwrap();

        // // Measure button 1
        // t0 = touch_sensor.measure(&buttons.0).unwrap().0;


        // // Delay again and get a normal measurement to see max charge value (Only for debugging / tuning) 
        // cdriver.start(1.ms());
        // block!(cdriver.wait()).unwrap();
        // max0 = touch_sensor.read(&buttons.0).unwrap();
        // //

        // // Discharge at end of period
        // touch_sensor.discharge().unwrap();

        /////////////

        // Some delay before start of period.
        // let averages = 1;

        // let mut samples = [0u32; 128];
        // let mut times = [0u32; 128];

        // for i in 0..averages {

        // // Measure button 2
        // // let t1 = touch_sensor.measure(&buttons.2).unwrap();
        //     touch_sensor.charge().unwrap();
        //     samples[i] = touch_sensor.read(&buttons.2).unwrap() as u32;
        //     // samples[i] += touch_sensor.read(&buttons.2).unwrap() as u32;

        //     touch_sensor.discharge().unwrap();
        //     cdriver.start(2.ms());
        //     block!(cdriver.wait()).unwrap();

        // }
        //     touch_sensor.discharge().unwrap();
        //     cdriver.start(2.ms());
        //     block!(cdriver.wait()).unwrap();
        //     let low = touch_sensor.read(&buttons.1).unwrap();

        // max1 = touch_sensor.read(&buttons.1).unwrap();
        // touch_sensor.discharge().unwrap();
        // cdriver.start(2.ms());
        // block!(cdriver.wait()).unwrap();

        // Measure button 2
        // t1 = touch_sensor.measure(&buttons.1).unwrap().0;

        // // Delay again and get a normal measurement to see max charge value (Only for debugging / tuning) 
        // cdriver.start(1.ms());
        // block!(cdriver.wait()).unwrap();
        // max1 = touch_sensor.read(&buttons.1).unwrap();
        // //

        // // Discharge at end of period
        // touch_sensor.discharge().unwrap();

        // /////////////

        // // Some delay before start of period.
        // cdriver.start(1.ms());
        // block!(cdriver.wait()).unwrap();

        // // Measure button 3
        // t2 = touch_sensor.measure(&buttons.2).unwrap().0;

        // // Delay again and get a normal measurement to see max charge value (Only for debugging / tuning) 
        // cdriver.start(1.ms());
        // block!(cdriver.wait()).unwrap();
        // max2 = touch_sensor.read(&buttons.2).unwrap();
        // //

        // // Discharge at end of period
        // touch_sensor.discharge().unwrap();



        // heprintln!("0: {}-{}, 1: {}-{}, 2: {}-{}", t0, max0, t1, max1, t2, max2).unwrap();
        // let mut sum = 0u32;
        // for i in 0..averages {
        //     sum += samples[i] as u32;
        // }
        // for i in 0..2 {
        //     heprintln!("{:06}  {:06}", samples[i], times[i]);
        // }

        // heprintln!("ave: {:02}, {:02} {:02} {:02} {:02}", sum / (averages as u32), samples[0], samples[1], samples[2], samples[3], ).unwrap();
        // heprintln!("ave: {:02}, low: {:02}", sum / (averages as u32), low, ).unwrap();


        // dbg!(samples);
        // heprintln!("{}-{}",  t1.0, max1, ).unwrap();
    }
}