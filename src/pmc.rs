//! API for power management (PMC)
//!
//! The PMC peripheral is described in the user manual, chapter 13.
//!
//! We are mostly concerned with power to analog peripherals.
//!

use crate::raw;
use crate::wrap_peripheral;

// use crate::states::init_state;

// /// Entry point to the PMC API
// pub struct Pmc {
//     raw: raw::PMC,
// }

// pub fn wrap(pmc: raw::PMC) -> Pmc {
//     Pmc::new(pmc)
// }

// impl Pmc {
//     pub fn release(self) -> raw::PMC {
//         self.raw
//     }
// }

// impl Pmc {
//     pub fn new(pmc: raw::PMC) -> Self {
//         Pmc { raw: pmc }
//     }
// }

wrap_peripheral!(Pmc, PMC, pmc);

impl Pmc {
    /// Enables the power for a peripheral or other hardware component
    pub fn power_on<P: PowerControl>(&mut self, peripheral: &mut P) {
        peripheral.powered_on(self);
    }

    /// Disable the power
    pub fn power_off<P: PowerControl>(&mut self, peripheral: &mut P) {
        peripheral.powered_off(self);
    }

    /// Check if peripheral is powered
    pub fn is_powered<P: PowerControl>(&self, peripheral: &P) -> bool {
        peripheral.is_powered(&self)
    }
}

pub trait PowerControl {
    /// Internal method
    fn powered_on(&self, pmc: &mut Pmc);

    /// Internal method
    fn powered_off(&self, pmc: &mut Pmc);

    /// Internal method
    fn is_powered(&self, pmc: &Pmc) -> bool;
}

// impl ClockControl for raw::UTICK {
//     fn enable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
//         h.ahbclkctrl1.modify(|_, w| w.utick0().enable());
//         h
//     }

//     fn disable_clock<'h>(&self, h: &'h mut Handle) -> &'h mut Handle {
//         h.ahbclkctrl1.modify(|_, w| w.utick0().disable());
//         h
//     }

//     fn is_clock_enabled(&self, h: &Handle) -> bool {
//         h.ahbclkctrl1.read().utick0().is_enable()
//     }
// }

// impl PowerControl for raw::USB0 {
//     fn powered_on(&self, pmc: &mut Pmc) {
//         // Enable the power to the USB0 PHY by clearing the bit PDEN_USBFSPHY in the PDRUNCFG0 register
//         pmc.raw
//             .pdruncfg0
//             .modify(|_, w| w.pden_usbfsphy().poweredon());
//     }

//     /// Internal method
//     fn powered_off(&self, pmc: &mut Pmc) {
//         pmc.raw
//             .pdruncfg0
//             .modify(|_, w| w.pden_usbfsphy().poweredoff());
//     }

//     /// Internal method
//     fn is_powered(&self, pmc: &Pmc) -> bool {
//         pmc.raw.pdruncfg0.read().pden_usbfsphy().is_poweredon()
//     }
// }

macro_rules! impl_power_control {
    ($power_control:ty, $register:ident) => {
        impl PowerControl for $power_control {
            fn powered_on(&self, pmc: &mut Pmc) {
                pmc.raw.pdruncfg0.modify(|_, w| w.$register().poweredon());
            }

            fn powered_off(&self, pmc: &mut Pmc) {
                pmc.raw.pdruncfg0.modify(|_, w| w.$register().poweredoff());
            }

            fn is_powered(&self, pmc: &Pmc) -> bool {
                pmc.raw.pdruncfg0.read().$register().is_poweredon()
            }
        }
    };
}

// well maybe there needs to be a USBFS peripheral with power control,
// and on top of that USBFSD, USBFSHM, USBFSHS... to make this all logical.
impl_power_control!(raw::USB0, pden_usbfsphy);
impl_power_control!(raw::USBFSH, pden_usbfsphy);
