#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;
use cortex_m_semihosting::heprint;

use lpc55_hal as hal;
use hal::prelude::*;

/// PUF error
#[derive(Debug)]
pub enum State {
    NotEnrolled,
    Enrolled = 0x7533ff04,
}

macro_rules! dump_hex {
    ($array:expr, $length:expr ) => {

        heprint!("{:?} = ", stringify!($array)).unwrap();
        for i in 0..$length {
            heprint!("{:02X}", $array[i]).unwrap();
        }
        heprintln!("").unwrap();

    };
}

#[entry]
fn main() -> ! {

    dbg!("Hello PUF");

    // Get pointer to all device peripherals.
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::Syscon::from(dp.SYSCON);

    // Acquire PUF in an enabled state
    let puf = hal::Adc::from(dp.ADC0).enabled(&mut syscon);



    loop {

    }
}