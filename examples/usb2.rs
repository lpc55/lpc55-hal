#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::{dbg, hprintln};

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

// use core::ptr;

macro_rules! reg_modify {
    ($peripheral:ident, $register:ident, $field:ident, $what:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.modify(|_, w| w.$field().$what())
    };
}
macro_rules! reg_modify_bits {
    ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
        unsafe { &(*hal::raw::$peripheral::ptr()).$register.modify(|_, w| w.$field().bits($value)) }
    };
}
macro_rules! reg_write_bits {
    ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
        unsafe { &(*hal::raw::$peripheral::ptr()).$register.write(|w| w.$field().bits($value)) }
    };
}
macro_rules! reg_read {
    ($peripheral:ident, $register:ident, $field:ident, $what:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().$what()
    };
}
macro_rules! reg_read_bits {
    ($peripheral:ident, $register:ident, $field:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bits()
    };
}
macro_rules! dbg_endpoint_read_bits {
    ($peripheral:ident, $register:ident, $field:ident) => {
        hprintln!("{:x}", unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bits()).unwrap();
    };
}
macro_rules! reg_read_bit {
    ($peripheral:ident, $register:ident, $field:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bit()
    };
}
// macro_rules! dbg_endpoint_modify {
//     ($peripheral:ident, $register:ident, $field:ident, $what:ident, $is_what:ident) => {
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//         reg_modify!($peripheral, $register, $field, $what);
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//     };
// }
// macro_rules! dbg_endpoint_modify_bits {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         dbg!(reg_read_bits!($peripheral, $register, $field));
//         reg_modify_bits!($peripheral, $register, $field, $value);
//         dbg!(reg_read_bits!($peripheral, $register, $field));
//     };
// }

// macro_rules! reset {
//     ($field:ident, $register:ident) => {
//         let syscon = unsafe { &(*hal::raw::SYSCON::ptr()) };
//         syscon.$register.modify(|_, w| w.$field().asserted());
//         while syscon.$register.read().$field().is_released() {}
//         syscon.$register.modify(|_, w| w.$field().released());
//         while syscon.$register.read().$field().is_asserted() {}
//     };
// }
//
// #[macro_use]
use hal::macros::*;

use hal::{read_endpoint, write_endpoint, modify_endpoint};

#[entry]
fn main() -> ! {

    let dp = hal::raw::Peripherals::take().unwrap();
    // let mut pmc = hal::pmc::wrap(dp.PMC);
    // let mut syscon = hal::syscon::wrap(dp.SYSCON);
    // let mut iocon = hal::iocon::wrap(dp.IOCON).enabled(&mut syscon);
    // let mut iocon = hal::iocon::wrap(dp.IOCON);
    let iocon = hal::iocon::wrap(dp.IOCON);

    // BOARD_InitPins
    iocon.configure_pio_0_22_as_usb0_vbus();

    // All this stuff is zero. Is the peripheral on?
    // dbg_endpoint_read_bits!(FLASH_CMPA, boot_cfg, boot_speed);
    // dbg_endpoint_read_bits!(FLASH_CMPA, boot_cfg, default_isp_mode);
    // dbg_endpoint_read_bits!(FLASH_CMPA, boot_cfg, boot_failure_pin);

    // dbg_endpoint_read_bits!(FLASH_CMPA, secure_boot_cfg, sec_boot_en);
    // dbg_endpoint_read_bits!(FLASH_CMPA, secure_boot_cfg, tzm_image_type);

    dbg!(reg_read_bits!(SYSCON, mainclksela, sel));
    // dbg!(reg_read_bits!(SYSCON, ahbclksel, sel));
    dbg!(reg_read_bits!(SYSCON, ahbclkdiv, div));
    dbg!(reg_read_bits!(SYSCON, ahbclkdiv, halt));
    dbg!(reg_read_bits!(SYSCON, pll0clksel, sel));
    dbg!(reg_read_bits!(SYSCON, pll1clksel, sel));
    dbg!(reg_read_bits!(SYSCON, systickclkdiv0, div));
    dbg!(reg_read_bits!(SYSCON, systickclkdiv0, halt));
    // dbg!(reg_read_bits!(SYSCON, frohfclksel, sel));
    dbg!(reg_read_bits!(SYSCON, frohfdiv, div));
    dbg!(reg_read_bits!(SYSCON, frohfdiv, halt));
    dbg!(reg_read_bits!(SYSCON, usb0clksel, sel));
    dbg!(reg_read_bits!(SYSCON, usb0clkdiv, div));
    dbg!(reg_read_bits!(SYSCON, usb0clkdiv, halt));

    dbg_endpoint_read_bits!(SYSCON, usb0clkdiv, div);
    dbg!(reg_read!(SYSCON, usb0clkdiv, halt, is_run));

    dbg!(reg_read_bits!(SYSCON, mainclksela, sel));
    reg_modify!(SYSCON, mainclksela, sel, enum_0x0); // FRO 12 MHz, was enum_0x3
    reg_modify_bits!(SYSCON, fmccr, flashtim, 4); // without this, the setting MAINCLKSELA to 0x3 fails
    reg_modify_bits!(SYSCON, ahbclkdiv, div, 1u8);
    while reg_read!(SYSCON, ahbclkdiv, reqflag, is_ongoing) {}  // never stops for div=1
    reg_modify_bits!(SYSCON, mainclksela, sel, 3); // FRO 96 MHz

    reg_modify!(PMC, pdruncfg0, pden_usbfsphy, poweredon);
    hprintln!("{:x}", reg_read_bits!(SYSCON, usb0clkdiv, div)).unwrap();
    hprintln!("{:?}", reg_read_bit!(SYSCON, usb0clkdiv, halt)).unwrap();
    // hprintln!("{:x}", core::ptr::read_volatile((0x5000_0000u32 + 0x398) as *const u32)).unwrap();

    dbg!(reg_read_bits!(SYSCON, usb0clkdiv, div));
    reg_modify!(SYSCON, usb0clkdiv, halt, halt);
    dbg!(reg_read!(SYSCON, ahbclkctrl1, usb0_dev, is_enable));
    reg_modify_bits!(SYSCON, usb0clkdiv, div, 1u8);
    dbg!(reg_read_bits!(SYSCON, usb0clksel, sel));
    // while reg_read!(SYSCON, usb0clkdiv, reqflag, is_ongoing) {}  // never stops for div=1
    reg_modify!(SYSCON, usb0clkdiv, halt, run);

    hprintln!("{:x}", reg_read_bits!(SYSCON, usb0clkdiv, div)).unwrap();
    hprintln!("{:?}", reg_read_bit!(SYSCON, usb0clkdiv, halt)).unwrap();
    // hprintln!("{:x}", core::ptr::read_volatile((0x5000_0000u32 + 0x398) as *const u32)).unwrap();
    // reg_modify_bits!(SYSCON, usb0clksel, sel, 3); // FRO 96 MHz
    reg_modify_bits!(SYSCON, usb0clksel, sel, 0); // FRO 96 MHz
    while reg_read!(SYSCON, usb0clkdiv, reqflag, is_ongoing) {}  // never stops for div=1 *before* selecting it

    reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, enable);
    dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));
    reg_modify!(USBFSH, portmode, dev_enable, set_bit);

    dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));

    use vcell::VolatileCell;
    use core::slice;
    const EP_MEM_PTR: *mut VolatileCell<u8> = 0x4010_0000 as *mut VolatileCell<u8>;
    let mem: &mut [VolatileCell<u8>] = unsafe {
        slice::from_raw_parts_mut(EP_MEM_PTR, 0x4000)
    };
    // need to enable the clock for USB1_RAM before using it
    reg_modify!(SYSCON, ahbclkctrl2, usb1_ram, enable);
    mem[1].set(0x37);
    assert!(mem[1].get() == 0x37);
    mem[6].set(0x38);
    assert!(mem[6].get() == 0x38);

