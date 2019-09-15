#![no_main]
#![no_std]

// extern crate panic_semihosting;  // 4004 bytes
extern crate panic_halt; // 672 bytes

// use cortex_m::asm;
use cortex_m_rt::entry;
// use nb::block;

use hal::{gpio::Level, prelude::*};
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::syscon::wrap(dp.SYSCON);
    let mut gpio = hal::gpio::wrap(dp.GPIO).enabled(&mut syscon);
    let pins = hal::pins::Pins::take().unwrap();
    let fro1mhz = hal::syscon::Fro1MhzUtickClock::take()
        .unwrap()
        .enable(&mut syscon);
    let mut utick = hal::utick::wrap(dp.UTICK).enabled(&mut syscon, &fro1mhz);
    // let (utick, fro1mhz) = utick.disabled(&mut syscon);
    // let mut utick = utick.enabled(&mut syscon, fro1mhz);

    // R = pio1_6
    // G = pio1_7
    // B = pio1_4

    let mut red = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        .into_output(Level::High);

    let mut green = pins
        .pio1_7
        .into_gpio_pin(&mut gpio)
        .into_output(Level::High);

    let mut blue = pins
        .pio1_4
        .into_gpio_pin(&mut gpio)
        .into_output(Level::High);

    loop {
        red.set_low().unwrap();
        utick.start(1_000_000u32);
        // block!(utick.wait()).unwrap();
        utick.blocking_wait();
        red.set_high().unwrap();

        green.set_low().unwrap();
        utick.start(1_000_000u32);
        utick.blocking_wait();
        green.set_high().unwrap();

        blue.set_low().unwrap();
        utick.start(1_000_000u32);
        utick.blocking_wait();
        blue.set_high().unwrap();
    }
}
