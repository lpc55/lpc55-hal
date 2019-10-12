#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_rt::entry;
// use cortex_m_semihosting::{dbg, hprintln};

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

// use hal::{reg_read, reg_modify};

use usbd_serial::SerialPort;
use usb_device::device::{UsbDeviceBuilder, UsbVidPid};
use hal::usbfs::bus::UsbBus;


#[entry]
fn main() -> ! {
    // let peripherals = hal::raw::Peripherals::take().unwrap();
    // let mut syscon = hal::Syscon::from(peripherals.SYSCON);
    // let iocon = hal::Iocon::from(peripherals.IOCON).enabled(&mut syscon);
    // let mut pmc = peripherals.PMC.into();
    // // let mut pmc = hal::Pmc::from(peripherals.PMC);

    // let mut gpio = hal::Gpio::from(peripherals.GPIO).enabled(&mut syscon);

    // let raw_core_peripherals = hal::raw::CorePeripherals::take().unwrap();
    // let raw_device_peripherals = hal::raw::Peripherals::take().unwrap();

    // let hal_peripherals = hal::Peripherals::from((raw_device_peripherals, raw_core_peripherals));


    // let hal_peripherals = hal::Peripherals::from((
    //     hal::raw::Peripherals::take().unwrap(),
    //     hal::raw::CorePeripherals::take().unwrap(),
    // ));


    let hal = hal::new();
    // let hal2 = hal::new();  // panics...

    let mut syscon = hal.syscon;
    let mut pmc = hal.pmc;

    let iocon = hal.iocon.enabled(&mut syscon);
    let mut gpio = hal.gpio.enabled(&mut syscon);

    // BOARD_InitPins
    iocon.configure_pio_0_22_as_usb0_vbus();
    let pins = hal::pins::Pins::take().unwrap();
    // let usb0_vbus = pins.pio0_22;
    let mut red_led = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        .into_output(hal::gpio::Level::High); // start turned off

    // Setup clocking
    let clocks = hal::clocks::Clocks::take().expect("Clocks already taken")
        .use_fro96mhz_as_main(&mut syscon)
        // try commenting this out
        .configure_usb(&mut syscon)
        .freeze()
    ;

    // does not work
    // let token = hal::states::ValidUsbClockToken{_private: core::marker::PhantomData};
    let token = clocks.valid_usb_clock_token().expect("Clocks are not configured appropriately for USB");

    let usbfsd = hal.usbfs.enabled_as_device(
        &mut pmc,
        &mut syscon,
        token,
    );

    // let usb_bus = UsbBus::new(peripherals.USB0, (usb0_vbus,));
    let usb_bus = UsbBus::new(usbfsd, ());
    let mut serial = SerialPort::new(&usb_bus);

    let mut usb_dev = UsbDeviceBuilder::new(&usb_bus, UsbVidPid(0x1209, 0xcc1d))
        .manufacturer("nickray")
        .product("Demo Demo Demo")
        .serial_number("2019-10-10")
        .device_release(0x0123)
        // using default of 8 seems to work now
        // .max_packet_size_0(64)
        // .device_class(USB_CLASS_CDC)
        .build();

    // dbg!("main loop");
    loop {
        // if !usb_dev.poll(&mut []) {
        if !usb_dev.poll(&mut [&mut serial]) {
            continue;
        }

        let mut buf = [0u8; 64];

        match serial.read(&mut buf) {
            Ok(count) if count > 0 => {
                // hprintln!("received some data on the serial port: {:?}", &buf[..count]).ok();
                red_led.set_low().ok(); // Turn on

                // Echo back in upper case
                for c in buf[0..count].iter_mut() {
                    if (0x61 <= *c && *c <= 0x7a) || (0x41 <= *c && *c <= 0x5a) {
                        *c ^= 0x20;
                    }
                }

                let mut write_offset = 0;
                while write_offset < count {
                    match serial.write(&buf[write_offset..count]) {
                        Ok(len) if len > 0 => {
                            write_offset += len;
                        },
                        _ => {},
                    }
                }

                // hprintln!("wrote it back").ok();
            }
            _ => {}
        }

        red_led.set_high().ok(); // Turn off
    }

}
