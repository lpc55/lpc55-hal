#![no_main]
#![no_std]

// extern crate panic_semihosting;  // 4004 bytes
extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;

use hal::{gpio::Level, prelude::*};
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    let hal = hal::new();

    let mut syscon = hal.syscon;
    let mut gpio = hal.gpio.enabled(&mut syscon);

    let pins = hal::pins::Pins::take().unwrap();

    // R = pio1_6
    let mut red = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        // on = low, off = high
        .into_output(Level::High);

    loop {
        for _ in 0..50_000 {
            red.set_low().unwrap();
        }
        for _ in 0..50_000 {
            red.set_high().unwrap();
        }
    }
}