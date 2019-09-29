use crate::{pmc, raw, states::init_state, syscon};

pub struct UsbFsDev<State = init_state::Enabled> {
    pub(crate) raw: raw::USB0,
    _state: State,
}

pub fn wrap(usbfsd: raw::USB0) -> UsbFsDev<init_state::Disabled> {
    UsbFsDev::new(usbfsd)
}

impl UsbFsDev<init_state::Disabled> {
    pub fn new(usbfsd: raw::USB0) -> Self {
        UsbFsDev {
            raw: usbfsd,
            _state: init_state::Disabled,
        }
    }
    /// Consumes disabled UsbFsDev, returns an enabled one
    pub fn enabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> UsbFsDev<init_state::Enabled> {
        pmc.power_on(&mut self.raw);
        syscon.reset(&mut self.raw);
        syscon.enable_clock(&mut self.raw);

        UsbFsDev {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }
}

impl UsbFsDev<init_state::Enabled> {
    /// Consumes enabled UsbFsDev, returns a disabled one
    pub fn disabled(
        mut self,
        pmc: &mut pmc::Pmc,
        syscon: &mut syscon::Syscon,
    ) -> UsbFsDev<init_state::Disabled> {
        pmc.power_off(&mut self.raw);
        syscon.disable_clock(&mut self.raw);

        UsbFsDev {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

impl<State> UsbFsDev<State> {
    /// Return the raw peripheral
    pub fn release(self) -> raw::USB0 {
        self.raw
    }

    pub fn is_enabled(&self, pmc: &pmc::Pmc, syscon: &syscon::Syscon) -> bool {
        syscon.is_clock_enabled(&self.raw) && pmc.is_powered(&self.raw)
    }

    pub fn is_powered(&self, pmc: &pmc::Pmc) -> bool {
        pmc.is_powered(&self.raw)
    }
}

#[derive(Debug)]
pub struct UsbFsDevInfo {
    maj_rev: u8,
    min_rev: u8,
    err_code: u8,
    frame_nr: u16,
}

impl UsbFsDev<init_state::Enabled> {
    pub fn info(&self) -> UsbFsDevInfo {
        // technically, e.g. maj/min rev need only the clock, and not the power enabled
        UsbFsDevInfo {
            maj_rev: self.raw.info.read().majrev().bits(),
            min_rev: self.raw.info.read().minrev().bits(),
            err_code: self.raw.info.read().err_code().bits(),
            frame_nr: self.raw.info.read().frame_nr().bits(),
        }
    }
}
