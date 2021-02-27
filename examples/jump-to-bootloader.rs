#![no_main]
#![no_std]

// extern crate panic_semihosting;  // 4004 bytes
extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;

use hal::{drivers::pins::Level, prelude::*};
use lpc55_hal as hal;

#[entry]
fn main() -> ! {
    let hal = hal::new();

    let mut syscon = hal.syscon;
    let mut iocon = hal.iocon.enabled(&mut syscon).release();

    // Conor's trick: make the bootloader think ISP0 is asserted,
    // even though it's not!
    iocon.pio0_5.modify(|r, w| w.invert().set_bit());
    unsafe { cortex_m::asm::bootload(0x03000000 as *const u32); }
}
