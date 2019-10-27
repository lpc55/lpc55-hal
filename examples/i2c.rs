#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;
use cortex_m_rt::entry;

use lpc55s6x_hal as hal;

use hal::{
    drivers::{
        Pins,
        I2cMaster,
    }
};

#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut syscon = hal.syscon;
    let mut iocon = hal.iocon.enabled(&mut syscon);
    let i2c2 = hal.flexcomm2.enabled_as_i2c(&mut syscon);

    let pins = Pins::take().unwrap();
    let scl = pins.pio0_27.into_scl_pin(&mut iocon);
    let sda = pins.pio1_24.into_sda_pin(&mut iocon);
    // Or:
    // let scl = drivers::pins::Pio0_27::take().unwrap().into_scl_pin(&mut iocon);
    // let sda = drivers::pins::Pio1_24::take().unwrap().into_sda_pin(&mut iocon);

    let _: () = i2c2;

    let i2c = I2cMaster::new(i2c2, (scl, sda));

    loop { continue; }

}
