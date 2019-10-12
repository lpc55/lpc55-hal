#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;
use cortex_m_rt::entry;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

use usb_device::test_class::TestClass;
use hal::usbfs::bus::UsbBus;
use hal::clocks;

#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut syscon = hal.syscon;
    let mut pmc = hal.pmc;
    let iocon = hal.iocon.enabled(&mut syscon);

    iocon.configure_pio_0_22_as_usb0_vbus();

    iocon.disabled(&mut syscon); // perfectionist ;)

    let clocks = hal::clocks::ClockRequirements::default()
        // .fro96mhz_main_clock()
        .system_freq(12.mhz())
        .support_usbfs()
        .configure(&mut anactrl, &mut pmc, &mut syscon)
        .expect("Clock configuration failed");

    // cortex_m_semihosting::hprintln!("{:?}", clocks).ok();

    let token = clocks.support_usbfs_token().expect(
        "Fro96MHz is not enabled or CPU freq below 12MHz, both of which the USB needs");

    let usbfsd = hal.usbfs.enabled_as_device(
        &mut anactrl,
        &mut pmc,
        &mut syscon,
        token);

    let usb_bus = UsbBus::new(usbfsd, ());
    let mut test = TestClass::new(&usb_bus);
    let mut usb_dev = { test.make_device(&usb_bus) };

    loop {
        if usb_dev.poll(&mut [&mut test]) {
            test.poll();
        }
    }
}
