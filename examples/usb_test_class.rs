#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;
use cortex_m_rt::entry;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55_hal as hal;

use usb_device::test_class::TestClass;
use hal::drivers::{
    pins,
    UsbBus,
};

#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut syscon = hal.syscon;
    let mut pmc = hal.pmc;

    let mut iocon = hal.iocon.enabled(&mut syscon);
    let usb0_vbus_pin = pins::Pio0_22::take().unwrap().into_usb0_vbus_pin(&mut iocon);
    iocon.disabled(&mut syscon); // perfectionist ;)

    let clocks = hal::ClockRequirements::default()
        // .fro96mhz_main_clock()
        // .system_frequency(12.mhz())
        .system_frequency(24.mhz())
        .support_usbfs()
        .configure(&mut anactrl, &mut pmc, &mut syscon)
        .expect("Clock configuration failed");

    let token = clocks.support_usbfs_token().expect(
        "Fro96MHz is not enabled or CPU freq below 12MHz, both of which the USB needs");

    let usbfsd = hal.usbfs.enabled_as_device(
        &mut anactrl,
        &mut pmc,
        &mut syscon,
        token);

    let usb_bus = UsbBus::new(usbfsd, usb0_vbus_pin);
    let mut test = TestClass::new(&usb_bus);
    let mut usb_dev = { test.make_device(&usb_bus) };

    loop {
        if usb_dev.poll(&mut [&mut test]) {
            test.poll();
        }
    }
}
