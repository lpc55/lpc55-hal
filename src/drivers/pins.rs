use crate::{
    raw::gpio::{CLR, DIRSET, PIN, SET},
    peripherals::{
        flexcomm::*,
        gpio::Gpio,
        iocon::Iocon,
    },
    states::{
        init_state,
        pin_state::{
            self,
            Special,
        },
        pin_function::{
            self,
            *,
        }
    },
};

pub use crate::states::gpio_state::{
    direction,
    Level,
};

pub mod types;

pub mod gpio;
// pub mod special;

pub use types::{
    PinId,
    Pin,
    PinType,
};

impl<T> Pin<T, pin_state::Unused>
where
    T: PinId,
{
    /// Transition pin to GPIO state
    pub fn into_gpio_pin(
        self,
        _: &mut Gpio<init_state::Enabled>,
    ) -> Pin<T, pin_state::Gpio<direction::Unknown>> {
        // TODO: need to set FUNC to 0 at minimum
        // --> iocon.raw.piox_y.... <-- needs a macro
        Pin {
            id: self.id,
            state: pin_state::Gpio {
                dirset: crate::reg_proxy::RegClusterProxy::new(),
                pin: crate::reg_proxy::RegClusterProxy::new(),
                set: crate::reg_proxy::RegClusterProxy::new(),
                clr: crate::reg_proxy::RegClusterProxy::new(),

                _direction: direction::Unknown,
            },
        }
    }
}

impl Pin<Pio0_22, pin_state::Unused> {
    pub fn into_usb0_vbus_pin(
        self,
        iocon: &mut Iocon<init_state::Enabled>,
    ) -> Pin<Pio0_22, pin_state::Special<pin_function::USB0_VBUS>> {
        iocon.raw.pio0_22.modify(|_, w|
            w
            .func().alt7() // FUNC7, pin configured as USB0_VBUS
            .mode().inactive() // MODE_INACT, no additional pin function
            .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
            .invert().disabled() // INV_DI, input function is not inverted
            .digimode().digital() // DIGITAL_EN, enable digital fucntion
            .od().normal() // OPENDRAIN_DI, open drain is disabled
        );

        Pin {
            id: self.id,
            state: pin_state::Special {
                _function: pin_function::USB0_VBUS,
            },
        }
    }
}


// seems a bit inefficient, but want to be able to safely
// take individual pins instead of the whole bunch
static mut PIN_TAKEN: [[bool; 32]; 2] = [[false; 32]; 2];

macro_rules! pins {
    ($(
        $field:ident,
        $pin:ident,
        $port:expr,
        $number:expr,
        $type:expr,
        $default_state_ty:ty,
        $default_state_val:expr;
    )*) => {
        /// Provides access to all pins
        #[allow(missing_docs)]
        pub struct Pins {
            $(pub $field: Pin<$pin, $default_state_ty>,)*
        }

        impl Pins {

            fn any_taken() -> bool {
                unsafe {
                    let any_port_0 = PIN_TAKEN[0].iter().any(|x| *x);
                    let any_port_1 = PIN_TAKEN[1].iter().any(|x| *x);
                    any_port_0 || any_port_1
                }
            }

            fn set_all_taken() {
                unsafe {
                    for entry in PIN_TAKEN[0].iter_mut() { *entry = true; }
                    for entry in PIN_TAKEN[1].iter_mut() { *entry = true; }
                }
            }

            fn set_all_released() {
                unsafe {
                    for entry in PIN_TAKEN[0].iter_mut() { *entry = false; }
                    for entry in PIN_TAKEN[1].iter_mut() { *entry = false; }
                }
            }

            pub fn take() -> Option<Self> {
                if Self::any_taken() {
                    None
                } else {
                    Some(unsafe {
                        Self::set_all_taken();
                        Self::steal()
                    } )
                }
            }

            pub fn release(self) {
                Self::set_all_released();
            }

            pub unsafe fn steal() -> Self {
                Self {
                    $(
                        $field: $pin::steal(),
                    )*
                }
            }
        }


        $(
            /// Identifies a specific pin
            ///
            /// Pins can be `take`n individually, or en bloc via `Pins`.
            #[allow(non_camel_case_types)]
            pub struct $pin(());

            impl Pin<$pin, pin_state::Unused>  {
                /// Transition pin to GPIO state
                pub fn into_gpio_pin2(
                    self,
                    iocon: &mut Iocon<init_state::Enabled>,
                    _: &mut Gpio<init_state::Enabled>,
                ) -> Pin<$pin, pin_state::Gpio<direction::Unknown>> {
                    // TODO: need to set FUNC to 0 at minimum
                    iocon.raw.$field.modify(|_, w| w
                        .func().alt0() // FUNC $i, pin configured as $FUNCTION
                        .mode().inactive() // MODE_INACT, no additional pin function
                        .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
                        .invert().disabled() // INV_DI, input function is not inverted
                        .digimode().digital() // DIGITAL_EN, enable digital fucntion
                        .od().normal() // OPENDRAIN_DI, open drain is disabled
                    );
                    Pin {
                        id: self.id,
                        state: pin_state::Gpio {
                            dirset: crate::reg_proxy::RegClusterProxy::new(),
                            pin: crate::reg_proxy::RegClusterProxy::new(),
                            set: crate::reg_proxy::RegClusterProxy::new(),
                            clr: crate::reg_proxy::RegClusterProxy::new(),

                            _direction: direction::Unknown,
                        },
                    }
                }
            }

            impl $pin {
                pub fn take() -> Option<Pin<Self, $default_state_ty>> {
                    if unsafe { PIN_TAKEN[$port][$number] } {
                        None
                    } else {
                        Some(unsafe {
                            Self::steal()
                        } )
                    }
                }

                pub fn release(self) {
                    unsafe { PIN_TAKEN[$port][$number] = false; }
                }

                pub unsafe fn steal() -> Pin<Self, $default_state_ty> {
                    PIN_TAKEN[$port][$number] = true;
                    Pin {
                        id: Self(()),
                        state: $default_state_val,
                    }
                }
            }

            impl PinId for $pin {
                const PORT: usize = $port;
                const NUMBER: u8    = $number;
                const MASK: u32   = 0x1 << $number;
                const TYPE: PinType = $type;
            }
        )*
    }
}

