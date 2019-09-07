#![no_main]
#![no_std]

// extern crate panic_semihosting;  // 4004 bytes
extern crate panic_halt; // 672 bytes

use cortex_m::asm;
use cortex_m_rt::entry;

use hal::{gpio::Level, prelude::*};
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    // let peripherals = hal::Peripherals::take().unwrap();
    let dp = hal::raw::Peripherals::take().unwrap();

    let mut syscon = hal::syscon::SYSCON::new(dp.SYSCON).split();

    // let mut gpio = peripherals.GPIO.enable(&mut syscon.handle);
    let mut gpio = hal::gpio::take(dp.GPIO).enabled(&mut syscon.handle);
    // let iocon = peripherals.IOCON.split();
    // let iocon = hal::iocon::take(dp.IOCON);//.split();


    // R = pio1_6
    // G = pio1_7
    // B = pio1_4

    let pins = hal::pins::Pins::take().unwrap();

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

    // loop {
    //     for _ in 0..50_000 {
    //         red.set_low();
    //     }
    //     for _ in 0..50_000 {
    //         red.set_high();
    //     }
    // }

    // let mut utick = peripherals.UTICK.enable(&mut syscon.handle);
    let mut utick = hal::utick::take(dp.UTICK).enabled(&mut syscon.handle);
    loop {
        red.set_low().unwrap();
        utick.start(1_000_000u32);
        while let Err(nb::Error::WouldBlock) = utick.wait() {
            asm::nop();
        }
        red.set_high().unwrap();

        green.set_low().unwrap();
        utick.start(1_000_000u32);
        while let Err(nb::Error::WouldBlock) = utick.wait() {
            asm::nop();
        }
        green.set_high().unwrap();

        blue.set_low().unwrap();
        utick.start(1_000_000u32);
        while let Err(nb::Error::WouldBlock) = utick.wait() {
            asm::nop();
        }
        blue.set_high().unwrap();
    }
}