//         let mem = unsafe {
//             slice::from_raw_parts_mut(
//                 EP_MEM_PTR.offset((offset_bytes >> 1) as isize),
//                 size_bytes >> 1)
//         };
//         Self(mem)
// pub struct EndpointBuffer(&'static mut [VolatileCell<UsbAccessType>]);


    // This is not how it works seemingly...
    // hprintln!("rebooting").unwrap();
    // reg_write_bits!(SYSCON, swr_reset, swr_reset, 0x5A00_0001);

    hprintln!("pre_wfi").unwrap();

    use hal::usbfs::bus::endpoint_list as epl;
    // let epl = hal::usbfs::bus::endpoint_list::raw_attach(None).unwrap();
    // let epl = hal::usbfs::bus::endpoint_list::attach(Some(0x2002_0000)).unwrap();
    // let mut buf = [0u8; epl::ENDPOINT_LIST_SIZE];
    // let buf_addr = &buf as *const _ as u32;
    // hprintln!("{:x}", buf_addr).unwrap();
    // buf[0] = !0;
    // hprintln!("buf[0] is at {:x}", &buf[0] as *const _ as u32).unwrap();

    // let epl = hal::usbfs::bus::endpoint_list::attach(&buf).unwrap();
    let epl = hal::usbfs::bus::endpoint_list::attach().unwrap();
    // drop(buf);
    // hprintln!("{:x}", &buf as *const _ as u32);
    // hprintln!("epl.addr() = {:x}", epl.addr()).unwrap();

    dbg!(read_endpoint!(epl, epl, SETUP, ADDROFF));
    modify_endpoint!(epl, epl, SETUP, ADDROFF: 0x123);
    dbg!(read_endpoint!(epl, epl, SETUP, ADDROFF));

    dbg!(read_endpoint!(epl, epl, EP0OUT, A));
    write_endpoint!(epl, epl, EP0OUT, A: Active);
    dbg!(read_endpoint!(epl, epl, EP0OUT, A));

    dbg!(read_endpoint!(epl, epl, EP0IN, ADDROFF));
    // modify_endpoint!(epl, epl, SETUP, ADDROFF: 0x1);
    write_endpoint!(epl, epl, EP0IN, ADDROFF: 0x1u32);
    dbg!(read_endpoint!(epl, epl, EP0IN, ADDROFF));

    dbg!(read_endpoint!(epl, epl, SETUP));

    use hal::{read_endpoint_i, write_endpoint_i, modify_endpoint_i};
    // dbg!(write_endpoint!(epl, epl, EP[3], 0));
    dbg!(read_endpoint_i!(epl, epl, 2, 1, 0));
    dbg!(read_endpoint_i!(epl, epl, 2, 1, 0, A == Active));
    dbg!(modify_endpoint_i!(epl, epl, 2, 1, 0, A: Active));
    dbg!(read_endpoint_i!(epl, epl, 2, 1, 0, A == Active));

    // hal::usbfs::bus::endpoint_list::detach(epl);

    hprintln!("wfi").unwrap();
    loop {
        asm::wfi();
    }
}
