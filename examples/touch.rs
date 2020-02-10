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
        touch::ButtonPins,
        touch::ButtonState,
    }
};
pub use hal::typestates::pin::state;


#[entry]
fn main() -> ! {

    heprintln!("Hello Touch").unwrap();

    let mut hal = hal::new();

    let _clocks = hal::ClockRequirements::default()
        .system_frequency(96.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();



    let mut gpio = hal.gpio.enabled(&mut hal.syscon);


    let mut iocon = hal.iocon.enabled(&mut hal.syscon);
    let pins = Pins::take().unwrap();

    let but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);        // channel 12
    let but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);       // channel 3
    let but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);       // channel 2

    let button_pins = ButtonPins(but1,but2,but3);

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);

    let touch_timer = hal.ctimer.1.enabled(&mut hal.syscon);
    let charge_pin = pins.pio1_16.into_ctimer1_mat3(&mut iocon);

    let mut dma = hal::Dma::from(hal.DMA0).enabled(&mut hal.syscon);


    let mut delay_timer = Timer::new(hal.ctimer.2.enabled(&mut hal.syscon));
    delay_timer.start(300.ms());

    let touch_sensor = TouchSensor::new(10_000, adc, touch_timer, charge_pin, button_pins);

    let mut times = [0u32; 125];

    let touch_sensor = touch_sensor.enabled(&mut dma);
    let start = delay_timer.lap().0;
    let results = touch_sensor.get_results();

    // block!(delay_timer.wait()).unwrap();

    while true {
        let mut has_zero = false;
        for i in 0 .. 125 {
            if results[i] != 0 {
                if times[i] == 0 {
                    times[i] = delay_timer.lap().0 -start;
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

    for i in 0 .. 125 {
        heprintln!("{}: {}us", i, times[i]).unwrap();
    }

    loop {

        let buts = touch_sensor.get_button_state();

        // assert!( touch_sensor.count(3) >= 40 );
        // assert!( touch_sensor.count(4) >= 40 );
        // assert!( touch_sensor.count(5) >= 40 );

        //     heprintln!("{:02} {:02} {:02}",
        //     touch_sensor.count(3),
        //     touch_sensor.count(4),
        //     touch_sensor.count(5),
        // ).unwrap();

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