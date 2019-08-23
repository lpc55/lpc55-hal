#![no_main]
#![no_std]

// extern crate lpc55s6x_hal;
extern crate panic_semihosting;
use cortex_m_semihosting::dbg;
use cortex_m::asm;
use cortex_m_rt::entry;

// use lpc55s6x_hal::prelude::*;

#[entry]
fn main() -> ! {
    const UUID: *mut u32 = 0x0009_FC70 as *mut u32;
    dbg!(UUID);
    let mut uuid: [u32; 4] = [0; 4];
    for i in 0..4 {
        uuid[i] = unsafe { dbg!(UUID.offset(i as isize).read_volatile()) };
    }
    dbg!(uuid);

    loop {
        asm::wfi();
    }
}


