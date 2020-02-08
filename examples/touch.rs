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

    let but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);
    let but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);
    let but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);
    let buttons = Buttons(but1,but2,but3);

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);
    let touch_timer = Timer::new(hal.ctimer.1.enabled(&mut hal.syscon));
    let charge_pin = pins.pio1_16.into_gpio_pin(&mut iocon, &mut gpio).into_output_low();

    let mut touch_sensor = TouchSensor::new(adc, touch_timer, charge_pin, 9_000, 12_000, touch_token).unwrap();

    let mut cdriver = Timer::new(hal.ctimer.2.enabled(&mut hal.syscon));

    heprintln!("looping").unwrap();
    // heprintln!("adc status: {:02X}", touch_sensor.stat.read().bits()).unwrap();
    let mut t0 =0; let mut t1 =0; let mut t2=0;
    let mut max0 = 0; let mut max1 = 0;let mut max2 = 0;
    loop {

        // Some delay before start of period.
        // cdriver.start(1.ms());
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
        let averages = 1;

        let mut samples = [0u32; 128];
        let mut times = [0u32; 128];

        for i in 0..averages {

        // Measure button 2
        // let t1 = touch_sensor.measure(&buttons.2).unwrap();
            touch_sensor.charge().unwrap();
            samples[i] = touch_sensor.read(&buttons.2).unwrap() as u32;
            // touch_sensor.discharge().unwrap();
            // samples[i] += touch_sensor.read(&buttons.2).unwrap() as u32;

            cdriver.start(2.ms());
            block!(cdriver.wait()).unwrap();

        }
            touch_sensor.discharge().unwrap();
            cdriver.start(2.ms());
            block!(cdriver.wait()).unwrap();
            let low = touch_sensor.read(&buttons.1).unwrap();

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
        let mut sum = 0u32;
        for i in 0..averages {
            sum += samples[i] as u32;
        }
        // for i in 0..2 {
        //     heprintln!("{:06}  {:06}", samples[i], times[i]);
        // }

        heprintln!("ave: {:02}, {:02} {:02} {:02} {:02}", sum / (averages as u32), samples[0], samples[1], samples[2], samples[3], ).unwrap();
        // heprintln!("ave: {:02}, low: {:02}", sum / (averages as u32), low, ).unwrap();


        // dbg!(samples);
        // heprintln!("{}-{}",  t1.0, max1, ).unwrap();
    }
}