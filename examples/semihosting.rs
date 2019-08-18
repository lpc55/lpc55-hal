#![no_main]
#![no_std]

// extern crate lpc55s6x_hal;
extern crate panic_semihosting;
use cortex_m_semihosting::hprintln;

// use lpc55s6x_hal::prelude::*;

#[cortex_m_rt::entry]
fn main() -> ! {
    hprintln!("Going into endless loop...").unwrap();

    loop {
        cortex_m::asm::wfi();
    }
}


