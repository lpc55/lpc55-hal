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
    // TODO: use hal::Peripherals
    let mut peripherals = hal::raw::Peripherals::take().unwrap();

    let mut syscon = hal::syscon::SYSCON::new(peripherals.SYSCON).split();

    // TODO: make this method generic over i (in this case, 2)
    dbg!(syscon.handle.is_clock_enabled2(&peripherals.RNG));  // seems default is: yes!
    syscon.handle.disable_clock2(&mut peripherals.RNG);
    dbg!(syscon.handle.is_clock_enabled2(&peripherals.RNG));
    syscon.handle.enable_clock2(&mut peripherals.RNG);
    dbg!(syscon.handle.is_clock_enabled2(&peripherals.RNG));

    // NB: if RNG clock were disabled, reads below would get stuck

    // raw access
    dbg!(peripherals.RNG.random_number.read().bits());

    // HAL access
    let mut rng = hal::rng::Rng::new(peripherals.RNG);
    let mut random_bytes = [0u8; 5];
    rng.read(&mut random_bytes).expect("RNG failure");
    dbg!(random_bytes);

    dbg!(rng.module_id());

    // let syscon = hal::syscon::SYSCON::new(peripherals.SYSCON);
    // dbg!(syscon.rev_id());

    loop {
        asm::wfi();
        // dbg!(rng.get_random_u32());
    }
}
