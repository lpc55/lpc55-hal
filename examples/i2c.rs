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
        I2cMaster,
    },
};

use ssd1306;
use ssd1306::prelude::*;


#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut pmc = hal.pmc;
    let mut syscon = hal.syscon;
    let mut iocon = hal.iocon.enabled(&mut syscon);

    let clocks = hal::ClockRequirements::default()
        .system_frequency(150.mhz())
        // .support_flexcomm()
        .configure(&mut anactrl, &mut pmc, &mut syscon)
        .unwrap();

    // cortex_m_semihosting::hprintln!("clocks = {:?}", &clocks).ok();

    let token = clocks.support_flexcomm_token().unwrap();

    let i2c = hal.flexcomm.4.enabled_as_i2c(&mut syscon, &token);

    let pins = Pins::take().unwrap();
    let scl = pins.pio1_20.into_i2c4_scl_pin(&mut iocon);
    let sda = pins.pio1_21.into_i2c4_sda_pin(&mut iocon);

    let i2c = I2cMaster::new(i2c, (scl, sda), 100.khz());

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
    let mut display: TerminalMode<_> = ssd1306::Builder::new()
        .size(DisplaySize::Display128x32)
        // .size(DisplaySize::Display70x40)  // <-- TODO
        // .with_rotation(DisplayRotation::Rotate90)
        .with_i2c_addr(0x3c)
        .connect_i2c(i2c).into();

    display.init().ok();
    display.clear().ok();

    loop {
        for c in 97..123 {
            display.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) }).ok();
        }
        for c in 65..91 {
            display.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) }).ok();
        }
    }
}
