#![no_main]
#![no_std]

///
/// Compare also with: https://github.com/Ko-/aes-armcortexm
///
extern crate panic_halt;
use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

#[entry]
fn main() -> ! {
    let dp = hal::raw::Peripherals::take().unwrap();
    let mut pmc = hal::pmc::wrap(dp.PMC);
    let mut syscon = hal::syscon::wrap(dp.SYSCON);

    dbg!(syscon.get_main_clk()); // in contrast to UM, this returns 0x3 (fro_hf)
    syscon.fro_12m_as_main_clk();
    dbg!(syscon.get_main_clk());
    syscon.fro_hf_as_main_clk();
    dbg!(syscon.get_main_clk());

    syscon.fro_hf_as_usbfs_clk();

    // Port mode configuration: Enable port mode configuration by setting the
    // USB0_HOSTS in the AHBCLKCTRL2 register. See Table 56. Set DEV_ENABLE in
    // Section 42.7.23 “PortMode register” in Port Mode register (offset 0x5C) to enable the
    // device controller on the USB0 port. Once configured, to save power, clear
    // USB0_HOSTS in the AHBCLKCTRL2 register, See Section 4.5.19 “AHB clock control 2”.

    // dbg!(syscon.is_enabled_usb0_hosts());
    // dbg!(syscon.enable_usb0_hosts());
    // dbg!(syscon.is_enabled_usb0_hosts());

    let usbfsh = hal::usbfsh::wrap(dp.USBFSH);
    dbg!(usbfsh.is_enabled(&pmc, &syscon)); // false
    let mut usbfsh = usbfsh.enabled(&mut pmc, &mut syscon);
    dbg!(usbfsh.is_enabled(&pmc, &syscon)); // true

    dbg!("this crashes everything. TODO: fix!");
    // dbg!(usbfsh.is_device_enabled());
    // dbg!(usbfsh.enable_device());
    // dbg!(usbfsh.is_device_enabled());

    let usbfs = hal::usbfs::wrap(dp.USB0);

    // dbg!(syscon.is_clock_enabled(&dp.USB0)); // false
    // syscon.enable_clock(&mut dp.USB0);
    // dbg!(syscon.is_clock_enabled(&dp.USB0)); // true

    // dbg!(pmc.is_powered(&dp.USB0)); // false
    // pmc.power_on(&mut dp.USB0);
    // dbg!(pmc.is_powered(&dp.USB0)); // true

    dbg!(usbfs.is_enabled(&pmc, &syscon)); // false
    let usbfs = usbfs.enabled(&mut pmc, &mut syscon);
    dbg!(usbfs.is_enabled(&pmc, &syscon)); // true

    // latch clock to USBFSD SOF packets
    // TODO: does this mess up when nothing's attached?
    // doesn't seem so...
    let mut anactrl = hal::anactrl::wrap(dp.ANACTRL);
    dbg!(anactrl.is_12mhzclk_enabled());
    dbg!(anactrl.is_48mhzclk_enabled());
    dbg!(anactrl.is_96mhzclk_enabled());
    anactrl.latch_fro_hf_to_usbfs();

    // UM says: (5, 1)  <-- probly swapped
    // We get: (1, 6)
    dbg!(usbfs.info());

    loop {
        asm::wfi();
    }
}
