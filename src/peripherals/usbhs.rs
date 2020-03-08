use crate::raw;
use crate::peripherals::{
    anactrl,
    pmc,
    syscon,
};
use crate::typestates::{
    init_state,
    usbhs_mode,
    // ValidUsbClockToken,
    // Fro96MHzEnabledToken,
    ClocksSupportUsbfsToken,
};


// Main struct
pub struct Usbhs<State: init_state::InitState = init_state::Unknown, Mode: usbhs_mode::UsbhsMode = usbhs_mode::Unknown> {
    pub(crate) raw_hsd: raw::USBHSD,
    pub(crate) raw_hsh: raw::USBHSH,
    _state: State,
    _mode: Mode,
}

pub type EnabledUsbhsDevice = Usbhs<init_state::Enabled, usbhs_mode::Device>;
pub type EnabledUsbhsHost = Usbhs<init_state::Enabled, usbhs_mode::Host>;

impl Usbhs {
    pub fn new(raw_hsd: raw::USBHSD, raw_hsh: raw::USBHSH) -> Self {
        Usbhs {
            raw_hsd,
            raw_hsh,
            _state: init_state::Unknown,
            _mode: usbhs_mode::Unknown,
        }
    }
}

impl<State: init_state::InitState, Mode: usbhs_mode::UsbhsMode> Usbhs<State, Mode> {
    pub fn release(self) -> (raw::USBHSD, raw::USBHSH) {
        (self.raw_hsd, self.raw_hsh)
    }

    pub fn enabled_as_device(
        mut self,
        anactrl: &mut anactrl::Anactrl,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
        // lock_fro_to_sof: bool, // we always lock to SOF
        _clocks_token: ClocksSupportUsbfsToken,
    ) -> EnabledUsbhsDevice {

        // // Configure clock input: Fro96MHz divided by 2 = 48MHz
        // // TODO: disable this again in `self.disable`.
        // unsafe { syscon.raw.usb0clkdiv.modify(|_, w| w.div().bits(1)) };
        // syscon.raw.usb0clkdiv.modify(|_, w| w.halt().run());
        // syscon.raw.usb0clksel.modify(|_, w| w.sel().enum_0x3()); // Fro96MHz
        // while syscon.raw.usb0clkdiv.read().reqflag().is_ongoing() {}

        // // turn on USB0 PHY
        // pmc.power_on(&mut self.raw_fsd);

        // // reset and turn on clock
        // syscon.reset(&mut self.raw_fsd);
        // syscon.enable_clock(&mut self.raw_fsd);

        // // Switch USB0 to "device" mode (default is "host")
        // syscon.enable_clock(&mut self.raw_fsh);
        // // NB!!! This will crash your debugger soo bad if usb0clk is not setup !!!
        // self.raw_fsh.portmode.modify(|_, w| w.dev_enable().set_bit());
        // syscon.disable_clock(&mut self.raw_fsh);

        // // Turn on USB1 SRAM
        // // TODO: Maybe ask to pass in an enabled USB1 SRAM?
        // // Otherwise, do we turn this off in `disabled`?
        // // reg_modify!(crate, SYSCON, ahbclkctrl2, usb1_ram, enable);
        // syscon.raw.ahbclkctrl2.modify(|_, w| w.usb1_ram().enable());

        // // Lock Fro192MHz to USB SOF packets
        // // if lock_fro_to_sof {
        //     anactrl.raw.fro192m_ctrl.modify(|_, w| w.usbclkadj().set_bit());
        //     while anactrl.raw.fro192m_ctrl.read().usbmodchg().bit_is_set() {}
        // // }


        Usbhs {
            raw_hsd: self.raw_hsd,
            raw_hsh: self.raw_hsh,
            _state: init_state::Enabled(()),
            _mode: usbhs_mode::Device,
        }
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
        pmc.power_off(&mut self.raw_hsd);
        syscon.disable_clock(&mut self.raw_hsd);

        Usbhs {
            raw_hsd: self.raw_hsd,
            raw_hsh: self.raw_hsh,
            _state: init_state::Disabled,
            _mode: usbhs_mode::Device,
        }
    }
}

impl From<(raw::USBHSD, raw::USBHSH)> for Usbhs {
    fn from(raw: (raw::USBHSD, raw::USBHSH)) -> Self {
        Usbhs::new(raw.0, raw.1)
    }
}
