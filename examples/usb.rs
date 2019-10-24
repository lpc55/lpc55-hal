#![no_main]
#![no_std]

// extern crate panic_semihosting;
extern crate panic_halt;
use cortex_m_rt::entry;
// use cortex_m_semihosting::{dbg, hprintln};

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

// use hal::{reg_read, reg_modify};

use usbd_serial::{CdcAcmClass, SerialPort};
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

    let mut anactrl = hal.anactrl;
    let mut pmc = hal.pmc;
    let mut syscon = hal.syscon;

    let mut gpio = hal.gpio.enabled(&mut syscon);
    let iocon = hal.iocon.enabled(&mut syscon);

    // BOARD_InitPins
    iocon.configure_pio_0_22_as_usb0_vbus();
    let pins = hal::pins::Pins::take().unwrap();
    // let usb0_vbus = pins.pio0_22;
    let mut red_led = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        .into_output(hal::gpio::Level::High); // start turned off

    let clocks = hal::clocks::ClockRequirements::default()
        .system_freq(48.mhz())
        .support_usbfs()
        .configure(&mut anactrl, &mut pmc, &mut syscon)
        .unwrap();
        // .expect("Clock configuration failed");

    let token = clocks.support_usbfs_token()
        .unwrap();
        // .expect(
        //     "Fro96MHz is not enabled or CPU freq below 12MHz, both of which the USB needs");

    let usbfsd = hal.usbfs.enabled_as_device(
        &mut anactrl,
        &mut pmc,
        &mut syscon,
        token,
    );

    // let usb_bus = UsbBus::new(peripherals.USB0, (usb0_vbus,));
    let usb_bus = UsbBus::new(usbfsd, ());
    // let mut serial = SerialPort::new(&usb_bus);
    let mut cdc_acm = CdcAcmClass::new(&usb_bus, 8);

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
    let mut need_zlp = false;
    let mut buf = [0u8; 8];
    let mut size = 0;
    let mut buf_in_use = false;
    loop {
        // if !usb_dev.poll(&mut []) {
        // if !usb_dev.poll(&mut [&mut serial]) {
        if !usb_dev.poll(&mut [&mut cdc_acm]) {
            continue;
        }

        if !(buf_in_use || need_zlp) {
            match cdc_acm.read_packet(&mut buf) {
                Ok(count) => {
                    size = count;
                    buf_in_use = true;
                    // dbg!(&buf[..count]);
                    // if count > 1 {
                    //     dbg!(count);
                    // }
                },
                _ => {}
            }
        }

        if buf_in_use {
            red_led.set_low().ok(); // Turn on
            match cdc_acm.write_packet(&buf[..size]) {
                Ok(count) => {
                    assert!(count == size);
                    buf_in_use = false;
                    need_zlp = size == 8;
                },
                _ => {}
            }
            red_led.set_high().ok(); // Turn off
        }

        if need_zlp {
            match cdc_acm.write_packet(&[]) {
                Ok(count) => {
                    assert!(count == 0);
                    need_zlp = false;
                },
                _ => {}
            }
        }


        // let mut buf = [0u8; 512];

        // match serial.read(&mut buf) {
        //     Ok(count) if count > 0 => {
        //         assert!(count == 1);
        //         // hprintln!("received some data on the serial port: {:?}", &buf[..count]).ok();
        //         // cortex_m_semihosting::hprintln!("received:\n{}", core::str::from_utf8(&buf[..count]).unwrap()).ok();
        //         red_led.set_low().ok(); // Turn on

        //         // cortex_m_semihosting::hprintln!("read {:?}", &buf[..count]).ok();
        //         cortex_m_semihosting::hprintln!("read {:?}", count).ok();

        //         // Echo back in upper case
        //         for c in buf[0..count].iter_mut() {
        //             if (0x61 <= *c && *c <= 0x7a) || (0x41 <= *c && *c <= 0x5a) {
        //                 *c ^= 0x20;
        //             }
        //         }

        //         let mut write_offset = 0;
        //         while write_offset < count {
        //             match serial.write(&buf[write_offset..count]) {
        //                 Ok(len) if len > 0 => {
        //                     write_offset += len;
        //                     cortex_m_semihosting::hprintln!("wrote {:?}", len).ok();

        //                 },
        //                 _ => {},
        //             }
        //         }

        //         // hprintln!("wrote it back").ok();
        //     }
        //     _ => {}
        // }

        // red_led.set_high().ok(); // Turn off
    }

}
