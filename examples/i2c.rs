#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;
use cortex_m_rt::entry;
use core::fmt::Write;

use hal::prelude::*;
use lpc55s6x_hal as hal;

use hal::{
    drivers::{
        Pins,
        // I2cMaster,
        I2c4Master,
    },
    // peripherals::{
    //     flexcomm::I2c2,
    // },
};

use ssd1306;
use ssd1306::prelude::*;


#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut syscon = hal.syscon;
    let mut iocon = hal.iocon.enabled(&mut syscon);

    let _clocks = hal::ClockRequirements::default()
        .system_freq(24.mhz())
        .configure(&mut anactrl, /*&mut pmc,*/ &mut syscon)
        .unwrap();

    let i2c = hal.flexcomm4.enabled_as_i2c(&mut syscon);

    let pins = Pins::take().unwrap();
    let scl = pins.pio1_20.into_scl_pin(&mut iocon);
    let sda = pins.pio1_21.into_sda_pin(&mut iocon);
    // Or:
    // let scl = drivers::pins::Pio0_27::take().unwrap().into_scl_pin(&mut iocon);
    // let sda = drivers::pins::Pio1_24::take().unwrap().into_sda_pin(&mut iocon);

    // let _i2c = I2cMaster::<_, _, I2c2, _>::new(i2c2, (scl, sda));
    let i2c = I2c4Master::new(i2c, (scl, sda));

    // let on = true;
    // let display_on = ([0xAE | (on as u8), 0, 0, 0, 0, 0, 0], 1);
    // let (data, len) = display_on;

    // for addr in 1..128 {
    //     hprintln!().ok();
    //     hprintln!("trying addr {:x}", addr).ok();
    //     if let Err(err) = i2c.write(addr, &data[..len]) {
    //         hprintln!("err {:?}", err).ok();
    //     } else {
    //         hprintln!("addr {:x} IS A WINNER!", addr).ok();
    //     }
    // }

    // OLED
    let mut disp: TerminalMode<_> = ssd1306::Builder::new()
        .size(DisplaySize::Display128x32)
        // .size(DisplaySize::Display70x40)
        // .with_rotation(DisplayRotation::Rotate90)
        .with_i2c_addr(0x3c)
        .connect_i2c(i2c).into();

    disp.init().unwrap();
    let _ = disp.clear();

    /* Endless loop */
    loop {
        for c in 97..123 {
            let _ = disp.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) });
        }
        for c in 65..91 {
            let _ = disp.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) });
        }
    }
}
