use core::ops::Deref;
use crate::raw;
use crate::traits::wg::timer::CountDown;
use crate::drivers::timer;
use crate::peripherals::{
    anactrl,
    pmc,
    syscon,
    ctimer,
};
use crate::typestates::{
    init_state,
    usbhs_mode,
    // ValidUsbClockToken,
    // Fro96MHzEnabledToken,
    ClocksSupportUsbfsToken,
};
use cortex_m_semihosting::{dbg, heprintln};
use crate::traits::usb::{
    Usb,
    UsbSpeed,
};

use crate::time::*;

// Main struct
pub struct Usbhs<State: init_state::InitState = init_state::Unknown, Mode: usbhs_mode::UsbhsMode = usbhs_mode::Unknown> {
    pub(crate) raw_phy: raw::USBPHY,
    pub(crate) raw_hsd: raw::USB1,
    pub(crate) raw_hsh: raw::USBHSH,
    _state: State,
    _mode: Mode,
}

pub type EnabledUsbhsDevice = Usbhs<init_state::Enabled, usbhs_mode::Device>;
pub type EnabledUsbhsHost = Usbhs<init_state::Enabled, usbhs_mode::Host>;

impl Deref for EnabledUsbhsDevice {
    type Target = raw::usb1::RegisterBlock;
    fn deref(&self) -> &Self::Target {
        &self.raw_hsd
    }
}

unsafe impl Sync for EnabledUsbhsDevice {}
impl Usb<init_state::Enabled> for EnabledUsbhsDevice {
    fn get_speed(&self) -> UsbSpeed { 
        if self.raw_hsd.devcmdstat.read().speed().bits() == 0b10 {
            UsbSpeed::HighSpeed
        } else {
            UsbSpeed::FullSpeed
        }
    }
}

impl Usbhs {
    pub fn new(raw_phy: raw::USBPHY, raw_hsd: raw::USB1, raw_hsh: raw::USBHSH) -> Self {
        Usbhs {
            raw_phy,
            raw_hsd,
            raw_hsh,
            _state: init_state::Unknown,
            _mode: usbhs_mode::Unknown,
        }
    }
}

impl<State: init_state::InitState, Mode: usbhs_mode::UsbhsMode> Usbhs<State, Mode> {
    pub fn release(self) -> (raw::USB1, raw::USBHSH) {
        (self.raw_hsd, self.raw_hsh)
    }

