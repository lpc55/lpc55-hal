#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;
use cortex_m_semihosting::heprint;

use lpc55_hal as hal;

macro_rules! dump_hex {
    ($array:expr, $length:expr ) => {

        heprint!("{:?} = ", stringify!($array)).unwrap();
        for i in 0..$length {
            heprint!("0x{:X},", $array[i]).unwrap();
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
    let puf = hal::Puf::from(dp.PUF).enabled(&mut syscon);

    // Show PUF peripheral initial info
    dbg!(puf.version());
    dbg!(&puf);

    dbg!("enrolling...");

    let mut ac = [0u32; 298];

    puf.enroll(&mut ac).unwrap();

    dump_hex!(ac, 298);

    dbg!(&puf);


    loop {
        
    }
}
