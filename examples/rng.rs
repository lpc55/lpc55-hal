#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_semihosting::dbg;
use cortex_m::asm;
use cortex_m_rt::entry;

use lpc55s6x_hal as hal;
use embedded_hal::blocking::rng::Read;

#[entry]
fn main() -> ! {
    let peripherals = hal::raw::Peripherals::take().unwrap();

    // raw access
    dbg!(peripherals.RNG.random_number.read().bits());

    // HAL access
    let mut rng = hal::rng::Rng::new(peripherals.RNG);
    let mut random_bytes = [0u8; 5];
    rng.read(&mut random_bytes).expect("RNG failure");
    dbg!(random_bytes);

    loop {
        asm::wfi();
    }
}
