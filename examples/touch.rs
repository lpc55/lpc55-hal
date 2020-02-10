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
        touch::profile_touch_sensing,
    },
    traits::{
        buttons,
        buttons::ButtonPress,
        buttons::ButtonEdge,
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
    let touch_sync_timer = hal.ctimer.2.enabled(&mut hal.syscon);
    let charge_pin = pins.pio1_16.into_ctimer1_mat3(&mut iocon);

    let mut dma = hal::Dma::from(hal.DMA0).enabled(&mut hal.syscon);


    let mut delay_timer = Timer::new(hal.ctimer.0.enabled(&mut hal.syscon));

    let touch_sensor = TouchSensor::new(11_900, 5, adc, touch_timer, touch_sync_timer, charge_pin, button_pins);
    let mut touch_sensor = touch_sensor.enabled(&mut dma);

    // Used to get tunning information for capacitive touch
    if 1 == 0 {
        let mut counts = [0u32; 3];
        let mut times = [0u32; 128];
        let mut results = [0u32; 128];
        profile_touch_sensing(&mut touch_sensor, &mut delay_timer, &mut results, &mut times );
        for i in 0 .. 128 {
            let src = (results[i] & (0xf << 24)) >> 24;
            let sample_num = (times[i] - 3513)/1598;
            let button_sample_num = (times[i] - 3513)/(1598 * 3);

            heprintln!("{}\t{}\t{}\t{}\t{}\t{}",times[i], i, sample_num,src, counts[(src-3) as usize], button_sample_num).unwrap();

            counts[(src - 3) as usize] += 1;
        }
    }

    delay_timer.start(300.ms());
    block!(delay_timer.wait()).unwrap();

    loop {

        assert!( touch_sensor.count(3) >= 40 );
        assert!( touch_sensor.count(4) >= 40 );
        assert!( touch_sensor.count(5) >= 40 );

        let p = touch_sensor.wait_for_any_press();
        if  p.is_ok() {
            heprintln!("press {:?}", p.unwrap()).unwrap();
        }

        let p = touch_sensor.wait_for_any_release();
        if  p.is_ok() {
            heprintln!("release {:?}", p.unwrap()).unwrap();
        }

    }
}