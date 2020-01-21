#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;

use lpc55_hal as hal;
use hal::prelude::*;


#[entry]
fn main() -> ! {

    heprintln!("Hello ADC").unwrap();

    // Get pointer to all device peripherals.
    let mut hal = hal::new();

    let clocks = hal::ClockRequirements::default()
        .system_frequency(12.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();

    let ctimer = hal.CTIMER1;

    let tst = ctimer.ccr.read().bits();

    // let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);
    // let adc = hal::Adc::from(dp.ADC0).enabled(&mut syscon);

    heprintln!("looping").unwrap();
    loop {

    }
}