    pub fn dump(
        &mut self,
        anactrl: &mut anactrl::Anactrl,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
        msg: &str,
    ){
        let usb1_devcmd : u32 = self.raw_hsd.devcmdstat.read().bits();
        let usb1_info: u32 = self.raw_hsd.info.read().bits();
        let usb1_eplist: u32 = self.raw_hsd.epliststart.read().bits();
        let usb1_databufstart: u32 = self.raw_hsd.databufstart.read().bits();

        let usbhsh_port: u32 = self.raw_hsh.portmode.read().bits();
        let usbphy_ctrl: u32 = self.raw_phy.ctrl.read().bits();
        let usbphy_sic: u32 = self.raw_phy.pll_sic.read().bits();
        let usbphy_pwd: u32 = self.raw_phy.pwd.read().bits();
        let usbphy_ana: u32 = self.raw_phy.anactrl.read().bits();
        let usbphy_stat: u32 = self.raw_phy.status.read().bits();
        let syscon_ahb2: u32 = syscon.raw.ahbclkctrl2.read().bits();
        let syscon_ahb1: u32 = syscon.raw.ahbclkctrl1.read().bits();
        let syscon_ahb0: u32 = syscon.raw.ahbclkctrl0.read().bits();
        let syscon_sela : u32 = syscon.raw.mainclksela.read().bits();
        let syscon_selb : u32 = syscon.raw.mainclkselb.read().bits();
        let syscon_fmccr : u32 = syscon.raw.fmccr.read().bits();
        let syscon_preset2: u32 = syscon.raw.presetctrl2.read().bits();
        let syscon_clk_ctrl: u32 = syscon.raw.clock_ctrl.read().bits();
        let anactrl_xo32m: u32 = anactrl.raw.xo32m_ctrl.read().bits();
        let anactrl_fro192: u32 = anactrl.raw.fro192m_ctrl.read().bits();
        let pmc_cfg0: u32 = pmc.raw.pdruncfg0.read().bits();

        // heprintln!("{}",msg).ok();

        // heprintln!("").ok();
        // heprintln!("pmc-cfg0: {:08x}", pmc_cfg0).ok();
        // heprintln!("syscon-ahb2: {:08x}", syscon_ahb2).ok();
        // heprintln!("syscon-ahb1: {:08x}", syscon_ahb1).ok();
        // heprintln!("syscon-ahb0: {:08x}", syscon_ahb0).ok();
        // heprintln!("syscon-sela: {:08x}", syscon_sela).ok();
        // heprintln!("syscon-selb: {:08x}", syscon_selb).ok();
        // heprintln!("syscon-fmccr: {:08x}", syscon_fmccr).ok();
        // heprintln!("syscon-preset2: {:08x}", syscon_preset2).ok();
        // heprintln!("syscon-clk-ctrl: {:08x}", syscon_clk_ctrl).ok();
        // heprintln!("anactrl-xo32m: {:08x}", anactrl_xo32m).ok();
        // heprintln!("anactrl-fro192: {:08x}", anactrl_fro192).ok();
        // heprintln!("usbhsh-port: {:08x}", usbhsh_port).ok();
        // heprintln!("usbphy-ctrl: {:08x}", usbphy_ctrl).ok();
        // heprintln!("usbphy-sic: {:08x}", usbphy_sic).ok();
        // heprintln!("usbphy-pwd: {:08x}", usbphy_pwd).ok();
        // heprintln!("usbphy-ana: {:08x}", usbphy_ana).ok();
        // heprintln!("usbphy-stat: {:08x}", usbphy_stat).ok();

        // heprintln!("usb1-devcmd: {:08x}", usb1_devcmd).ok();
        // heprintln!("usb1-info: {:08x}", usb1_info).ok();
        // heprintln!("usb1-eplist: {:08x}", usb1_eplist).ok();
        // heprintln!("usb1-databufstart: {:08x}", usb1_databufstart).ok();

        // heprintln!("").ok();
    }

