#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;

use lpc55_hal as hal;
use hal::prelude::*;

use hal::drivers::{
    Timer,
};

#[entry]
fn main() -> ! {

    heprintln!("Hello ctimer").unwrap();

    // Get pointer to all device peripherals.
    let mut hal = hal::new();

    let clocks = hal::ClockRequirements::default()
        .system_frequency(12.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();

    let ctimer = hal.ctimer.1.enabled(&mut hal.syscon);

    let cdriver = Timer::new(ctimer);

    let ctimer = cdriver.release();
    let ctimer = ctimer.release();

    ctimer.ctcr.write(|w| {
        w.ctmode().timer()
    });

    // Timer increment ~1KHz
    ctimer.pr.write(|w| unsafe {w.bits(12000-1)});
    ctimer.tcr.write(|w| {w.cen().set_bit()});

    let mut t = 0u32;
    loop {
        t = ctimer.tc.read().bits();
        dbg!(t);
        hal::wait_at_least(1000);
    }
}