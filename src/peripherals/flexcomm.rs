use crate::{
    raw,
    states::init_state,
    peripherals::syscon,
};

use crate::states::{
    pin_function,
    pin_state::Special,
};
use crate::drivers::pins::{
    Pin,
    PinId,
};

// No need for this marker trait, currently
// pub trait Flexcomm {}

macro_rules! flexcomm {
    ($fc_hal:ident, $i2c_hal:ident, $spi_hal:ident, $usart_hal:ident,
     $fc_pac:ident, $i2c_pac:ident, $spi_pac:ident, $usart_pac:ident,
     $register_sel:ident
    ) => {
        pub struct $fc_hal<State = init_state::Unknown> {
            pub(crate) raw_fc: raw::$fc_pac,
            pub(crate) raw_i2c: raw::$i2c_pac,
            pub(crate) raw_spi: raw::$spi_pac,
            pub(crate) raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $i2c_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$i2c_pac,
            pub(crate) _raw_spi: raw::$spi_pac,
            pub(crate) _raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $spi_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            pub(crate) _raw_i2c: raw::$i2c_pac,
            #[allow(dead_code)]
            pub(crate) spi: raw::$spi_pac,
            pub(crate) _raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $usart_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            pub(crate) _raw_i2c: raw::$i2c_pac,
            pub(crate) _raw_spi: raw::$spi_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$usart_pac,
            pub _state: State,
        }

        impl core::convert::From<(raw::$fc_pac, raw::$i2c_pac, raw::$spi_pac, raw::$usart_pac)> for $fc_hal {
            fn from(raw: (raw::$fc_pac, raw::$i2c_pac, raw::$spi_pac, raw::$usart_pac)) -> Self {
                $fc_hal::new(raw)
            }
        }

        impl $fc_hal {
            fn new(raw: (raw::$fc_pac, raw::$i2c_pac, raw::$spi_pac, raw::$usart_pac)) -> Self {
                $fc_hal {
                    raw_fc: raw.0,
                    raw_i2c: raw.1,
                    raw_spi: raw.2,
                    raw_usart: raw.3,
                    _state: init_state::Unknown,
                }
            }

            // pub unsafe fn steal() -> Self {
            //     // seems a little wastefule to steal the full peripherals but ok..
            //     Self::new(raw::Peripherals::steal().$pac_name)
            // }
        }

        impl<State> $fc_hal<State> {
            pub fn release(self) -> (raw::$fc_pac, raw::$i2c_pac, raw::$spi_pac, raw::$usart_pac) {
                (self.raw_fc, self.raw_i2c, self.raw_spi, self.raw_usart)
            }
        }

        impl $fc_hal {
            fn enabled(&mut self, syscon: &mut syscon::Syscon) {
                syscon.reset(&mut self.raw_fc);
                syscon.enable_clock(&mut self.raw_fc);
            }

            pub fn enabled_as_i2c(mut self, syscon: &mut syscon::Syscon) -> $i2c_hal<init_state::Enabled> {

                // The FRG output frequency must not be higher than 48 MHz for SPI and I2S
                // and not higher than 44 MHz for USART and I2C.
                //
                // Currently, we just use the 12MHz clock

                syscon.raw.$register_sel().modify(|_, w| w.sel().enum_0x2()); // Fro12MHz

                self.enabled(syscon);

                self.raw_fc.pselid.modify(|_, w| w
                    // select I2C function on corresponding FLEXCOMM
                    .persel().i2c()
                    // lock it
                    .lock().locked()
                );
                assert!(self.raw_fc.pselid.read().i2cpresent().is_present());

                $i2c_hal {
                    _raw_fc: self.raw_fc,
                    raw: self.raw_i2c,
                    _raw_spi: self.raw_spi,
                    _raw_usart: self.raw_usart,
                    _state: init_state::Enabled(()),
                }
            }

        // impl $i2c_hal {
        //     pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> $hal_name<init_state::Disabled> {
        //         syscon.disable_clock(&mut self.raw);

        //         $hal_name {
        //             raw: self.raw,
        //             _state: init_state::Disabled,
        //         }
        //     }
        // }
        }
    }
}

