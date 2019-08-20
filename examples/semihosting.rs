#![no_main]
#![no_std]

// extern crate lpc55s6x_hal;
extern crate panic_semihosting;
use cortex_m_semihosting::hprintln;
use cortex_m::asm;
use cortex_m_rt::entry;

// use lpc55s6x_hal::prelude::*;

#[entry]
fn main() -> ! {
    const UUID: *mut u32 = 0x0009_FC70 as *mut u32;
    let mut uuid: [u32; 4] = [0; 4];
    for i in 0..4 {
        uuid[i] = unsafe { UUID.offset(i as isize).read_volatile() };
    }
    hprintln!("uuid = {:x?}", uuid).unwrap();

    loop {
        asm::wfi();
    }
}


