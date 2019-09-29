use crate::{pmc, raw, states::init_state, syscon, wrap_peripheral_with_state};

wrap_peripheral_with_state!(UsbFsHost, USBFSH, usbfsh);

impl UsbFsHost<init_state::Disabled> {
    pub fn enabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> UsbFsHost<init_state::Enabled> {
        pmc.power_on(&mut self.raw);
        syscon.reset(&mut self.raw);
        // syscon.enable_clock(&mut self.raw);

        UsbFsHost {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }
}

impl UsbFsHost<init_state::Enabled> {
    pub fn enable_device(&mut self) {
        self.raw.portmode.modify(|_, w| w.dev_enable().set_bit());
    }
    pub fn enable_host(&mut self) {
        self.raw.portmode.modify(|_, w| w.dev_enable().clear_bit());
    }
}
impl<State> UsbFsHost<State> {
    pub fn is_enabled(&self, pmc: &pmc::Pmc, syscon: &syscon::Syscon) -> bool {
        syscon.is_clock_enabled(&self.raw) && pmc.is_powered(&self.raw)
    }
    pub fn is_device_enabled(&mut self) -> bool {
        self.raw.portmode.read().dev_enable().bit()
    }
}