    pub fn enabled_as_device(
        mut self,
        anactrl: &mut anactrl::Anactrl,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
        timer: &mut timer::Timer<impl ctimer::Ctimer<init_state::Enabled>>,
        // lock_fro_to_sof: bool, // we always lock to SOF
        _clocks_token: ClocksSupportUsbfsToken,
    ) -> EnabledUsbhsDevice {

        // syscon.raw.clock_ctrl.write(|w| 
        //     unsafe{
        //         w.bits(0x81)
        //     });

        // pmc.raw.pdruncfg0.modify(|_,w| w.pden_usbfsphy().poweredoff());
        // pmc.raw.pdruncfg0.modify(|_,w| w.pden_pll0().poweredoff());

        // Reset device
        // - Toggle both USB1_DEV_RST and USB1_RAM_RST in PRESETCTRL2
        syscon.reset(&mut self.raw_hsh);
        syscon.reset(&mut self.raw_hsd);
        syscon.reset(&mut self.raw_phy);

        // self.dump(anactrl, pmc, syscon, "after reset");

        // Enable device control of USB1 port
        // - set USB1_HOST in AHBCLKCTRL2 to allow port mode register access
        syscon.raw.ahbclkctrl2.modify(|_,w| w.usb1_host().set_bit());
        // - Set DEV_ENABLE in port mode register 
        // self.raw_hsh.portmode.write(|w| unsafe{
            // w.bits( 1<<19 )
        // });
        self.raw_hsh.portmode.modify(|r,w| unsafe{
            w.bits( (1<<16) | r.bits())
            // w.dev_enable().set_bit()
            // Should also change SW_CTRL_PDCOM?
        });
        // – To save power, clear USB1_HOST in SYSAHBCLKCTRL2.
        // syscon.raw.ahbclkctrl2.modify(|_,w| w.usb1_host().clear_bit());


        // self.dump(anactrl, pmc, syscon, "at init");

        // Turn on all of the things.
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_xtal32m().poweredon());
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_ldoxo32m().poweredon());
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_fro32k().poweredon());
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_xtal32k().poweredon());
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_usbhsphy().poweredon());
        pmc.raw.pdruncfg0.modify(|_,w| w.pden_ldousbhs().poweredon());

        // heprintln!("bigdelay").ok();
        // for _ in 0 .. 100000 {
        //     syscon.raw.ahbclkctrl2.read().bits();
        // }
        timer.start(50.ms());
        nb::block!(timer.wait()).ok();

        syscon.raw.ahbclkctrlset[2].write(|w| 
            unsafe{ w.bits( 1<<27 ) });      // because SDK does it
        syscon.raw.ahbclkctrlset[2].write(|w| 
            unsafe{
                w.bits(1<<7)
            }
        );

        ///// PHY

        // - set ENABLE_USB_HS_CLK_OUT bit in  XO32M_CTRL reg.
        // anactrl.raw.xo32m_ctrl.modify(|_,w| w.enable_pll_usb_out().enable() );
        // anactrl.raw.xo32m_ctrl.modify(|_,w| w.enable_system_clk_out().enable() );


        // Add delay to wait for PHY to power up.
        // for _ in 0 .. 100000 {
            // syscon.raw.clock_ctrl.read().bits();
        // }

        // - Set USB1_PHY in AHBCLKCTRL2 to enable register access

        // Interrupt:
        // - USB1_PHY
        // ?

        // Initial config of PHY control registers
        // -
        self.raw_phy.ctrl_clr.write(|w| unsafe{ 
            w.bits(1 << 31 /* SFTRST */ )
        });

        self.raw_phy.pll_sic.modify(|_,w| 
            w.pll_div_sel().bits(6) /* 16MHz = xtal32m */ 
        );

        self.raw_phy.pll_sic_set.write(|w| unsafe { 
            w.bits(1 << 21 /* pll-reg-enable */)
        });

        self.raw_phy.pll_sic_clr.write(|w| unsafe {    // clearing
            w.bits(1 << 16 /* mystery bit */) // must be done, according to SDK.
        });

        timer.start(20.us());
        nb::block!(timer.wait()).ok();

        self.raw_phy.pll_sic_set.write(|w| unsafe { 
            w.bits(1 << 12 /* pll_power */)
        });

        self.raw_phy.pll_sic_set.write(|w| unsafe { 
            w.bits(1 << 6 /* pll_en_usb */)
        });
        self.raw_phy.ctrl_clr.write(|w| unsafe{ 
            w.bits(1 << 30 /* CLKGATE */ )
        });
        self.raw_phy.pwd.write(|w| unsafe { w.bits(0) } );


        // heprintln!("bigdelay2").ok();
        // heprintln!("reset reg: {:08x}", syscon.raw.presetctrl2.read().bits()).ok();
        // heprintln!("clk div reg: {:08x}", syscon.raw.ahbclkdiv.read().bits()).ok();
        // heprintln!("frohf div reg: {:08x}", syscon.raw.frohfdiv.read().bits()).ok();


        // self.dump(anactrl, pmc, syscon, "after phy enable 1");
        // self.dump(anactrl, pmc, syscon, "after phy enable 2");

        //////// USB DEV /////////
        ///// CONTROLLER
        // turn on USB1 controller

        // Set USB1_DEV and USB1_RAM bits in AHBCLKCTRL2 to enable USB device operation
        syscon.raw.ahbclkctrlset[2].write(|w| unsafe{
            w.bits(1<<6)
        });
        syscon.raw.ahbclkctrlset[2].write(|w| unsafe{
            w.bits(1<<5)
        });


        // syscon.raw.clock_ctrl.modify(|_,w| w.clkin_ena().set_bit() );
        anactrl.raw.xo32m_ctrl.modify(|_,w| w.enable_pll_usb_out().set_bit() );

        //////// END USB DEV /////////

        self.dump(anactrl, pmc, syscon, "after dev enable 1");
        self.dump(anactrl, pmc, syscon, "after dev enable 2");

        ////////////// EHCI /////////////
        let usbram: &mut [u8; 0x4000] = unsafe { core::mem::transmute(0x40100000u32) };
        for i in 0 .. 0x4000 {
            usbram[i] = 0;
        }

        // let syscon_regs: &mut [u32; 0x4000] = unsafe { core::mem::transmute( 0x40000000u32 ) };

        // dbg!(syscon.raw.ctimerclksel4().read().bits());
        // syscon_regs[0x27C/4] = 5;
        // dbg!(syscon.raw.ctimerclksel4().read().bits());
        // syscon_regs[0x27C/4] = 2;
        // dbg!(syscon.raw.ctimerclksel4().read().bits());

        // self.raw_phy.ctrl.modify(|_, w| { 
        //     w.enutmilevel2().set_bit()
        // });
        // self.raw_phy.ctrl.modify(|_, w| { 
        //     w.enutmilevel3().set_bit()
        // });

        self.raw_phy.pwd.write(|w| unsafe{ w.bits(0) });

        self.raw_phy.ctrl_set.write(|w| unsafe { 
            // w.enautoclr_clkgate().set_bit()
            w.bits( 0x80000 /* enautoclr_clkgate */)
        });
        // dbg!(self.raw_phy.ctrl.read().sftrst().bit_is_set());
        // dbg!(self.raw_phy.ctrl.read().sftrst().bit_is_set());
        self.raw_phy.ctrl_set.write(|w| unsafe { 
            // w.enautoclr_phy_pwd().set_bit()
            w.bits( 0x100000 /* enautoclr_phy_pwd */)
        });
        //////////// END EHCI //////////

        // just to clear that memory
        // crate::drivers::usbd::endpoint_registers::new(crate::drivers::usbd::constants::EP_MEM_ADDR as u32);
        // heprintln!("pll-sic@pwd_set: {:08x}", self.raw_phy.pll_sic.read().bits()).ok();


        // Configure USB1 PINs
        // - (USB1 has fixed VBUS pin)

        // Ensure CPU clock is >= 60MHz
        // -  (token)



        Usbhs {
            raw_phy: self.raw_phy,
            raw_hsd: self.raw_hsd,
            raw_hsh: self.raw_hsh,
            _state: init_state::Enabled(()),
            _mode: usbhs_mode::Device,
        }
    }

    pub fn borrow<F: Fn(&mut Self) -> () >(&mut self, func: F) {
        func(self);
    }

}

