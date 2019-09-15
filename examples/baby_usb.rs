#![no_main]
#![no_std]

///
/// Compare also with: https://github.com/Ko-/aes-armcortexm
///
extern crate panic_halt;
use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;

use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;


#[entry]
fn main() -> ! {
    let mut dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::syscon::wrap(dp.SYSCON);

    syscon.enable_clock(&mut dp.USB0);

    // returns 0x0, 0x0 if clock is not enabled...
    // UM says: (5, 1)  <-- probly swapped
    // We get: (1, 6)
    dbg!(dp.USB0.info.read().majrev().bits());
    dbg!(dp.USB0.info.read().minrev().bits());
    dbg!(dp.USB0.info.read().frame_nr().bits());
    dbg!(dp.USB0.info.read().err_code().bits());

    loop {
        asm::wfi();
    }
}
