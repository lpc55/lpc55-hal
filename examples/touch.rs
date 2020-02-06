#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

#[macro_use(block)]
extern crate nb;

use cortex_m_rt::entry;
// use cortex_m_semihosting::dbg;
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



#[entry]
fn main() -> ! {

    heprintln!("Hello Touch").unwrap();


    // Get pointer to all device peripherals.
    let mut hal = hal::new();

    let _clocks = hal::ClockRequirements::default()
        .system_frequency(12.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();

    let mut gpio = hal.gpio.enabled(&mut hal.syscon);


    let mut iocon = hal.iocon.enabled(&mut hal.syscon);
    let pins = Pins::take().unwrap();
    let _but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);
    let but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);
    let _but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);
    let touch_timer = Timer::new(hal.ctimer.1.enabled(&mut hal.syscon));
    let charge_pin = pins.pio1_16.into_gpio_pin(&mut iocon, &mut gpio).into_output_low();

    let mut touch_sensor = TouchSensor::new(adc, touch_timer, charge_pin, 12_000).unwrap();

    let mut cdriver = Timer::new(hal.ctimer.2.enabled(&mut hal.syscon));


    heprintln!("looping").unwrap();
    // heprintln!("adc status: {:02X}", touch_sensor.stat.read().bits()).unwrap();
    loop {

        // Some delay before start of period.
        cdriver.start(1.ms());
        block!(cdriver.wait()).unwrap();

        // Measure button 2
        let t = touch_sensor.measure(&but2).unwrap();

        // Delay again and get a normal measurement to see max charge value (Only for debugging / tuning) 
        cdriver.start(1.ms());
        block!(cdriver.wait()).unwrap();
        let max = touch_sensor.read(&but2).unwrap();
        heprintln!("{} - {}", t.0, max).unwrap();
        //

        // Discharge at end of period
        touch_sensor.discharge().unwrap();
    }
}