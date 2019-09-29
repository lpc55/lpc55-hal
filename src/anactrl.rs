use crate::{
    // pmc,
    raw,
    // states::init_state,
    // syscon,
    wrap_peripheral,
    // wrap_peripheral_with_state,
};

// UM says:
// NOTE: The clock to analog controller module is enabled during boot time
// by the boot loader and it should always stay enabled
// wrap_peripheral_with_state!(UsbFsHost, USBFSH, usbfsh);
wrap_peripheral!(AnaCtrl, ANACTRL, anactrl);

// impl UsbFsHost<init_state::Disabled> {
//     pub fn enabled(
//         mut self,
//         pmc: &mut pmc::Pmc,
//         syscon: &mut syscon::Syscon,
//     ) -> UsbFsHost<init_state::Enabled> {
//         syscon.enable_clock(&mut self.raw);
//         pmc.power_on(&mut self.raw);

//         UsbFsHost {
//             raw: self.raw,
//             _state: init_state::Enabled(()),
//         }
//     }
// }

// impl UsbFsHost<init_state::Enabled> {
//     pub fn enable_device(&mut self) {
//         self.raw.portmode.modify(|_, w| w.dev_enable().set_bit());
//     }
//     pub fn enable_host(&mut self) {
//         self.raw.portmode.modify(|_, w| w.dev_enable().clear_bit());
//     }

// }
// impl<State> UsbFsHost<State> {
//     pub fn is_enabled(&self, pmc: &pmc::Pmc, syscon: &syscon::Syscon) -> bool {
//         syscon.is_clock_enabled(&self.raw) && pmc.is_powered(&self.raw)
//     }
// }

impl AnaCtrl {
    pub fn latch_fro_hf_to_usbfs(&mut self) {
        // "If this bit is set and the USB peripheral is enabled into full-speed
        // device mode, the USB block will provide FRO clock adjustments to
        // lock it to the host clock using the SOF packets."
        self.raw.fro192m_ctrl.modify(|_, w| w.usbclkadj().set_bit());
        // TODO: do we need any stabilisation? e.g.
        // "USBMODCHG If it reads as 1 when reading the DAC_TRIM field and
        // USBCLKADJ=1, it should be re-read until it is 0."
        // <-- this is mentioned in the UM, but missing in the PAC.
    }

    pub fn is_12mhzclk_enabled(&self) -> bool {
        self.raw.fro192m_ctrl.read().ena_12mhzclk().is_enable()
    }

    /// Supposedly, this is needed for Flash, hence enabled by default
    pub fn is_48mhzclk_enabled(&self) -> bool {
        self.raw.fro192m_ctrl.read().ena_48mhzclk().is_enable()
    }

    /// UM says not enabled by default, empiricially seems it is
    pub fn is_96mhzclk_enabled(&self) -> bool {
        self.raw.fro192m_ctrl.read().ena_96mhzclk().is_enable()
    }

    pub fn enable_96mhzclk(&self) {
        self.raw.fro192m_ctrl.modify(|_, w| w.ena_96mhzclk().enable());
    }
}
