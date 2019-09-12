#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_rt::entry;

use hal::prelude::*;
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::syscon::wrap(dp.SYSCON);
    let mut gpio = hal::gpio::wrap(dp.GPIO).enabled(&mut syscon);
    let iocon = hal::iocon::wrap(dp.IOCON);

    // UM kind of says it's not enabled, but it actually is
    let iocon = iocon.enable(&mut syscon);

    // R = pio1_6
    // G = pio1_7
    // B = pio1_4
    //
    // on = low, off = high

    let pins = hal::pins::Pins::take().unwrap();
    let mut red = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        .into_output(hal::gpio::Level::High); // start turned off

    let iocon = iocon.disable(&mut syscon);
    iocon.release();

    let clock = hal::syscon::Fro1MhzUtickClock::take()
        .unwrap()
        .enable(&mut syscon);
    let delay = hal::clock::Ticks {
        value: 500_000,
        clock: &clock,
    }; // 500 ms = 0.5 s

    // let mut utick = peripherals.UTICK.enable(&mut syscon);
    let mut utick = hal::utick::wrap(dp.UTICK).enabled(&mut syscon);
    let mut sleep = hal::sleep::Busy::prepare(&mut utick);

    loop {
        sleep.sleep(delay);
        red.set_low().unwrap();

        sleep.sleep(delay);
        red.set_high().unwrap();
    }
}
