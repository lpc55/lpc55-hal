use crate::{
    raw,
    states::init_state,
    peripherals::syscon,
};

// No need for this marker trait, currently
// pub trait Flexcomm {}

macro_rules! flexcomm_enable_disable {
    ($hal_name:ident, $register_sel:ident) => {
        impl $hal_name {
            /// Consumes disabled $hal_name, returns an enabled one
            pub fn enabled(mut self, syscon: &mut syscon::Syscon) -> $hal_name<init_state::Enabled> {

                // The FRG output frequency must not be higher than 48 MHz for SPI and I2S
                // and not higher than 44 MHz for USART and I2C.
                //
                // Currently, we just use the 12MHz clock

                syscon.raw.$register_sel().modify(|_, w| w.sel().enum_0x2()); // Fro12MHz
                syscon.reset(&mut self.raw);
                syscon.enable_clock(&mut self.raw);

                $hal_name {
                    raw: self.raw,
                    _state: init_state::Enabled(()),
                }
            }

            /// Consumes disabled $hal_name, returns an enabled one
            pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> $hal_name<init_state::Disabled> {
                syscon.disable_clock(&mut self.raw);

                $hal_name {
                    raw: self.raw,
                    _state: init_state::Disabled,
                }
            }
        }
    }
}

crate::wrap_stateful_peripheral!(Flexcomm0, FLEXCOMM0);
flexcomm_enable_disable!(Flexcomm0, fcclksel0);
// impl Flexcomm for Flexcomm0 {}

crate::wrap_stateful_peripheral!(Flexcomm1, FLEXCOMM1);
flexcomm_enable_disable!(Flexcomm1, fcclksel1);
// impl Flexcomm for Flexcomm1 {}

crate::wrap_stateful_peripheral!(Flexcomm2, FLEXCOMM2);
flexcomm_enable_disable!(Flexcomm2, fcclksel2);
// impl Flexcomm for Flexcomm2 {}

crate::wrap_stateful_peripheral!(Flexcomm3, FLEXCOMM3);
flexcomm_enable_disable!(Flexcomm3, fcclksel3);
// impl Flexcomm for Flexcomm3 {}

crate::wrap_stateful_peripheral!(Flexcomm4, FLEXCOMM4);
flexcomm_enable_disable!(Flexcomm4, fcclksel4);
// impl Flexcomm for Flexcomm4 {}

crate::wrap_stateful_peripheral!(Flexcomm5, FLEXCOMM5);
flexcomm_enable_disable!(Flexcomm5, fcclksel5);
// impl Flexcomm for Flexcomm5 {}

crate::wrap_stateful_peripheral!(Flexcomm6, FLEXCOMM6);
flexcomm_enable_disable!(Flexcomm6, fcclksel6);
// impl Flexcomm for Flexcomm6 {}

crate::wrap_stateful_peripheral!(Flexcomm7, FLEXCOMM7);
flexcomm_enable_disable!(Flexcomm7, fcclksel7);
// impl Flexcomm for Flexcomm7 {}