flexcomm!(Flexcomm0, I2c0, Spi0, Usart0, FLEXCOMM0, I2C0, SPI0, USART0, fcclksel0);
flexcomm!(Flexcomm1, I2c1, Spi1, Usart1, FLEXCOMM1, I2C1, SPI1, USART1, fcclksel1);
flexcomm!(Flexcomm2, I2c2, Spi2, Usart2, FLEXCOMM2, I2C2, SPI2, USART2, fcclksel2);
flexcomm!(Flexcomm3, I2c3, Spi3, Usart3, FLEXCOMM3, I2C3, SPI3, USART3, fcclksel3);
flexcomm!(Flexcomm4, I2c4, Spi4, Usart4, FLEXCOMM4, I2C4, SPI4, USART4, fcclksel4);
flexcomm!(Flexcomm5, I2c5, Spi5, Usart5, FLEXCOMM5, I2C5, SPI5, USART5, fcclksel5);
flexcomm!(Flexcomm6, I2c6, Spi6, Usart6, FLEXCOMM6, I2C6, SPI6, USART6, fcclksel6);
flexcomm!(Flexcomm7, I2c7, Spi7, Usart7, FLEXCOMM7, I2C7, SPI7, USART7, fcclksel7);

// flexcomm_enable_disable!(Flexcomm0, fcclksel0);
// // impl Flexcomm for Flexcomm0 {}

// crate::wrap_stateful_peripheral!(Flexcomm1, FLEXCOMM1);
// flexcomm_enable_disable!(Flexcomm1, fcclksel1);
// // impl Flexcomm for Flexcomm1 {}

// crate::wrap_stateful_peripheral!(Flexcomm2, FLEXCOMM2);
// flexcomm_enable_disable!(Flexcomm2, fcclksel2);
// // impl Flexcomm for Flexcomm2 {}

// crate::wrap_stateful_peripheral!(Flexcomm3, FLEXCOMM3);
// flexcomm_enable_disable!(Flexcomm3, fcclksel3);
// // impl Flexcomm for Flexcomm3 {}

// crate::wrap_stateful_peripheral!(Flexcomm4, FLEXCOMM4);
// flexcomm_enable_disable!(Flexcomm4, fcclksel4);
// // impl Flexcomm for Flexcomm4 {}

// crate::wrap_stateful_peripheral!(Flexcomm5, FLEXCOMM5);
// flexcomm_enable_disable!(Flexcomm5, fcclksel5);
// // impl Flexcomm for Flexcomm5 {}

// crate::wrap_stateful_peripheral!(Flexcomm6, FLEXCOMM6);
// flexcomm_enable_disable!(Flexcomm6, fcclksel6);
// // impl Flexcomm for Flexcomm6 {}

// crate::wrap_stateful_peripheral!(Flexcomm7, FLEXCOMM7);
// flexcomm_enable_disable!(Flexcomm7, fcclksel7);
// // impl Flexcomm for Flexcomm7 {}

pub trait I2c {}

impl I2c for I2c0 {}
impl I2c for I2c1 {}
impl I2c for I2c2 {}
impl I2c for I2c3 {}
impl I2c for I2c4 {}
impl I2c for I2c5 {}
impl I2c for I2c6 {}
impl I2c for I2c7 {}

/// I2C serial clock
pub trait I2cSclPin<PIO, I2C> where PIO: PinId, I2C: I2c {}
/// I2C serial data
pub trait I2cSdaPin<PIO, I2C> where PIO: PinId, I2C: I2c {}

impl<PIO: PinId> I2cSclPin<PIO, I2c2> for Pin<PIO, Special<pin_function::FC2_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c2> for Pin<PIO, Special<pin_function::FC2_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c4> for Pin<PIO, Special<pin_function::FC4_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c4> for Pin<PIO, Special<pin_function::FC4_RXD_SDA_MOSI_DATA>> {}

pub trait I2cPins<PIO1: PinId, PIO2: PinId, I2C: I2c> {}

impl<PIO1, PIO2, I2C, SCL, SDA> I2cPins<PIO1, PIO2, I2C> for (SCL, SDA)
where
    PIO1: PinId,
    PIO2: PinId,
    I2C: I2c,
    SCL: I2cSclPin<PIO1, I2C>,
    SDA: I2cSdaPin<PIO2, I2C>,
{}