pins!(
    pio0_0 , Pio0_0 , 0,  0, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_1 , Pio0_1 , 0,  1, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_2 , Pio0_2 , 0,  2, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_3 , Pio0_3 , 0,  3, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_4 , Pio0_4 , 0,  4, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_5 , Pio0_5 , 0,  5, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_6 , Pio0_6 , 0,  6, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_7 , Pio0_7 , 0,  7, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_8 , Pio0_8 , 0,  8, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_9 , Pio0_9 , 0,  9, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_10, Pio0_10, 0, 10, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_11, Pio0_11, 0, 11, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_12, Pio0_12, 0, 12, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_13, Pio0_13, 0, 13, PinType::I, pin_state::Unused, pin_state::Unused;
    pio0_14, Pio0_14, 0, 14, PinType::I, pin_state::Unused, pin_state::Unused;
    pio0_15, Pio0_15, 0, 15, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_16, Pio0_16, 0, 16, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_17, Pio0_17, 0, 17, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_18, Pio0_18, 0, 18, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_19, Pio0_19, 0, 19, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_20, Pio0_20, 0, 20, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_21, Pio0_21, 0, 21, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_22, Pio0_22, 0, 22, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_23, Pio0_23, 0, 23, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_24, Pio0_24, 0, 24, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_25, Pio0_25, 0, 25, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_26, Pio0_26, 0, 26, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_27, Pio0_27, 0, 27, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_28, Pio0_28, 0, 28, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_29, Pio0_29, 0, 29, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_30, Pio0_30, 0, 30, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_31, Pio0_31, 0, 31, PinType::A, pin_state::Unused, pin_state::Unused;

    pio1_0 , Pio1_0 , 1,  0, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_1 , Pio1_1 , 1,  1, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_2 , Pio1_2 , 1,  2, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_3 , Pio1_3 , 1,  3, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_4 , Pio1_4 , 1,  4, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_5 , Pio1_5 , 1,  5, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_6 , Pio1_6 , 1,  6, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_7 , Pio1_7 , 1,  7, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_8 , Pio1_8 , 1,  8, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_9 , Pio1_9 , 1,  9, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_10, Pio1_10, 1, 10, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_11, Pio1_11, 1, 11, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_12, Pio1_12, 1, 12, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_13, Pio1_13, 1, 13, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_14, Pio1_14, 1, 14, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_15, Pio1_15, 1, 15, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_16, Pio1_16, 1, 16, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_17, Pio1_17, 1, 17, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_18, Pio1_18, 1, 18, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_19, Pio1_19, 1, 19, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_20, Pio1_20, 1, 20, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_21, Pio1_21, 1, 21, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_22, Pio1_22, 1, 22, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_23, Pio1_23, 1, 23, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_24, Pio1_24, 1, 24, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_25, Pio1_25, 1, 25, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_26, Pio1_26, 1, 26, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_27, Pio1_27, 1, 27, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_28, Pio1_28, 1, 28, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_29, Pio1_29, 1, 29, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_30, Pio1_30, 1, 30, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_31, Pio1_31, 1, 31, PinType::D, pin_state::Unused, pin_state::Unused;
);

use crate::reg_cluster;
reg_cluster!(DIRSET, DIRSET, raw::GPIO, dirset);
reg_cluster!(PIN, PIN, raw::GPIO, pin);
reg_cluster!(SET, SET, raw::GPIO, set);
reg_cluster!(CLR, CLR, raw::GPIO, clr);


