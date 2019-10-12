#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_rt::entry;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

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

    let clocks = hal::clocks::Clocks::take().expect("Clocks already taken")
        .use_fro96mhz_as_main(&mut syscon)
        // try commenting this out
        .configure_usb(&mut syscon)
        .freeze()
    ;

    let token = clocks.valid_usb_clock_token().expect("Clocks are not configured appropriately for USB");

    let usbfsd = hal.usbfs.enabled_as_device(&mut pmc, &mut syscon, token);

    let usb_bus = UsbBus::new(usbfsd, ());
    let mut test = TestClass::new(&usb_bus);
    let mut usb_dev = { test.make_device(&usb_bus) };

    loop {
        if usb_dev.poll(&mut [&mut test]) {
            test.poll();
        }
    }
}
