#![no_main]
#![no_std]

extern crate panic_halt;
use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::{dbg, hprintln};

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

// use core::ptr;

// macro_rules! reg_write {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()).$register.write(|w| w.$field().bits($value)) }
//     };
// }
// macro_rules! reg_modify {
//     ($peripheral:ident, $register:ident, $field:ident, $what:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.modify(|_, w| w.$field().$what())
//     };
// }
// macro_rules! reg_modify_bits {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()).$register.modify(|_, w| w.$field().bits($value)) }
//     };
// }
// macro_rules! reg_read {
//     ($peripheral:ident, $register:ident, $field:ident, $what:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().$what()
//     };
// }
// macro_rules! reg_read_bits {
//     ($peripheral:ident, $register:ident, $field:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bits()
//     };
// }
// macro_rules! reg_read_bit {
//     ($peripheral:ident, $register:ident, $field:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bit()
//     };
// }
// macro_rules! dbg_reg_modify {
//     ($peripheral:ident, $register:ident, $field:ident, $what:ident, $is_what:ident) => {
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//         reg_modify!($peripheral, $register, $field, $what);
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//     };
// }
// macro_rules! dbg_reg_modify_bits {
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

#[entry]
fn main() -> ! {
    // let dp = hal::raw::Peripherals::take().unwrap();
    // let mut pmc = hal::pmc::wrap(dp.PMC);
    // let mut syscon = hal::syscon::wrap(dp.SYSCON);
    // let mut iocon = hal::iocon::wrap(dp.IOCON).enabled(&mut syscon);
    // let mut iocon = hal::iocon::wrap(dp.IOCON);
    // let iocon = hal::iocon::wrap(dp.IOCON);

    // // BOARD_InitPins
    // iocon.configure_pio_0_22_as_usb0_vbus();


    // reg_modify!(SYSCON, mainclksela, sel, enum_0x0); // FRO 12 MHz, was enum_0x3
    // reg_modify_bits!(SYSCON, fmccr, fmctim, 8); // without this, the setting MAINCLKSELA to 0x3 fails
    // reg_modify_bits!(SYSCON, ahbclkdiv, div, 0u8);
    // reg_modify_bits!(SYSCON, mainclksela, sel, 3); // FRO 96 MHz

    // reg_modify!(PMC, pdruncfg0, pden_usbfsphy, poweredon);
    // // reg_modify_bits!(SYSCON, usb0clkdiv, div, 0u8);
    // reg_write!(SYSCON, usb0clkdiv, div, 0u8);
    // reg_modify_bits!(SYSCON, usb0clksel, sel, 3); // FRO 96 MHz

    // reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, enable);
    // dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));
    // reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, disable);


    unsafe {
        // SYSCON->MAINCLKSELA = 0x0;
        // *((uint32_t *)(0x50000000U + 0x280)) = 0;
        // core::ptr::write_volatile((0x5000_0000u32 + 0x280) as *mut u32, 0);
        reg_modify!(SYSCON, mainclksela, sel, enum_0x0); // FRO 12 MHz, was enum_0x3

        // SYSCON->FMCCR = (SYSCON->FMCCR & ~(0x1F << 12)) | (8u << 12);
        // *((uint32_t *)(0x50000000U + 0x400)) = (
        //     (*((uint32_t *)(0x50000000U + 0x400))) & ~(0x1F << 12)) | (8u << 12);
        // core::ptr::write_volatile(
        //     (0x50000000u32 + 0x400) as *mut u32,
        //     (core::ptr::read_volatile((0x50000000u32 + 0x400) as *const u32) & !(0x1fu32 << 12)) |
        //     (8u32 << 12)
        // );
        reg_modify_bits!(SYSCON, fmccr, fmctim, 8); // without this, the setting MAINCLKSELA to 0x3 fails
        // SYSCON->AHBCLKDIV = 0;
        // *((uint32_t *)(0x50000000U + 0x380)) = 0;
        // core::ptr::write_volatile((0x5000_0000u32 + 0x380) as *mut u32, 0);
        reg_modify_bits!(SYSCON, ahbclkdiv, div, 0u8);
        // SYSCON->MAINCLKSELA = 0x3;
        // *((uint32_t *)(0x50000000U + 0x280)) = 3;
        // core::ptr::write_volatile((0x5000_0000u32 + 0x280) as *mut u32, 3);
        reg_modify_bits!(SYSCON, mainclksela, sel, 3); // FRO 96 MHz


        // PMC->PDRUNCFG0 &= ~(1u << 11);
        // *((uint32_t *)(0x50020000U + 0xB8)) &= ~(1u << 11);
        // core::ptr::write_volatile(
        //     (0x50020000u32 + 0xB8) as *mut u32,
        //     core::ptr::read_volatile((0x50020000u32 + 0xB8) as *const u32) & !(1u32 << 11)
        // );
        reg_modify!(PMC, pdruncfg0, pden_usbfsphy, poweredon);
        // SYSCON->USB0CLKDIV = 0;
        // *((uint32_t *)(0x50000000U + 0x398)) = 0;
        hprintln!("{:x}", reg_read_bits!(SYSCON, usb0clkdiv, div)).unwrap();
        hprintln!("{:?}", reg_read_bit!(SYSCON, usb0clkdiv, halt)).unwrap();
        hprintln!("{:x}", core::ptr::read_volatile((0x5000_0000u32 + 0x398) as *const u32)).unwrap();
        // core::ptr::write_volatile((0x5000_0000u32 + 0x398) as *mut u32, 0); // <=== HERE IT IS GOD DAMN MOTHERFUKC
        reg_write!(SYSCON, usb0clkdiv, div, 0u8);
        reg_modify!(SYSCON, usb0clkdiv, halt, run);
        hprintln!("{:x}", reg_read_bits!(SYSCON, usb0clkdiv, div)).unwrap();
        hprintln!("{:?}", reg_read_bit!(SYSCON, usb0clkdiv, halt)).unwrap();
        hprintln!("{:x}", core::ptr::read_volatile((0x5000_0000u32 + 0x398) as *const u32)).unwrap();
        // SYSCON->USB0CLKSEL = 3;
        // *((uint32_t *)(0x50000000U + 0x2A8)) = 3;
        // core::ptr::write_volatile((0x5000_0000u32 + 0x2A8) as *mut u32, 3);
        reg_modify_bits!(SYSCON, usb0clksel, sel, 3); // FRO 96 MHz

        // SYSCON->AHBCLKCTRL.AHBCLKCTRL2 |= (1u << 17);
        // *((uint32_t *)(0x50000000U + 0x208)) |= (1u << 17);
        // core::ptr::write_volatile(
        //     (0x50000000u32 + 0x208) as *mut u32,
        //     core::ptr::read_volatile((0x50000000u32 + 0x208) as *const u32) | (1u32 << 17)
        // );
        reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, enable);
        dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));
        // *((uint32_t *)(USBFSH_BASE + 0x5C)) |= (1u << 16);
        // *((uint32_t *)(0x500A2000U + 0x5C)) |= (1u << 16);  // 0x4... would be NS
        // core::ptr::write_volatile(
        //     (0x500A2000u32 + 0x5C) as *mut u32,
        //     core::ptr::read_volatile((0x500A2000u32 + 0x5C) as *const u32) | (1u32 << 16)
        // );
        reg_modify!(USBFSH, portmode, dev_enable, set_bit);
        // SYSCON->AHBCLKCTRL.AHBCLKCTRL2 &= ~(1u << 17);
        // *((uint32_t *)(0x50000000U + 0x208)) &= ~(1u << 17);
        // core::ptr::write_volatile(
        //     (0x50000000u32 + 0x208) as *mut u32,
        //     core::ptr::read_volatile((0x50000000u32 + 0x208) as *const u32) & !(1u32 << 17)
        // );
    }

    dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));
    hprintln!("wfi").unwrap();
    loop {
        asm::wfi();
    }
}

    // dbg_reg_modify!(SYSCON, mainclksela, sel, enum_0x0, is_enum_0x0); // FRO 12 MHz, was enum_0x3
    // dbg_reg_modify_bits!(SYSCON, fmccr, fmctim, 8); // without this, the setting MAINCLKSELA to 0x3 fails
    // dbg_reg_modify_bits!(SYSCON, ahbclkdiv, div, 0u8);
    // dbg_reg_modify_bits!(SYSCON, mainclksela, sel, 3); // FRO 96 MHz

    // dbg_reg_modify!(PMC, pdruncfg0, pden_usbfsphy, poweredon, is_poweredon);
    // dbg_reg_modify_bits!(SYSCON, usb0clkdiv, div, 0u8);
    // dbg_reg_modify_bits!(SYSCON, usb0clksel, sel, 3); // FRO 96 MHz

    // dbg_reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, enable, is_enable);

    // // enable the device controller on USB0
    // // hprintln!("{:x}", unsafe { ptr::read((0x400A_2000 + 0x5C) as *const u32) & (1u32 << 16) });
    // // dbg!(reg_read!(USBFSH, portmode, dev_enable, bit_is_set));
    // // reg_modify!(USBFSH, portmode, dev_enable, set_bit);
    // hprintln!("AAAHHHHHH").unwrap();
    // hprintln!("{:x}", unsafe { ptr::read((0x500A_2000 + 0x5C) as *const u32) } ).unwrap();

    // // disable port mode configuration
    // dbg_reg_modify!(SYSCON, ahbclkctrl2, usb0_hosts, disable, is_disable);
