#![no_main]
#![no_std]

use core::convert::TryInto;

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
    Enrolled = 0x7534ff04,
}

macro_rules! dump_hex {
    ($array:expr, $length:expr ) => {

        heprint!("{:?} = ", stringify!($array)).unwrap();
        for i in 0..$length {
            heprint!("{:X}", $array[i]).unwrap();
        }
        heprintln!("").unwrap();

    };
}

#[entry]
fn main() -> ! {

    dbg!("Hello PUF");

    const PUF_STATE_FLASH: usize = 0x0006_0000; // 320kB offset

    // Get pointer to all device peripherals.
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::Syscon::from(dp.SYSCON);

    // Acquire PUF in an enabled state
    let puf = hal::Puf::from(dp.PUF).enabled(&mut syscon);

    let mut flash = hal::Flash::from(dp.FLASH).enabled(&mut syscon);
    let mut flash = hal::FlashGordon::new(flash);

    // Show PUF peripheral initial info
    dbg!(puf.version());
    dbg!(&puf);

    let mut buffer = [0u8; 16];
    flash.read(PUF_STATE_FLASH, &mut buffer);

    let state: u32 = u32::from_ne_bytes(buffer[0..4].try_into().unwrap() );
    let mut ac = [0u8; 1192];
    let mut ac2 = [0u8; 1192];

    if state != (State::Enrolled as u32) {
        dbg!("The is not yet enrolled. "); 
        dbg!("enrolling...");
        let mut write_buf = [0u8; 512];
        let mut tmp_buf = [0u8; 512];

        puf.enroll(&mut ac).unwrap();
        
        for i in (0..1000).step_by(40) {  dump_hex!(ac[i..i+40], 40);  }
        for i in (1000..1192).step_by(8) {  dump_hex!(ac[i..i+8], 8);  }

        // Clear 3, 512-byte pages for segment: [ 16-byte header | 1192 byte AC ]
        for addr in (PUF_STATE_FLASH .. PUF_STATE_FLASH + 512*3).step_by(512) {
            flash.erase_page(addr >> 4).unwrap();
        }

        // write first 512-byte chunk
        write_buf[0..4].copy_from_slice(&(State::Enrolled as u32).to_ne_bytes());
        write_buf[16..].copy_from_slice(&ac[..496]);
        flash.write(PUF_STATE_FLASH + 0 , &write_buf).unwrap();

        // // write 2nd chunk
        write_buf.copy_from_slice(&ac[496..1008]);
        flash.write(PUF_STATE_FLASH + 512 , &write_buf).unwrap();

        // write 3rd chunk
        write_buf[0..184].copy_from_slice(&ac[1008..1192]);
        flash.write(PUF_STATE_FLASH + 1024 , &write_buf).unwrap();

        dbg!("Reading back...");
        flash.read(PUF_STATE_FLASH + 16, &mut ac2);
        for i in (0..1000).step_by(40) {  dump_hex!(ac2[i..i+40], 40);  }
        for i in (1000..1192).step_by(8) {  dump_hex!(ac2[i..i+8], 8);  }

    } else {
        dbg!("The device is already enrolled."); 
        flash.read(PUF_STATE_FLASH + 16, &mut ac);
        
        dump_hex!(ac[..16], 16);
        dump_hex!(ac[1192-16..], 16);
    }


    dbg!(&puf);


    loop {
        
    }
}