// all that follows is generated with `generate-flexcomm-pin-driver.py`

 // 390 macro_rules! pins {
 // 391     ($($SPIX:ty: SCK: [$($SCK:ty),*] MISO: [$($MISO:ty),*] MOSI: [$($MOSI:ty),*])+) => {
 // 392         $(
 // 393             $(
 // 394                 impl PinSck<$SPIX> for $SCK {}
 // 395             )*
 // 396             $(
 // 397                 impl PinMiso<$SPIX> for $MISO {}
 // 398             )*
 // 399             $(
 // 400                 impl PinMosi<$SPIX> for $MOSI {}
 // 401             )*
 // 402         )+
 // 403     }
 // 404 }

// macro_rules! special_pin {
//     ($Pin:ty,$pin:ident,$alt_func:expr,$SPECIAL_FUNCTION:ident,$method:ident,$Peripheral:ty,$Marker:ident) => {
//         impl Pin<$Pin, pin_state::Unused> {
//             pub fn $method(
//                 self,
//                 iocon: &mut Iocon<init_state::Enabled>,
//             ) ->Pin<$Pin, pin_state::Special<$SPECIAL_FUNCTION>> {
//                 // unfortunately, data sheet has more FUNCs than SVD has alts
//                 // otherwise, it would be safe
//                 iocon.raw.$pin.modify(|_, w| unsafe {
//                     w
//                     .func().bits($alt_func) // FUNC $i, pin configured as $FUNCTION
//                     .mode().inactive() // MODE_INACT, no additional pin function
//                     .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//                     .invert().disabled() // INV_DI, input function is not inverted
//                     .digimode().digital() // DIGITAL_EN, enable digital fucntion
//                     .od().normal() // OPENDRAIN_DI, open drain is disabled
//                 });

//                 Pin {
//                     id: self.id,
//                     state: Special {
//                         _function: $SPECIAL_FUNCTION,
//                     },
//                 }
//             }
//         }
//         // impl<PIO: PinId> $Marker<PIO, $Peripheral> for Pin<PIO, Special<$SPECIAL_FUNCTION>> {}
//         impl $Marker<$Pin, $Peripheral> for Pin<$Pin, Special<$SPECIAL_FUNCTION>> {}
//     };
// }

// special_pin!(Pio0_0, pio0_0, 2, FC3_SCK, _into_usart3_sclk_pin, Usart3, UsartSclkPin);

macro_rules! special_pins {
    ($(
        ($Pin:ty,$pin:ident): {
            $(
                ($alt_func:expr, $SPECIAL_FUNCTION:ident): [
                    $(
                        ($method:ident,$Peripheral:ty,$Marker:ident),
                    )*
                ]
            )+
    })*) => {

    $($($(
        // special_pin!($Pin,$pin,$alt_func,$SPECIAL_FUNCTION,$method,$Peripheral,$Marker);
        impl Pin<$Pin, pin_state::Unused> {
            pub fn $method(
                self,
                iocon: &mut Iocon<init_state::Enabled>,
            ) ->Pin<$Pin, pin_state::Special<$SPECIAL_FUNCTION>> {
                // unfortunately, data sheet has more FUNCs than SVD has alts
                // otherwise, it would be safe
                iocon.raw.$pin.modify(|_, w| unsafe {
                    w
                    .func().bits($alt_func) // FUNC $i, pin configured as $FUNCTION
                    .mode().inactive() // MODE_INACT, no additional pin function
                    .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
                    .invert().disabled() // INV_DI, input function is not inverted
                    .digimode().digital() // DIGITAL_EN, enable digital fucntion
                    .od().normal() // OPENDRAIN_DI, open drain is disabled
                });

                Pin {
                    id: self.id,
                    state: Special {
                        _function: $SPECIAL_FUNCTION {},
                    },
                }
            }
        }
        // impl<PIO: PinId> $Marker<PIO, $Peripheral> for Pin<PIO, Special<$SPECIAL_FUNCTION>> {}
        // impl $Marker<$Pin, $Peripheral> for Pin<$Pin, Special<$SPECIAL_FUNCTION>> {}
    )*)+)*
    }
}

special_pins! {
    (Pio0_0, pio0_0): {
        (2, FC3_SCK): [
            (into_usart3_sclk_pin, Usart3, UsartSclkPin),

        ]
    }

    (Pio0_1, pio0_1): {
        (2, FC3_CTS_SDA_SSEL0): [
            (into_usart3_cts_pin, Usart3, UsartCtsPin),
            (into_i2c3_sda_pin, I2c3, I2cSdaPin),
            (into_spi_ssel0_pin, Spi3, SpiSselPin),
        ]
    }

    (Pio1_1, pio1_1): {
        (6, HS_SPI_SSEL1): [
            (into_spi8_ssel1_pin, Spi8, SpiSselPin),
        ]
    }

    (Pio1_2, pio1_2): {
        (6, HS_SPI_SCK): [
            (into_spi8_sck_pin, Spi8, SpiSckPin),
        ]
    }

    (Pio0_26, pio0_26): {
        (9, HS_SPI_MOSI ): [
            (into_spi8_mosi_pin, Spi8, SpiMosiPin),
        ]
    }

    (Pio1_3, pio1_3): {
        (9, HS_SPI_MISO ): [
            (into_spi8_miso_pin, Spi8, SpiMisoPin),
        ]
    }
}
    // let sck = pins.pio1_2.into_spi8_sck_pin(&mut iocon);
    // let mosi = pins.pio0_26.into_spi8_mosi_pin(&mut iocon);
    // let miso = pins.pio1_3.into_spi8_miso_pin(&mut iocon);
    // let ssel1 = pins.pio1_1.into_spi8_ssel1_pin(&mut iocon);

