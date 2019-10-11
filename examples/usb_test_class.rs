#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_rt::entry;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

use hal::reg_modify;

use usb_device::test_class::TestClass;
use hal::usbfs::bus::UsbBus;

#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut syscon = hal.syscon;
    let mut pmc = hal.pmc;
    let iocon = hal.iocon.enabled(&mut syscon);

    iocon.configure_pio_0_22_as_usb0_vbus();

    iocon.disabled(&mut syscon); // perfectionist ;)

    // Setup clocking
    reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x0); // FRO 12 MHz
    reg_modify!(hal, SYSCON, fmccr, flashtim, flashtim8);
    unsafe { reg_modify!(hal, SYSCON, ahbclkdiv, div, 0u8) }; // This is actually the reset value
    reg_modify!(hal, SYSCON, mainclksela, sel, enum_0x3); // FRO 96 MHz
    unsafe { reg_modify!(hal, SYSCON, usb0clkdiv, div, 1u8) };
    reg_modify!(hal, SYSCON, usb0clkdiv, halt, run); // <-- toootally don't forget this ~groans~
    reg_modify!(hal, SYSCON, usb0clksel, sel, enum_0x0); // FRO 96 MHz

    let usbfsd = hal.usbfs.enabled_as_device(&mut pmc, &mut syscon);

    let usb_bus = UsbBus::new(usbfsd, ());
    let mut test = TestClass::new(&usb_bus);
    let mut usb_dev = { test.make_device(&usb_bus) };

    loop {
        if usb_dev.poll(&mut [&mut test]) {
            test.poll();
        }
    }
}
