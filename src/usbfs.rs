use crate::{pmc, raw, states::init_state, syscon};

pub struct UsbFs<State = init_state::Enabled> {
    pub(crate) raw: raw::USB0,
    _state: State,
}

pub fn wrap(usbfs: raw::USB0) -> UsbFs<init_state::Disabled> {
    UsbFs::new(usbfs)
}

impl UsbFs<init_state::Disabled> {
    pub fn new(usbfs: raw::USB0) -> Self {
        UsbFs {
            raw: usbfs,
            _state: init_state::Disabled,
        }
    }
    /// Consumes disabled UsbFs, returns an enabled one
    pub fn enabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> UsbFs<init_state::Enabled> {
        syscon.enable_clock(&mut self.raw);
        pmc.power_on(&mut self.raw);

        UsbFs {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }
}

impl UsbFs<init_state::Enabled> {
    /// Consumes enabled UsbFs, returns a disabled one
    pub fn disabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> UsbFs<init_state::Disabled> {
        pmc.power_off(&mut self.raw);
        syscon.disable_clock(&mut self.raw);

        UsbFs {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

impl<State> UsbFs<State> {
    /// Return the raw peripheral
    pub fn release(self) -> raw::USB0 {
        self.raw
    }

    pub fn is_enabled(&self, pmc: &pmc::Pmc, syscon: &syscon::Syscon) -> bool {
        syscon.is_clock_enabled(&self.raw) && pmc.is_powered(&self.raw)
    }
}

#[derive(Debug)]
pub struct UsbFsInfo {
    maj_rev: u8,
    min_rev: u8,
    err_code: u8,
    frame_nr: u16,
}

impl UsbFs<init_state::Enabled> {
    pub fn info(&self) -> UsbFsInfo {
        // technically, e.g. maj/min rev need only the clock, and not the power enabled
        UsbFsInfo {
            maj_rev: self.raw.info.read().majrev().bits(),
            min_rev: self.raw.info.read().minrev().bits(),
            err_code: self.raw.info.read().err_code().bits(),
            frame_nr: self.raw.info.read().frame_nr().bits(),
        }
    }
}
