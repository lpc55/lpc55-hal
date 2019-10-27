use crate::{
    raw,
    states::init_state,
    peripherals::{
        syscon,
        flexcomm::{
            Flexcomm2,
            Flexcomm4,
        },
    },
};

pub trait I2c {}

macro_rules! wrap_i2c_flexcomm {
    ($hal_name:ident, $pac_name:ident, $hal_flexcomm:ty) => {
        pub struct $hal_name {
            pub(crate) raw: raw::$pac_name,
            pub(crate) fc: $hal_flexcomm,
        }

        impl core::convert::From<(raw::$pac_name, $hal_flexcomm)> for $hal_name {
            fn from(was: (raw::$pac_name, $hal_flexcomm)) -> Self {
                $hal_name::new(was.0, was.1)
            }
        }

        impl $hal_name {
            fn new(raw: raw::$pac_name, fc: $hal_flexcomm) -> Self {
                fc.raw.pselid.modify(|_, w| w
                    // select I2C function on corresponding FLEXCOMM
                    .persel().i2c()
                    // lock it
                    .lock().locked()
                );
                $hal_name {
                    raw,
                    fc,
                }
            }

            // pub unsafe fn steal() -> Self {
            //     // seems a little wasteful to steal the full peripherals but ok..
            //     Self::new(raw::Peripherals::steal().$pac_name)
            // }

            pub fn release(self) -> (raw::$pac_name, $hal_flexcomm) {
                (self.raw, self.fc)
            }
        }
    };
}

// macro_rules! i2c_enable_disable {
//     ($hal_name:ident) => {
//         impl $hal_name {
//             /// Consumes disabled $hal_name, returns an enabled one
//             pub fn enabled(self) -> $hal_name<init_state::Enabled> {

//                 self.fc.raw.pselid.modify(|_, w| w
//                     // select I2C function on corresponding FLEXCOMM
//                     .persel().i2c()
//                     // lock it
//                     .lock().locked()
//                 );
//                 assert!(self.fc.raw.pselid.read().i2cpresent().is_present());

//                 // syscon.reset(&mut self.raw);
//                 // syscon.enable_clock(&mut self.raw);

//                 $hal_name {
//                     raw: self.raw,
//                     fc: self.fc,
//                     _state: init_state::Enabled(()),
//                 }
//             }

//             /// Consumes disabled $hal_name, returns an enabled one
//             pub fn disabled(self) -> $hal_name<init_state::Disabled> {
//                 // syscon.disable_clock(&mut self.raw);

//                 $hal_name {
//                     raw: self.raw,
//                     fc: self.fc,
//                     _state: init_state::Disabled,
//                 }
//             }
//         }
//     }
// }

wrap_i2c_flexcomm!(I2c2, I2C2, Flexcomm2<init_state::Enabled>);
// i2c_enable_disable!(I2c2);
impl I2c for I2c2 {}

wrap_i2c_flexcomm!(I2c4, I2C4, Flexcomm4<init_state::Enabled>);
// i2c_enable_disable!(I2c4);
impl I2c for I2c4 {}


/// I2C serial clock
pub trait I2cSclPin<I2C> where I2C: I2c {}
/// I2C serial data
pub trait I2cSdaPin<I2C> where I2C: I2c {}

impl I2cSclPin<I2c2> for crate::states::pin_function::FC2_TXD_SCL_MISO_WS {}
impl I2cSdaPin<I2c2> for crate::states::pin_function::FC2_RXD_SDA_MOSI_DATA {}
impl I2cSclPin<I2c4> for crate::states::pin_function::FC4_TXD_SCL_MISO_WS {}
impl I2cSdaPin<I2c4> for crate::states::pin_function::FC4_RXD_SDA_MOSI_DATA {}

pub trait I2cPins<I2C: I2c> {}

impl<I2C, SCL, SDA> I2cPins<I2C> for (SCL, SDA)
where
    I2C: I2c,
    SCL: I2cSclPin<I2C>,
    SDA: I2cSdaPin<I2C>,
{}


