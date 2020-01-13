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
    let mut KC1 = [0u8; 52];
    let mut KC2 = [0u8; 52];
    let mut KC3 = [0u8; 52];
    let mut KC4 = [0u8; 52];
    let mut check_buf = [0u8; 1192+52*4];

    if state != (State::Enrolled as u32) {
        dbg!("The is not yet enrolled. "); 
        dbg!("enrolling...");
        let mut write_buf = [0u8; 512];
        let mut tmp_buf = [0u8; 512];
        let mut key_codes = [0u32; 4];

        let puf_enrolled = puf.enroll(&mut ac).unwrap();

        dbg!(&puf_enrolled);
        
        dump_hex!(ac[..16], 16);
        dump_hex!(ac[1192-16..], 16);


        dbg!("Generate 2 IP-direct keys, and 2 normal keys.");
        puf_enrolled.generate_key(256, 0, &mut KC1).unwrap();
        puf_enrolled.generate_key(256, 0, &mut KC2).unwrap();
        puf_enrolled.generate_key(256, 1, &mut KC3).unwrap();
        puf_enrolled.generate_key(256, 2, &mut KC4).unwrap();

        // Print the 32 bit header + 32 bit of data for curiousity
        dump_hex!(KC1[0..8],8);
        dump_hex!(KC2[0..8],8);
        dump_hex!(KC3[0..8],8);
        dump_hex!(KC4[0..8],8);

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

        // write 3rd chunk, with 4 KC's appended
        write_buf[0..184].copy_from_slice(&ac[1008..1192]);
        write_buf[184..236].copy_from_slice(&KC1);
        write_buf[236..288].copy_from_slice(&KC2);
        write_buf[288..340].copy_from_slice(&KC3);
        write_buf[340..392].copy_from_slice(&KC4);
        flash.write(PUF_STATE_FLASH + 1024 , &write_buf).unwrap();

        dbg!("Reading back...");
        flash.read(PUF_STATE_FLASH + 16, &mut check_buf);
        dump_hex!(check_buf[..16], 16);
        dump_hex!(check_buf[1192-16..], 16);
        for i in 0..ac.len() { assert!( ac[i] == check_buf[i] ) }

        for i in 0..KC1.len() { assert!( KC1[i] == check_buf[1192+52*0+i] ) }
        for i in 0..KC2.len() { assert!( KC2[i] == check_buf[1192+52*1+i] ) }
        for i in 0..KC3.len() { assert!( KC3[i] == check_buf[1192+52*2+i] ) }
        for i in 0..KC4.len() { assert!( KC4[i] == check_buf[1192+52*3+i] ) }

        dbg!("Now restart this program to derive the keys.");

    } else {
        dbg!("The device is already enrolled."); 
        flash.read(PUF_STATE_FLASH + 16, &mut check_buf);
        for i in 0..1192 {ac[i] = check_buf[i];}

        for i in 0..KC1.len() { KC1[i] = check_buf[1192+52*0+i]; }
        for i in 0..KC2.len() { KC2[i] = check_buf[1192+52*1+i]; }
        for i in 0..KC3.len() { KC3[i] = check_buf[1192+52*2+i]; }
        for i in 0..KC4.len() { KC4[i] = check_buf[1192+52*3+i]; }

        
        dump_hex!(ac[..16], 16);
        dump_hex!(ac[1192-16..], 16);

        let puf_started = puf.start(&ac).unwrap();

        dbg!("Started.");
        dbg!(&puf_started);

        dbg!("Loading AES and Prince Keys..");
        // Load into AES IP, and Prince IP for 3 address regions
        puf_started.get_key(hal::peripherals::puf::KeyDestination::AES, &KC1, &mut[0u8;0]).unwrap();
        puf_started.get_key(hal::peripherals::puf::KeyDestination::PRINCE1, &KC2, &mut[0u8;0]).unwrap();
        puf_started.get_key(hal::peripherals::puf::KeyDestination::PRINCE2, &KC2, &mut[0u8;0]).unwrap();
        puf_started.get_key(hal::peripherals::puf::KeyDestination::PRINCE3, &KC2, &mut[0u8;0]).unwrap();

        dbg!("Loading SW Keys..");
        let mut key1 = [0u8; 32];
        let mut key2 = [0u8; 32];
        puf_started.get_key(hal::peripherals::puf::KeyDestination::OUTPUT, &KC3, &mut key1).unwrap();
        puf_started.get_key(hal::peripherals::puf::KeyDestination::OUTPUT, &KC4, &mut key2).unwrap();

        dump_hex!(key1, 32);
        dump_hex!(key2, 32);

        dbg!(&puf_started);
        dbg!("Done");

    }




    dbg!("Looping");
    loop {
        
    }
}
