#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_rt::entry;

use lpc55s6x_hal::prelude::*;

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

    let mut utick = peripherals.UTICK.enable(&mut syscon.handle);
	let clock = syscon.fro_1mhz_utick_clock.enable(&mut syscon.handle);
	let mut sleep = hal::sleep::Busy::prepare(&mut utick);
	let delay = hal::clock::Ticks { value: 1_000_000, clock: &clock }; // 1000 ms

    loop {
        #![allow(deprecated)]
        // this is to workaround the v1/v2 digital pin
        // situation, until Vadim's v3 lands

        red.set_low();
		sleep.sleep(delay);

        red.set_high();
		sleep.sleep(delay);
    }
}
