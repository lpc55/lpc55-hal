#![no_main]
#![no_std]

// extern crate panic_semihosting;  // 4004 bytes
extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;
use rtt_target::{rprintln, rtt_init_print};

use hal::{drivers::pins::Level, prelude::*};
use lpc55_hal as hal;

// pub type RedLedPin = pins::Pio1_4;
// pub type GreenLedPin = pins::Pio1_7;
// pub type BlueLedPin = pins::Pio1_6;

#[entry]
fn main() -> ! {
    let hal = hal::new();
    rtt_init_print!();

    let mut syscon = hal.syscon;
    let mut gpio = hal.gpio.enabled(&mut syscon);
    let mut iocon = hal.iocon.enabled(&mut syscon);

    let pins = hal::Pins::take().unwrap();

    // R = pio1_6 (for lpcxpresso)
    let mut red = pins
        .pio1_6
        .into_gpio_pin(&mut iocon, &mut gpio)
        // on = low, off = high
        .into_output(Level::High);

    loop {
        for _ in 0..50_000 {
            red.set_low().unwrap();
        }
        for _ in 0..50_000 {
            red.set_high().unwrap();
        }

        rprintln!("toggled LED");
    }
}