impl SpiSckPin<Pio1_2, Spi8> for Pin<Pio1_2, Special<HS_SPI_SCK>> {}
impl SpiMosiPin<Pio0_26, Spi8> for Pin<Pio0_26, Special<HS_SPI_MOSI>> {}
impl SpiMisoPin<Pio1_3, Spi8> for Pin<Pio1_3, Special<HS_SPI_MISO>> {}

macro_rules! ssel_pins {
    ($($FUNCTION:ident: ($Spi:ty, $slave:ident),)*) => {$(
        impl<PIO: PinId> SpiSselPin<PIO, $Spi> for Pin<PIO, Special<$FUNCTION>> {
            const SSEL: SlaveSelect = SlaveSelect::$slave;
        }
    )*}
}
ssel_pins! {
    FC7_CTS_SDA_SSEL0: (Spi7, Slave0),
    FC7_RTS_SCL_SSEL1: (Spi7, Slave1),
    HS_SPI_SSEL1: (Spi8, Slave1),
}

// impl Pin<Pio0_0, pin_state::Unused> {
//     pub fn into_usart3_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_0, pin_state::Special<FC3_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_0.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC3_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_1, pin_state::Unused> {
//     pub fn into_usart3_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_1, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_1.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_1, pin_state::Unused> {
//     pub fn into_i2c3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_1, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_1.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_1, pin_state::Unused> {
//     pub fn into_spi3_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_1, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_1.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_2, pin_state::Unused> {
//     pub fn into_usart3_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_2, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_2.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_2, pin_state::Unused> {
//     pub fn into_i2c3_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_2, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_2.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_2, pin_state::Unused> {
//     pub fn into_spi3_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_2, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_2.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_2, pin_state::Unused> {
//     pub fn into_i2s3_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_2, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_2.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_3, pin_state::Unused> {
//     pub fn into_usart3_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_3, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_3.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_3, pin_state::Unused> {
//     pub fn into_i2c3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_3, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_3.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_3, pin_state::Unused> {
//     pub fn into_spi3_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_3, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_3.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_3, pin_state::Unused> {
//     pub fn into_i2s3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_3, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_3.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_4, pin_state::Unused> {
//     pub fn into_usart4_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_4, pin_state::Special<FC4_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_4.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC4_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_usart4_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_i2c4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_spi4_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_i2s4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_usart3_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(8) // FUNC8, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_i2c3_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(8) // FUNC8, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_5, pin_state::Unused> {
//     pub fn into_spi3_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_5, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_5.modify(|_, w| unsafe {
//             w
//             .func().bits(8) // FUNC8, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_6, pin_state::Unused> {
//     pub fn into_usart3_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_6, pin_state::Special<FC3_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_6.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_7, pin_state::Unused> {
//     pub fn into_usart3_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_7, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_7, pin_state::Unused> {
//     pub fn into_i2c3_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_7, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_7, pin_state::Unused> {
//     pub fn into_spi3_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_7, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_7, pin_state::Unused> {
//     pub fn into_usart5_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_7, pin_state::Special<FC5_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_7.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_7, pin_state::Unused> {
//     pub fn into_usart1_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_7, pin_state::Special<FC1_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_7.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC1_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_8, pin_state::Unused> {
//     pub fn into_spi3_ssel3_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_8, pin_state::Special<FC3_SSEL3>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_8.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_SSEL3
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SSEL3,
//             },
//         }
//     }
// }
// impl Pin<Pio0_8, pin_state::Unused> {
//     pub fn into_usart5_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_8, pin_state::Special<FC5_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_8.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_8, pin_state::Unused> {
//     pub fn into_i2c5_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_8, pin_state::Special<FC5_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_8.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_8, pin_state::Unused> {
//     pub fn into_spi5_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_8, pin_state::Special<FC5_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_8.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_8, pin_state::Unused> {
//     pub fn into_i2s5_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_8, pin_state::Special<FC5_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_8.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_9, pin_state::Unused> {
//     pub fn into_spi3_ssel2_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_9, pin_state::Special<FC3_SSEL2>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_9.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_SSEL2
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SSEL2,
//             },
//         }
//     }
// }
// impl Pin<Pio0_9, pin_state::Unused> {
//     pub fn into_usart5_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_9, pin_state::Special<FC5_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_9.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_9, pin_state::Unused> {
//     pub fn into_i2c5_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_9, pin_state::Special<FC5_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_9.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_9, pin_state::Unused> {
//     pub fn into_spi5_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_9, pin_state::Special<FC5_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_9.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_9, pin_state::Unused> {
//     pub fn into_i2s5_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_9, pin_state::Special<FC5_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_9.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC5_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_10, pin_state::Unused> {
//     pub fn into_usart6_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_10, pin_state::Special<FC6_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_10.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_10, pin_state::Unused> {
//     pub fn into_usart1_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_10, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_10.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_10, pin_state::Unused> {
//     pub fn into_i2c1_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_10, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_10.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_10, pin_state::Unused> {
//     pub fn into_spi1_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_10, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_10.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_10, pin_state::Unused> {
//     pub fn into_i2s1_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_10, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_10.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_11, pin_state::Unused> {
//     pub fn into_usart6_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_11, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_11.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_11, pin_state::Unused> {
//     pub fn into_i2c6_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_11, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_11.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_11, pin_state::Unused> {
//     pub fn into_spi6_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_11, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_11.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_11, pin_state::Unused> {
//     pub fn into_i2s6_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_11, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_11.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_usart3_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_i2c3_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_spi3_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_i2s3_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC3_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_usart6_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_i2c6_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_spi6_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_12, pin_state::Unused> {
//     pub fn into_i2s6_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_12, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_12.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_usart1_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_i2c1_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_spi1_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_usart1_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_spi1_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_13, pin_state::Unused> {
//     pub fn into_i2s1_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_13, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_13.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_usart1_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_i2c1_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_spi1_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC1_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_usart1_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(6) // FUNC6, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_spi1_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(6) // FUNC6, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_14, pin_state::Unused> {
//     pub fn into_i2s1_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_14, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_14.modify(|_, w| unsafe {
//             w
//             .func().bits(6) // FUNC6, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_15, pin_state::Unused> {
//     pub fn into_usart6_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_15, pin_state::Special<FC6_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_15.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_15, pin_state::Unused> {
//     pub fn into_i2c6_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_15, pin_state::Special<FC6_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_15.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_15, pin_state::Unused> {
//     pub fn into_spi6_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_15, pin_state::Special<FC6_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_15.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_16, pin_state::Unused> {
//     pub fn into_usart4_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_16, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_16.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_16, pin_state::Unused> {
//     pub fn into_i2c4_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_16, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_16.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_16, pin_state::Unused> {
//     pub fn into_spi4_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_16, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_16.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_16, pin_state::Unused> {
//     pub fn into_i2s4_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_16, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_16.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_17, pin_state::Unused> {
//     pub fn into_spi4_ssel2_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_17, pin_state::Special<FC4_SSEL2>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_17.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_SSEL2
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_SSEL2,
//             },
//         }
//     }
// }
// impl Pin<Pio0_18, pin_state::Unused> {
//     pub fn into_usart4_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_18, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_18.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_18, pin_state::Unused> {
//     pub fn into_i2c4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_18, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_18.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_18, pin_state::Unused> {
//     pub fn into_spi4_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_18, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_18.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_usart4_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_i2c4_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_spi4_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_usart7_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_i2c7_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_spi7_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_19, pin_state::Unused> {
//     pub fn into_i2s7_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_19, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_19.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_usart3_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_i2c3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_spi3_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC3_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_usart7_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_i2c7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_spi7_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_i2s7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_usart4_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_i2c4_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_spi4_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_20, pin_state::Unused> {
//     pub fn into_i2s4_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_21, pin_state::Unused> {
//     pub fn into_usart3_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_21, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_21, pin_state::Unused> {
//     pub fn into_i2c3_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_21, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_21, pin_state::Unused> {
//     pub fn into_spi3_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_21, pin_state::Special<FC3_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio0_21, pin_state::Unused> {
//     pub fn into_usart7_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_21, pin_state::Special<FC7_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_21.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_22, pin_state::Unused> {
//     pub fn into_usart6_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_22, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_22.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_22, pin_state::Unused> {
//     pub fn into_i2c6_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_22, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_22.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_22, pin_state::Unused> {
//     pub fn into_spi6_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_22, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_22.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_22, pin_state::Unused> {
//     pub fn into_i2s6_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_22, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_22.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_23, pin_state::Unused> {
//     pub fn into_usart0_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_23, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_23.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_23, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_23, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_23.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_23, pin_state::Unused> {
//     pub fn into_spi0_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_23, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_23.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_24, pin_state::Unused> {
//     pub fn into_usart0_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_24, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_24, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_24, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_24, pin_state::Unused> {
//     pub fn into_spi0_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_24, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_24, pin_state::Unused> {
//     pub fn into_i2s0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_24, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_25, pin_state::Unused> {
//     pub fn into_usart0_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_25, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_25, pin_state::Unused> {
//     pub fn into_i2c0_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_25, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_25, pin_state::Unused> {
//     pub fn into_spi0_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_25, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_25, pin_state::Unused> {
//     pub fn into_i2s0_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_25, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_26, pin_state::Unused> {
//     pub fn into_usart2_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_26, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_26, pin_state::Unused> {
//     pub fn into_i2c2_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_26, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_26, pin_state::Unused> {
//     pub fn into_spi2_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_26, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_26, pin_state::Unused> {
//     pub fn into_i2s2_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_26, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_26, pin_state::Unused> {
//     pub fn into_usart0_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_26, pin_state::Special<FC0_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_26.modify(|_, w| unsafe {
//             w
//             .func().bits(8) // FUNC8, pin configured as FC0_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_usart2_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_i2c2_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_spi2_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_i2s2_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_usart7_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_i2c7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_spi7_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_27, pin_state::Unused> {
//     pub fn into_i2s7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_27, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_27.modify(|_, w| unsafe {
//             w
//             .func().bits(7) // FUNC7, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_28, pin_state::Unused> {
//     pub fn into_usart0_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_28, pin_state::Special<FC0_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_28.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio0_29, pin_state::Unused> {
//     pub fn into_usart0_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_29, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_29, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_29, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_29, pin_state::Unused> {
//     pub fn into_spi0_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_29, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_29, pin_state::Unused> {
//     pub fn into_i2s0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_29, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio0_30, pin_state::Unused> {
//     pub fn into_usart0_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_30, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_30, pin_state::Unused> {
//     pub fn into_i2c0_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_30, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_30, pin_state::Unused> {
//     pub fn into_spi0_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_30, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_30, pin_state::Unused> {
//     pub fn into_i2s0_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_30, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio0_31, pin_state::Unused> {
//     pub fn into_usart0_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_31, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_31.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_31, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_31, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_31.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio0_31, pin_state::Unused> {
//     pub fn into_spi0_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio0_31, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio0_31.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_0, pin_state::Unused> {
//     pub fn into_usart0_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_0, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_0.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_0, pin_state::Unused> {
//     pub fn into_i2c0_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_0, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_0.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_0, pin_state::Unused> {
//     pub fn into_spi0_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_0, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_0.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_1, pin_state::Unused> {
//     pub fn into_usart3_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_1, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_1.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_1, pin_state::Unused> {
//     pub fn into_i2c3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_1, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_1.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_1, pin_state::Unused> {
//     pub fn into_spi3_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_1, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_1.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_1, pin_state::Unused> {
//     pub fn into_i2s3_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_1, pin_state::Special<FC3_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_1.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC3_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_4, pin_state::Unused> {
//     pub fn into_usart0_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_4, pin_state::Special<FC0_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_4.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_5, pin_state::Unused> {
//     pub fn into_usart0_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_5, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_5.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_5, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_5, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_5.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_5, pin_state::Unused> {
//     pub fn into_spi0_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_5, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_5.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_5, pin_state::Unused> {
//     pub fn into_i2s0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_5, pin_state::Special<FC0_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_5.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_6, pin_state::Unused> {
//     pub fn into_usart0_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_6, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_6.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_6, pin_state::Unused> {
//     pub fn into_i2c0_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_6, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_6.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_6, pin_state::Unused> {
//     pub fn into_spi0_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_6, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_6.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_6, pin_state::Unused> {
//     pub fn into_i2s0_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_6, pin_state::Special<FC0_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_6.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_7, pin_state::Unused> {
//     pub fn into_usart0_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_7, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_7, pin_state::Unused> {
//     pub fn into_i2c0_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_7, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_7, pin_state::Unused> {
//     pub fn into_spi0_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_7, pin_state::Special<FC0_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_7.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_8, pin_state::Unused> {
//     pub fn into_usart0_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_8, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_8.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_8, pin_state::Unused> {
//     pub fn into_i2c0_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_8, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_8.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_8, pin_state::Unused> {
//     pub fn into_spi0_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_8, pin_state::Special<FC0_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_8.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC0_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC0_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_8, pin_state::Unused> {
//     pub fn into_spi4_ssel2_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_8, pin_state::Special<FC4_SSEL2>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_8.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_SSEL2
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_SSEL2,
//             },
//         }
//     }
// }
// impl Pin<Pio1_9, pin_state::Unused> {
//     pub fn into_usart1_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_9, pin_state::Special<FC1_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_9.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_9, pin_state::Unused> {
//     pub fn into_usart4_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_9, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_9.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_9, pin_state::Unused> {
//     pub fn into_i2c4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_9, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_9.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_9, pin_state::Unused> {
//     pub fn into_spi4_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_9, pin_state::Special<FC4_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_9.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_10, pin_state::Unused> {
//     pub fn into_usart1_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_10, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_10.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_10, pin_state::Unused> {
//     pub fn into_i2c1_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_10, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_10.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_10, pin_state::Unused> {
//     pub fn into_spi1_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_10, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_10.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_10, pin_state::Unused> {
//     pub fn into_i2s1_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_10, pin_state::Special<FC1_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_10.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_11, pin_state::Unused> {
//     pub fn into_usart1_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_11, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_11.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_11, pin_state::Unused> {
//     pub fn into_i2c1_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_11, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_11.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_11, pin_state::Unused> {
//     pub fn into_spi1_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_11, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_11.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_11, pin_state::Unused> {
//     pub fn into_i2s1_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_11, pin_state::Special<FC1_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_11.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC1_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC1_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_12, pin_state::Unused> {
//     pub fn into_usart6_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_12, pin_state::Special<FC6_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_12.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_13, pin_state::Unused> {
//     pub fn into_usart6_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_13, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_13.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_13, pin_state::Unused> {
//     pub fn into_i2c6_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_13, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_13.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_13, pin_state::Unused> {
//     pub fn into_spi6_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_13, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_13.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_13, pin_state::Unused> {
//     pub fn into_i2s6_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_13, pin_state::Special<FC6_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_13.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_14, pin_state::Unused> {
//     pub fn into_usart5_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_14, pin_state::Special<FC5_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_14.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_14, pin_state::Unused> {
//     pub fn into_i2c5_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_14, pin_state::Special<FC5_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_14.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_14, pin_state::Unused> {
//     pub fn into_spi5_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_14, pin_state::Special<FC5_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_14.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_usart5_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC5_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_i2c5_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC5_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_spi5_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC5_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(4) // FUNC4, pin configured as FC5_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC5_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_usart4_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_i2c4_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_15, pin_state::Unused> {
//     pub fn into_spi4_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_15, pin_state::Special<FC4_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_15.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_16, pin_state::Unused> {
//     pub fn into_usart6_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_16, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_16.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_16, pin_state::Unused> {
//     pub fn into_i2c6_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_16, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_16.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_16, pin_state::Unused> {
//     pub fn into_spi6_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_16, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_16.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_16, pin_state::Unused> {
//     pub fn into_i2s6_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_16, pin_state::Special<FC6_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_16.modify(|_, w| unsafe {
//             w
//             .func().bits(2) // FUNC2, pin configured as FC6_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_17, pin_state::Unused> {
//     pub fn into_usart6_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_17, pin_state::Special<FC6_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_17.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC6_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_17, pin_state::Unused> {
//     pub fn into_i2c6_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_17, pin_state::Special<FC6_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_17.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC6_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_17, pin_state::Unused> {
//     pub fn into_spi6_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_17, pin_state::Special<FC6_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_17.modify(|_, w| unsafe {
//             w
//             .func().bits(3) // FUNC3, pin configured as FC6_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC6_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_19, pin_state::Unused> {
//     pub fn into_usart4_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_19, pin_state::Special<FC4_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_19.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_usart7_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC7_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_i2c7_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC7_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_spi7_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC7_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_usart4_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_i2c4_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_spi4_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_20, pin_state::Unused> {
//     pub fn into_i2s4_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_20, pin_state::Special<FC4_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_20.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_usart7_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC7_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_i2c7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC7_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_spi7_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC7_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_usart4_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_i2c4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_spi4_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_21, pin_state::Unused> {
//     pub fn into_i2s4_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_21, pin_state::Special<FC4_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_21.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_22, pin_state::Unused> {
//     pub fn into_spi4_ssel3_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_22, pin_state::Special<FC4_SSEL3>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_22.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC4_SSEL3
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC4_SSEL3,
//             },
//         }
//     }
// }
// impl Pin<Pio1_23, pin_state::Unused> {
//     pub fn into_usart2_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_23, pin_state::Special<FC2_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_23.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_23, pin_state::Unused> {
//     pub fn into_spi3_ssel2_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_23, pin_state::Special<FC3_SSEL2>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_23.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC3_SSEL2
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SSEL2,
//             },
//         }
//     }
// }
// impl Pin<Pio1_24, pin_state::Unused> {
//     pub fn into_usart2_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_24, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_24, pin_state::Unused> {
//     pub fn into_i2c2_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_24, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_24, pin_state::Unused> {
//     pub fn into_spi2_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_24, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_24, pin_state::Unused> {
//     pub fn into_i2s2_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_24, pin_state::Special<FC2_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_24.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_24, pin_state::Unused> {
//     pub fn into_spi3_ssel3_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_24, pin_state::Special<FC3_SSEL3>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_24.modify(|_, w| unsafe {
//             w
//             .func().bits(5) // FUNC5, pin configured as FC3_SSEL3
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC3_SSEL3,
//             },
//         }
//     }
// }
// impl Pin<Pio1_25, pin_state::Unused> {
//     pub fn into_usart2_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_25, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_25, pin_state::Unused> {
//     pub fn into_i2c2_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_25, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_25, pin_state::Unused> {
//     pub fn into_spi2_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_25, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_25, pin_state::Unused> {
//     pub fn into_i2s2_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_25, pin_state::Special<FC2_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_25.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_26, pin_state::Unused> {
//     pub fn into_usart2_cts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_26, pin_state::Special<FC2_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_26, pin_state::Unused> {
//     pub fn into_i2c2_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_26, pin_state::Special<FC2_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_26, pin_state::Unused> {
//     pub fn into_spi2_ssel0_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_26, pin_state::Special<FC2_CTS_SDA_SSEL0>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_26.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_CTS_SDA_SSEL0
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_CTS_SDA_SSEL0,
//             },
//         }
//     }
// }
// impl Pin<Pio1_27, pin_state::Unused> {
//     pub fn into_usart2_rts_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_27, pin_state::Special<FC2_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_27, pin_state::Unused> {
//     pub fn into_i2c2_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_27, pin_state::Special<FC2_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_27, pin_state::Unused> {
//     pub fn into_spi2_ssel1_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_27, pin_state::Special<FC2_RTS_SCL_SSEL1>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_27.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC2_RTS_SCL_SSEL1
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC2_RTS_SCL_SSEL1,
//             },
//         }
//     }
// }
// impl Pin<Pio1_28, pin_state::Unused> {
//     pub fn into_usart7_sclk_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_28, pin_state::Special<FC7_SCK>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_28.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_SCK
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_SCK,
//             },
//         }
//     }
// }
// impl Pin<Pio1_29, pin_state::Unused> {
//     pub fn into_usart7_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_29, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_29, pin_state::Unused> {
//     pub fn into_i2c7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_29, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_29, pin_state::Unused> {
//     pub fn into_spi7_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_29, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_29, pin_state::Unused> {
//     pub fn into_i2s7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_29, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_29.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_usart7_tx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_i2c7_scl_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_spi7_miso_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_i2s7_ws_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_TXD_SCL_MISO_WS>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_TXD_SCL_MISO_WS
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_TXD_SCL_MISO_WS,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_usart7_rx_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_i2c7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_spi7_mosi_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }
// impl Pin<Pio1_30, pin_state::Unused> {
//     pub fn into_i2s7_sda_pin(
//         self,
//         iocon: &mut Iocon<init_state::Enabled>,
//     ) ->Pin<Pio1_30, pin_state::Special<FC7_RXD_SDA_MOSI_DATA>> {
//         // unfortunately, data sheet has more FUNCs than SVD has alts
//         // otherwise, it would be safe
//         iocon.raw.pio1_30.modify(|_, w| unsafe {
//             w
//             .func().bits(1) // FUNC1, pin configured as FC7_RXD_SDA_MOSI_DATA
//             .mode().inactive() // MODE_INACT, no additional pin function
//             .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
//             .invert().disabled() // INV_DI, input function is not inverted
//             .digimode().digital() // DIGITAL_EN, enable digital fucntion
//             .od().normal() // OPENDRAIN_DI, open drain is disabled
//         });