#[derive(Debug)]
pub struct UsbHsDevInfo {
    maj_rev: u8,
    min_rev: u8,
    err_code: u8,
    frame_nr: u16,
}

impl EnabledUsbhsDevice {
    pub fn info(&self) -> UsbHsDevInfo {
        // technically, e.g. maj/min rev need only the clock, and not the power enabled
        UsbHsDevInfo {
            maj_rev: self.raw_hsd.info.read().majrev().bits(),
            min_rev: self.raw_hsd.info.read().minrev().bits(),
            err_code: self.raw_hsd.info.read().err_code().bits(),
            frame_nr: self.raw_hsd.info.read().frame_nr().bits(),
        }
    }
}

impl<State: init_state::InitState> Usbhs<State, usbhs_mode::Device> {
    /// Disables the USB FS peripheral, assumed in device mode
    pub fn disabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> Usbhs<init_state::Disabled, usbhs_mode::Device> {
        // pmc.power_off(&mut self.raw_hsd);
        syscon.disable_clock(&mut self.raw_hsd);

        Usbhs {
            raw_phy: self.raw_phy,
            raw_hsd: self.raw_hsd,
            raw_hsh: self.raw_hsh,
            _state: init_state::Disabled,
            _mode: usbhs_mode::Device,
        }
    }
}

impl From<(raw::USBPHY, raw::USB1, raw::USBHSH)> for Usbhs {
    fn from(raw: (raw::USBPHY, raw::USB1, raw::USBHSH)) -> Self {
        Usbhs::new(raw.0, raw.1, raw.2)
    }
}
