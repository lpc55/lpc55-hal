#![no_main]
#![no_std]

extern crate panic_semihosting;
// use cortex_m_semihosting::dbg;
use cortex_m::asm;
use cortex_m_rt::entry;

// use lpc55s6x_hal::prelude::*;
use embedded_hal::timer::CountDown;

use lpc55s6x_hal as hal;

#[allow(deprecated)]
use embedded_hal::digital::v1::OutputPin;

#[entry]
fn main() -> ! {

    let peripherals = hal::Peripherals::take().unwrap();

    let mut syscon = peripherals.SYSCON.split();

    let gpio = peripherals.GPIO.enable(&mut syscon.handle).split();

    // R = pio1_6
    // G = pio1_7
    // B = pio1_4

    let mut red = gpio.pins.pio1_6
        .into_gpio_pin(&gpio.handle)
        .into_output();
    #[allow(deprecated)]
    red.set_high();  // on = low

    // TODO: there is some bug where uncommenting these two
    //       but for these LEDs, low = on.

    let mut green = gpio.pins.pio1_7
        .into_gpio_pin(&gpio.handle)
        .into_output();
    #[allow(deprecated)]
    green.set_high();  // on = low

    let mut blue = gpio.pins.pio1_4
        .into_gpio_pin(&gpio.handle)
        .into_output();
    #[allow(deprecated)]
    blue.set_high();  // on = low

    #[allow(deprecated)]
    red.set_low();  // on = low

    // cortex_m::peripheral::SCB::sys_reset();

    // loop {
    //     /// this is to workaround the v1/v2 digital pin
    //     /// situation, until Vadim's v3 lands
    //     #![allow(deprecated)]
    //     for _ in 0..50_000 {
    //         red.set_low();
    //     }
    //     for _ in 0..50_000 {
    //         red.set_high();
    //     }
    // }

    let mut utick = peripherals.UTICK.enable(&mut syscon.handle);
    loop {
        #![allow(deprecated)]
        // this is to workaround the v1/v2 digital pin
        // situation, until Vadim's v3 lands

        red.set_low();
        utick.start(1_000_000u32);
        while let Err(nb::Error::WouldBlock) = utick.wait() {
            asm::nop();
        }

        red.set_high();
        utick.start(1_000_000u32);
        while let Err(nb::Error::WouldBlock) = utick.wait() {
            asm::nop();
        }
    }
}