//         Pin {
//             id: self.id,
//             state: Special {
//                 _function: FC7_RXD_SDA_MOSI_DATA,
//             },
//         }
//     }
// }

// impl<PIO: PinId> I2cSclPin<PIO, I2c0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> I2cSclPin<PIO, I2c7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> I2cSdaPin<PIO, I2c7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sSdaPin<PIO, I2s7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> I2sWsPin<PIO, I2s7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMisoPin<PIO, Spi7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiMosiPin<PIO, Spi7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel0Pin<PIO, Spi7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel1Pin<PIO, Spi7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> SpiSsel2Pin<PIO, Spi3> for Pin<PIO, Special<FC3_SSEL2>> {}
// impl<PIO: PinId> SpiSsel2Pin<PIO, Spi4> for Pin<PIO, Special<FC4_SSEL2>> {}
// impl<PIO: PinId> SpiSsel3Pin<PIO, Spi3> for Pin<PIO, Special<FC3_SSEL3>> {}
// impl<PIO: PinId> SpiSsel3Pin<PIO, Spi4> for Pin<PIO, Special<FC4_SSEL3>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartCtsPin<PIO, Usart7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRtsPin<PIO, Usart7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartRxPin<PIO, Usart7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart0> for Pin<PIO, Special<FC0_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart1> for Pin<PIO, Special<FC1_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart2> for Pin<PIO, Special<FC2_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart3> for Pin<PIO, Special<FC3_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart4> for Pin<PIO, Special<FC4_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart5> for Pin<PIO, Special<FC5_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart6> for Pin<PIO, Special<FC6_SCK>> {}
// impl<PIO: PinId> UsartSclkPin<PIO, Usart7> for Pin<PIO, Special<FC7_SCK>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
// impl<PIO: PinId> UsartTxPin<PIO, Usart7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
