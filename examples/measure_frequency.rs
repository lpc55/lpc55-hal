#![no_main]
#![no_std]
/// Simple example to measure the core clock frequency

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

use cortex_m_semihosting::{heprintln};
use cortex_m_rt::entry;

use hal::traits::wg::timer::Cancel;

use lpc55_hal as hal;
use hal::{
    drivers::{
        Timer,
        timer::Lap,
    },
    prelude::*,
};


pub fn delay_cycles(delay: u64) {
    let current = hal::get_cycle_count() as u64;
    let mut target = current + delay;
    if target > 0xFFFF_FFFF {
        // wait for wraparound
        target -= 0xFFFF_FFFF;
        while target < hal::get_cycle_count() as u64 { continue; }
    }
    while target > hal::get_cycle_count() as u64 { continue; }
}

#[entry]
fn main() -> ! {
    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut pmc = hal.pmc;
    let mut syscon = hal.syscon;

    let _clocks = hal::ClockRequirements::default()
        .system_frequency(150.mhz())
        .configure(&mut anactrl, &mut pmc, &mut syscon)
        .unwrap();

    let mut timer = Timer::new(hal.ctimer.0.enabled(&mut syscon));

    hal::enable_cycle_counter();

    loop {

        timer.start(1.s());

        delay_cycles(10_000_000);

        let us = timer.lap().0;
        timer.cancel().ok();

        heprintln!("{} MHz", 10_000_000 / us).ok();
    }
}
