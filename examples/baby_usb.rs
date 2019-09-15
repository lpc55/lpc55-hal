#![no_main]
#![no_std]

///
/// Compare also with: https://github.com/Ko-/aes-armcortexm
///
extern crate panic_halt;
use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut pmc = hal::pmc::wrap(dp.PMC);
    let mut syscon = hal::syscon::wrap(dp.SYSCON);
    let usbfs = hal::usbfs::wrap(dp.USB0);

    // dbg!(syscon.is_clock_enabled(&dp.USB0)); // false
    // syscon.enable_clock(&mut dp.USB0);
    // dbg!(syscon.is_clock_enabled(&dp.USB0)); // true

    // dbg!(pmc.is_powered(&dp.USB0)); // false
    // pmc.power_on(&mut dp.USB0);
    // dbg!(pmc.is_powered(&dp.USB0)); // true

    dbg!(usbfs.is_enabled(&pmc, &syscon)); // false
    let usbfs = usbfs.enabled(&mut pmc, &mut syscon);
    dbg!(usbfs.is_enabled(&pmc, &syscon)); // true

    // UM says: (5, 1)  <-- probly swapped
    // We get: (1, 6)
    dbg!(usbfs.info());

    loop {
        asm::wfi();
    }
}
