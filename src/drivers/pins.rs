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

// impl<T> Pin<T, pin_state::Unused>
// where
//     T: PinId,
// {
//     /// Transition pin to GPIO state
//     pub fn into_gpio_pin(
//         self,
//         _: &mut Gpio<init_state::Enabled>,
//     ) -> Pin<T, pin_state::Gpio<direction::Unknown>> {
//         // TODO: need to set FUNC to 0 at minimum
//         // --> iocon.raw.piox_y.... <-- needs a macro
//         Pin {
//             id: self.id,
//             state: pin_state::Gpio {
//                 dirset: crate::reg_proxy::RegClusterProxy::new(),
//                 pin: crate::reg_proxy::RegClusterProxy::new(),
//                 set: crate::reg_proxy::RegClusterProxy::new(),
//                 clr: crate::reg_proxy::RegClusterProxy::new(),

//                 _direction: direction::Unknown,
//             },
//         }
//     }
// }

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
                pub fn into_gpio_pin(
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

// Below is generated using `scripts/extract-flexcomm-data.py`
// There are some "duplicates" for Pio0_13 and Pio0_14

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
    pio0_11, Pio0_11, 0, 11, PinType::A, pin_state::Special<pin_function::SWCLK>, pin_state::Special{ _function: pin_function::SWCLK {} };
    pio0_12, Pio0_12, 0, 12, PinType::A, pin_state::Special<pin_function::SWDIO>, pin_state::Special{ _function: pin_function::SWDIO {} };
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
    )*)+)*
    }
}

// all that follows is generated with `generate-flexcomm-pin-driver.py`
// NB: Pio0_13 and Pio0_14 have a repetition of methods, manually commented out

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
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_2, pio0_2): {
        (1, FC3_TXD_SCL_MISO_WS): [
            (into_usart3_tx_pin, Usart3, UsartTxPin),
            (into_i2c3_scl_pin, I2c3, I2cSclPin),
            (into_spi3_miso_pin, Spi3, SpiMisoPin),
            (into_i2s3_ws_pin, I2s3, I2sWsPin),
        ]
    }
    (Pio0_3, pio0_3): {
        (1, FC3_RXD_SDA_MOSI_DATA): [
            (into_usart3_rx_pin, Usart3, UsartRxPin),
            (into_i2c3_sda_pin, I2c3, I2cSdaPin),
            (into_spi3_mosi_pin, Spi3, SpiMosiPin),
            (into_i2s3_sda_pin, I2s3, I2sSdaPin),
        ]
    }
    (Pio0_4, pio0_4): {
        (2, FC4_SCK): [
            (into_usart4_sclk_pin, Usart4, UsartSclkPin),
        ]
    }
    (Pio0_5, pio0_5): {
        (2, FC4_RXD_SDA_MOSI_DATA): [
            (into_usart4_rx_pin, Usart4, UsartRxPin),
            (into_i2c4_sda_pin, I2c4, I2cSdaPin),
            (into_spi4_mosi_pin, Spi4, SpiMosiPin),
            (into_i2s4_sda_pin, I2s4, I2sSdaPin),
        ]
    }
    (Pio0_5, pio0_5): {
        (8, FC3_RTS_SCL_SSEL1): [
            (into_usart3_rts_pin, Usart3, UsartRtsPin),
            (into_i2c3_scl_pin, I2c3, I2cSclPin),
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_6, pio0_6): {
        (1, FC3_SCK): [
            (into_usart3_sclk_pin, Usart3, UsartSclkPin),
        ]
    }
    (Pio0_7, pio0_7): {
        (1, FC3_RTS_SCL_SSEL1): [
            (into_usart3_rts_pin, Usart3, UsartRtsPin),
            (into_i2c3_scl_pin, I2c3, I2cSclPin),
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_7, pio0_7): {
        (3, FC5_SCK): [
            (into_usart5_sclk_pin, Usart5, UsartSclkPin),
        ]
    }
    (Pio0_7, pio0_7): {
        (4, FC1_SCK): [
            (into_usart1_sclk_pin, Usart1, UsartSclkPin),
        ]
    }
    (Pio0_8, pio0_8): {
        (1, FC3_SSEL3): [
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_8, pio0_8): {
        (3, FC5_RXD_SDA_MOSI_DATA): [
            (into_usart5_rx_pin, Usart5, UsartRxPin),
            (into_i2c5_sda_pin, I2c5, I2cSdaPin),
            (into_spi5_mosi_pin, Spi5, SpiMosiPin),
            (into_i2s5_sda_pin, I2s5, I2sSdaPin),
        ]
    }
    (Pio0_9, pio0_9): {
        (1, FC3_SSEL2): [
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_9, pio0_9): {
        (3, FC5_TXD_SCL_MISO_WS): [
            (into_usart5_tx_pin, Usart5, UsartTxPin),
            (into_i2c5_scl_pin, I2c5, I2cSclPin),
            (into_spi5_miso_pin, Spi5, SpiMisoPin),
            (into_i2s5_ws_pin, I2s5, I2sWsPin),
        ]
    }
    (Pio0_10, pio0_10): {
        (1, FC6_SCK): [
            (into_usart6_sclk_pin, Usart6, UsartSclkPin),
        ]
    }
    (Pio0_10, pio0_10): {
        (4, FC1_TXD_SCL_MISO_WS): [
            (into_usart1_tx_pin, Usart1, UsartTxPin),
            (into_i2c1_scl_pin, I2c1, I2cSclPin),
            (into_spi1_miso_pin, Spi1, SpiMisoPin),
            (into_i2s1_ws_pin, I2s1, I2sWsPin),
        ]
    }
    (Pio0_11, pio0_11): {
        (1, FC6_RXD_SDA_MOSI_DATA): [
            (into_usart6_rx_pin, Usart6, UsartRxPin),
            (into_i2c6_sda_pin, I2c6, I2cSdaPin),
            (into_spi6_mosi_pin, Spi6, SpiMosiPin),
            (into_i2s6_sda_pin, I2s6, I2sSdaPin),
        ]
    }
    (Pio0_12, pio0_12): {
        (1, FC3_TXD_SCL_MISO_WS): [
            (into_usart3_tx_pin, Usart3, UsartTxPin),
            (into_i2c3_scl_pin, I2c3, I2cSclPin),
            (into_spi3_miso_pin, Spi3, SpiMisoPin),
            (into_i2s3_ws_pin, I2s3, I2sWsPin),
        ]
    }
    (Pio0_12, pio0_12): {
        (7, FC6_TXD_SCL_MISO_WS): [
            (into_usart6_tx_pin, Usart6, UsartTxPin),
            (into_i2c6_scl_pin, I2c6, I2cSclPin),
            (into_spi6_miso_pin, Spi6, SpiMisoPin),
            (into_i2s6_ws_pin, I2s6, I2sWsPin),
        ]
    }
    (Pio0_13, pio0_13): {
        (1, FC1_CTS_SDA_SSEL0): [
            (into_usart1_cts_pin, Usart1, UsartCtsPin),
            (into_i2c1_sda_pin, I2c1, I2cSdaPin),
            (into_spi1_ssel_pin, Spi1, SpiSselPin),
        ]
    }
    (Pio0_13, pio0_13): {
        (5, FC1_RXD_SDA_MOSI_DATA): [
            (into_usart1_rx_pin, Usart1, UsartRxPin),
            // (into_i2c1_sda_pin, I2c1, I2cSdaPin),
            (into_spi1_mosi_pin, Spi1, SpiMosiPin),
            (into_i2s1_sda_pin, I2s1, I2sSdaPin),
        ]
    }
    (Pio0_14, pio0_14): {
        (1, FC1_RTS_SCL_SSEL1): [
            (into_usart1_rts_pin, Usart1, UsartRtsPin),
            (into_i2c1_scl_pin, I2c1, I2cSclPin),
            (into_spi1_ssel_pin, Spi1, SpiSselPin),
        ]
    }
    (Pio0_14, pio0_14): {
        (6, FC1_TXD_SCL_MISO_WS): [
            (into_usart1_tx_pin, Usart1, UsartTxPin),
            // (into_i2c1_scl_pin, I2c1, I2cSclPin),
            (into_spi1_miso_pin, Spi1, SpiMisoPin),
            (into_i2s1_ws_pin, I2s1, I2sWsPin),
        ]
    }
    (Pio0_15, pio0_15): {
        (1, FC6_CTS_SDA_SSEL0): [
            (into_usart6_cts_pin, Usart6, UsartCtsPin),
            (into_i2c6_sda_pin, I2c6, I2cSdaPin),
            (into_spi6_ssel_pin, Spi6, SpiSselPin),
        ]
    }
    (Pio0_16, pio0_16): {
        (1, FC4_TXD_SCL_MISO_WS): [
            (into_usart4_tx_pin, Usart4, UsartTxPin),
            (into_i2c4_scl_pin, I2c4, I2cSclPin),
            (into_spi4_miso_pin, Spi4, SpiMisoPin),
            (into_i2s4_ws_pin, I2s4, I2sWsPin),
        ]
    }
    (Pio0_17, pio0_17): {
        (1, FC4_SSEL2): [
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio0_18, pio0_18): {
        (1, FC4_CTS_SDA_SSEL0): [
            (into_usart4_cts_pin, Usart4, UsartCtsPin),
            (into_i2c4_sda_pin, I2c4, I2cSdaPin),
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio0_19, pio0_19): {
        (1, FC4_RTS_SCL_SSEL1): [
            (into_usart4_rts_pin, Usart4, UsartRtsPin),
            (into_i2c4_scl_pin, I2c4, I2cSclPin),
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio0_19, pio0_19): {
        (7, FC7_TXD_SCL_MISO_WS): [
            (into_usart7_tx_pin, Usart7, UsartTxPin),
            (into_i2c7_scl_pin, I2c7, I2cSclPin),
            (into_spi7_miso_pin, Spi7, SpiMisoPin),
            (into_i2s7_ws_pin, I2s7, I2sWsPin),
        ]
    }
    (Pio0_20, pio0_20): {
        (1, FC3_CTS_SDA_SSEL0): [
            (into_usart3_cts_pin, Usart3, UsartCtsPin),
            (into_i2c3_sda_pin, I2c3, I2cSdaPin),
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_20, pio0_20): {
        (7, FC7_RXD_SDA_MOSI_DATA): [
            (into_usart7_rx_pin, Usart7, UsartRxPin),
            (into_i2c7_sda_pin, I2c7, I2cSdaPin),
            (into_spi7_mosi_pin, Spi7, SpiMosiPin),
            (into_i2s7_sda_pin, I2s7, I2sSdaPin),
        ]
    }
    (Pio0_20, pio0_20): {
        (8, HS_SPI_SSEL0): [
            (into_spi8_ssel_pin, Spi8, SpiSselPin),
        ]
    }
    (Pio0_21, pio0_21): {
        (1, FC3_RTS_SCL_SSEL1): [
            (into_usart3_rts_pin, Usart3, UsartRtsPin),
            (into_i2c3_scl_pin, I2c3, I2cSclPin),
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio0_21, pio0_21): {
        (7, FC7_SCK): [
            (into_usart7_sclk_pin, Usart7, UsartSclkPin),
        ]
    }
    (Pio0_22, pio0_22): {
        (1, FC6_TXD_SCL_MISO_WS): [
            (into_usart6_tx_pin, Usart6, UsartTxPin),
            (into_i2c6_scl_pin, I2c6, I2cSclPin),
            (into_spi6_miso_pin, Spi6, SpiMisoPin),
            (into_i2s6_ws_pin, I2s6, I2sWsPin),
        ]
    }
    (Pio0_23, pio0_23): {
        (5, FC0_CTS_SDA_SSEL0): [
            (into_usart0_cts_pin, Usart0, UsartCtsPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_ssel_pin, Spi0, SpiSselPin),
        ]
    }
    (Pio0_24, pio0_24): {
        (1, FC0_RXD_SDA_MOSI_DATA): [
            (into_usart0_rx_pin, Usart0, UsartRxPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_mosi_pin, Spi0, SpiMosiPin),
            (into_i2s0_sda_pin, I2s0, I2sSdaPin),
        ]
    }
    (Pio0_25, pio0_25): {
        (1, FC0_TXD_SCL_MISO_WS): [
            (into_usart0_tx_pin, Usart0, UsartTxPin),
            (into_i2c0_scl_pin, I2c0, I2cSclPin),
            (into_spi0_miso_pin, Spi0, SpiMisoPin),
            (into_i2s0_ws_pin, I2s0, I2sWsPin),
        ]
    }
    (Pio0_26, pio0_26): {
        (1, FC2_RXD_SDA_MOSI_DATA): [
            (into_usart2_rx_pin, Usart2, UsartRxPin),
            (into_i2c2_sda_pin, I2c2, I2cSdaPin),
            (into_spi2_mosi_pin, Spi2, SpiMosiPin),
            (into_i2s2_sda_pin, I2s2, I2sSdaPin),
        ]
    }
    (Pio0_26, pio0_26): {
        (8, FC0_SCK): [
            (into_usart0_sclk_pin, Usart0, UsartSclkPin),
        ]
    }
    (Pio0_26, pio0_26): {
        (9, HS_SPI_MOSI): [
            (into_spi8_mosi_pin, Spi8, SpiMosiPin),
        ]
    }
    (Pio0_27, pio0_27): {
        (1, FC2_TXD_SCL_MISO_WS): [
            (into_usart2_tx_pin, Usart2, UsartTxPin),
            (into_i2c2_scl_pin, I2c2, I2cSclPin),
            (into_spi2_miso_pin, Spi2, SpiMisoPin),
            (into_i2s2_ws_pin, I2s2, I2sWsPin),
        ]
    }
    (Pio0_27, pio0_27): {
        (7, FC7_RXD_SDA_MOSI_DATA): [
            (into_usart7_rx_pin, Usart7, UsartRxPin),
            (into_i2c7_sda_pin, I2c7, I2cSdaPin),
            (into_spi7_mosi_pin, Spi7, SpiMosiPin),
            (into_i2s7_sda_pin, I2s7, I2sSdaPin),
        ]
    }
    (Pio0_28, pio0_28): {
        (1, FC0_SCK): [
            (into_usart0_sclk_pin, Usart0, UsartSclkPin),
        ]
    }
    (Pio0_29, pio0_29): {
        (1, FC0_RXD_SDA_MOSI_DATA): [
            (into_usart0_rx_pin, Usart0, UsartRxPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_mosi_pin, Spi0, SpiMosiPin),
            (into_i2s0_sda_pin, I2s0, I2sSdaPin),
        ]
    }
    (Pio0_30, pio0_30): {
        (1, FC0_TXD_SCL_MISO_WS): [
            (into_usart0_tx_pin, Usart0, UsartTxPin),
            (into_i2c0_scl_pin, I2c0, I2cSclPin),
            (into_spi0_miso_pin, Spi0, SpiMisoPin),
            (into_i2s0_ws_pin, I2s0, I2sWsPin),
        ]
    }
    (Pio0_31, pio0_31): {
        (1, FC0_CTS_SDA_SSEL0): [
            (into_usart0_cts_pin, Usart0, UsartCtsPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_ssel_pin, Spi0, SpiSselPin),
        ]
    }
    (Pio1_0, pio1_0): {
        (1, FC0_RTS_SCL_SSEL1): [
            (into_usart0_rts_pin, Usart0, UsartRtsPin),
            (into_i2c0_scl_pin, I2c0, I2cSclPin),
            (into_spi0_ssel_pin, Spi0, SpiSselPin),
        ]
    }
    (Pio1_1, pio1_1): {
        (1, FC3_RXD_SDA_MOSI_DATA): [
            (into_usart3_rx_pin, Usart3, UsartRxPin),
            (into_i2c3_sda_pin, I2c3, I2cSdaPin),
            (into_spi3_mosi_pin, Spi3, SpiMosiPin),
            (into_i2s3_sda_pin, I2s3, I2sSdaPin),
        ]
    }
    (Pio1_1, pio1_1): {
        (5, HS_SPI_SSEL1): [
            (into_spi8_ssel_pin, Spi8, SpiSselPin),
        ]
    }
    (Pio1_2, pio1_2): {
        (6, HS_SPI_SCK): [
            (into_spi8_sck_pin, Spi8, SpiSckPin),
        ]
    }
    (Pio1_3, pio1_3): {
        (6, HS_SPI_MISO): [
            (into_spi8_miso_pin, Spi8, SpiMisoPin),
        ]
    }
    (Pio1_4, pio1_4): {
        (1, FC0_SCK): [
            (into_usart0_sclk_pin, Usart0, UsartSclkPin),
        ]
    }
    (Pio1_5, pio1_5): {
        (1, FC0_RXD_SDA_MOSI_DATA): [
            (into_usart0_rx_pin, Usart0, UsartRxPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_mosi_pin, Spi0, SpiMosiPin),
            (into_i2s0_sda_pin, I2s0, I2sSdaPin),
        ]
    }
    (Pio1_6, pio1_6): {
        (1, FC0_TXD_SCL_MISO_WS): [
            (into_usart0_tx_pin, Usart0, UsartTxPin),
            (into_i2c0_scl_pin, I2c0, I2cSclPin),
            (into_spi0_miso_pin, Spi0, SpiMisoPin),
            (into_i2s0_ws_pin, I2s0, I2sWsPin),
        ]
    }
    (Pio1_7, pio1_7): {
        (1, FC0_RTS_SCL_SSEL1): [
            (into_usart0_rts_pin, Usart0, UsartRtsPin),
            (into_i2c0_scl_pin, I2c0, I2cSclPin),
            (into_spi0_ssel_pin, Spi0, SpiSselPin),
        ]
    }
    (Pio1_8, pio1_8): {
        (1, FC0_CTS_SDA_SSEL0): [
            (into_usart0_cts_pin, Usart0, UsartCtsPin),
            (into_i2c0_sda_pin, I2c0, I2cSdaPin),
            (into_spi0_ssel_pin, Spi0, SpiSselPin),
        ]
    }
    (Pio1_8, pio1_8): {
        (5, FC4_SSEL2): [
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio1_9, pio1_9): {
        (2, FC1_SCK): [
            (into_usart1_sclk_pin, Usart1, UsartSclkPin),
        ]
    }
    (Pio1_9, pio1_9): {
        (5, FC4_CTS_SDA_SSEL0): [
            (into_usart4_cts_pin, Usart4, UsartCtsPin),
            (into_i2c4_sda_pin, I2c4, I2cSdaPin),
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio1_10, pio1_10): {
        (2, FC1_RXD_SDA_MOSI_DATA): [
            (into_usart1_rx_pin, Usart1, UsartRxPin),
            (into_i2c1_sda_pin, I2c1, I2cSdaPin),
            (into_spi1_mosi_pin, Spi1, SpiMosiPin),
            (into_i2s1_sda_pin, I2s1, I2sSdaPin),
        ]
    }
    (Pio1_11, pio1_11): {
        (2, FC1_TXD_SCL_MISO_WS): [
            (into_usart1_tx_pin, Usart1, UsartTxPin),
            (into_i2c1_scl_pin, I2c1, I2cSclPin),
            (into_spi1_miso_pin, Spi1, SpiMisoPin),
            (into_i2s1_ws_pin, I2s1, I2sWsPin),
        ]
    }
    (Pio1_12, pio1_12): {
        (2, FC6_SCK): [
            (into_usart6_sclk_pin, Usart6, UsartSclkPin),
        ]
    }
    (Pio1_12, pio1_12): {
        (5, HS_SPI_SSEL2): [
            (into_spi8_ssel_pin, Spi8, SpiSselPin),
        ]
    }
    (Pio1_13, pio1_13): {
        (2, FC6_RXD_SDA_MOSI_DATA): [
            (into_usart6_rx_pin, Usart6, UsartRxPin),
            (into_i2c6_sda_pin, I2c6, I2cSdaPin),
            (into_spi6_mosi_pin, Spi6, SpiMosiPin),
            (into_i2s6_sda_pin, I2s6, I2sSdaPin),
        ]
    }
    (Pio1_14, pio1_14): {
        (4, FC5_CTS_SDA_SSEL0): [
            (into_usart5_cts_pin, Usart5, UsartCtsPin),
            (into_i2c5_sda_pin, I2c5, I2cSdaPin),
            (into_spi5_ssel_pin, Spi5, SpiSselPin),
        ]
    }
    (Pio1_15, pio1_15): {
        (4, FC5_RTS_SCL_SSEL1): [
            (into_usart5_rts_pin, Usart5, UsartRtsPin),
            (into_i2c5_scl_pin, I2c5, I2cSclPin),
            (into_spi5_ssel_pin, Spi5, SpiSselPin),
        ]
    }
    (Pio1_15, pio1_15): {
        (5, FC4_RTS_SCL_SSEL1): [
            (into_usart4_rts_pin, Usart4, UsartRtsPin),
            (into_i2c4_scl_pin, I2c4, I2cSclPin),
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio1_16, pio1_16): {
        (2, FC6_TXD_SCL_MISO_WS): [
            (into_usart6_tx_pin, Usart6, UsartTxPin),
            (into_i2c6_scl_pin, I2c6, I2cSclPin),
            (into_spi6_miso_pin, Spi6, SpiMisoPin),
            (into_i2s6_ws_pin, I2s6, I2sWsPin),
        ]
    }
    (Pio1_17, pio1_17): {
        (3, FC6_RTS_SCL_SSEL1): [
            (into_usart6_rts_pin, Usart6, UsartRtsPin),
            (into_i2c6_scl_pin, I2c6, I2cSclPin),
            (into_spi6_ssel_pin, Spi6, SpiSselPin),
        ]
    }
    (Pio1_19, pio1_19): {
        (5, FC4_SCK): [
            (into_usart4_sclk_pin, Usart4, UsartSclkPin),
        ]
    }
    (Pio1_20, pio1_20): {
        (1, FC7_RTS_SCL_SSEL1): [
            (into_usart7_rts_pin, Usart7, UsartRtsPin),
            (into_i2c7_scl_pin, I2c7, I2cSclPin),
            (into_spi7_ssel_pin, Spi7, SpiSselPin),
        ]
    }
    (Pio1_20, pio1_20): {
        (5, FC4_TXD_SCL_MISO_WS): [
            (into_usart4_tx_pin, Usart4, UsartTxPin),
            (into_i2c4_scl_pin, I2c4, I2cSclPin),
            (into_spi4_miso_pin, Spi4, SpiMisoPin),
            (into_i2s4_ws_pin, I2s4, I2sWsPin),
        ]
    }
    (Pio1_21, pio1_21): {
        (1, FC7_CTS_SDA_SSEL0): [
            (into_usart7_cts_pin, Usart7, UsartCtsPin),
            (into_i2c7_sda_pin, I2c7, I2cSdaPin),
            (into_spi7_ssel_pin, Spi7, SpiSselPin),
        ]
    }
    (Pio1_21, pio1_21): {
        (5, FC4_RXD_SDA_MOSI_DATA): [
            (into_usart4_rx_pin, Usart4, UsartRxPin),
            (into_i2c4_sda_pin, I2c4, I2cSdaPin),
            (into_spi4_mosi_pin, Spi4, SpiMosiPin),
            (into_i2s4_sda_pin, I2s4, I2sSdaPin),
        ]
    }
    (Pio1_22, pio1_22): {
        (5, FC4_SSEL3): [
            (into_spi4_ssel_pin, Spi4, SpiSselPin),
        ]
    }
    (Pio1_23, pio1_23): {
        (1, FC2_SCK): [
            (into_usart2_sclk_pin, Usart2, UsartSclkPin),
        ]
    }
    (Pio1_23, pio1_23): {
        (5, FC3_SSEL2): [
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio1_24, pio1_24): {
        (1, FC2_RXD_SDA_MOSI_DATA): [
            (into_usart2_rx_pin, Usart2, UsartRxPin),
            (into_i2c2_sda_pin, I2c2, I2cSdaPin),
            (into_spi2_mosi_pin, Spi2, SpiMosiPin),
            (into_i2s2_sda_pin, I2s2, I2sSdaPin),
        ]
    }
    (Pio1_24, pio1_24): {
        (5, FC3_SSEL3): [
            (into_spi3_ssel_pin, Spi3, SpiSselPin),
        ]
    }
    (Pio1_25, pio1_25): {
        (1, FC2_TXD_SCL_MISO_WS): [
            (into_usart2_tx_pin, Usart2, UsartTxPin),
            (into_i2c2_scl_pin, I2c2, I2cSclPin),
            (into_spi2_miso_pin, Spi2, SpiMisoPin),
            (into_i2s2_ws_pin, I2s2, I2sWsPin),
        ]
    }
    (Pio1_26, pio1_26): {
        (1, FC2_CTS_SDA_SSEL0): [
            (into_usart2_cts_pin, Usart2, UsartCtsPin),
            (into_i2c2_sda_pin, I2c2, I2cSdaPin),
            (into_spi2_ssel_pin, Spi2, SpiSselPin),
        ]
    }
    (Pio1_26, pio1_26): {
        (5, HS_SPI_SSEL3): [
            (into_spi8_ssel_pin, Spi8, SpiSselPin),
        ]
    }
    (Pio1_27, pio1_27): {
        (1, FC2_RTS_SCL_SSEL1): [
            (into_usart2_rts_pin, Usart2, UsartRtsPin),
            (into_i2c2_scl_pin, I2c2, I2cSclPin),
            (into_spi2_ssel_pin, Spi2, SpiSselPin),
        ]
    }
    (Pio1_28, pio1_28): {
        (1, FC7_SCK): [
            (into_usart7_sclk_pin, Usart7, UsartSclkPin),
        ]
    }
    (Pio1_29, pio1_29): {
        (1, FC7_RXD_SDA_MOSI_DATA): [
            (into_usart7_rx_pin, Usart7, UsartRxPin),
            (into_i2c7_sda_pin, I2c7, I2cSdaPin),
            (into_spi7_mosi_pin, Spi7, SpiMosiPin),
            (into_i2s7_sda_pin, I2s7, I2sSdaPin),
        ]
    }
    (Pio1_30, pio1_30): {
        (1, FC7_TXD_SCL_MISO_WS): [
            (into_usart7_tx_pin, Usart7, UsartTxPin),
            (into_i2c7_scl_pin, I2c7, I2cSclPin),
            (into_spi7_miso_pin, Spi7, SpiMisoPin),
            (into_i2s7_ws_pin, I2s7, I2sWsPin),
        ]
    }
}

impl<PIO: PinId> I2cSclPin<PIO, I2c0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> I2cSclPin<PIO, I2c7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> I2cSdaPin<PIO, I2c7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sSdaPin<PIO, I2s7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> I2sWsPin<PIO, I2s7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> SpiMisoPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_MISO>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> SpiMosiPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_MOSI>> {}
impl<PIO: PinId> SpiSckPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_SCK>> {}
impl<PIO: PinId> SpiSselPin<PIO, Spi0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi3> for Pin<PIO, Special<FC3_SSEL2>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave2;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi3> for Pin<PIO, Special<FC3_SSEL3>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave3;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi4> for Pin<PIO, Special<FC4_SSEL2>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave2;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi4> for Pin<PIO, Special<FC4_SSEL3>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave3;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_SSEL0>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave0;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_SSEL1>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave1;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_SSEL2>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave2;
}
impl<PIO: PinId> SpiSselPin<PIO, Spi8> for Pin<PIO, Special<HS_SPI_SSEL3>> {
    const SSEL: SlaveSelect = SlaveSelect::Slave3;
}
impl<PIO: PinId> UsartCtsPin<PIO, Usart0> for Pin<PIO, Special<FC0_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart1> for Pin<PIO, Special<FC1_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart2> for Pin<PIO, Special<FC2_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart3> for Pin<PIO, Special<FC3_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart4> for Pin<PIO, Special<FC4_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart5> for Pin<PIO, Special<FC5_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart6> for Pin<PIO, Special<FC6_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartCtsPin<PIO, Usart7> for Pin<PIO, Special<FC7_CTS_SDA_SSEL0>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart0> for Pin<PIO, Special<FC0_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart1> for Pin<PIO, Special<FC1_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart2> for Pin<PIO, Special<FC2_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart3> for Pin<PIO, Special<FC3_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart4> for Pin<PIO, Special<FC4_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart5> for Pin<PIO, Special<FC5_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart6> for Pin<PIO, Special<FC6_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRtsPin<PIO, Usart7> for Pin<PIO, Special<FC7_RTS_SCL_SSEL1>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart0> for Pin<PIO, Special<FC0_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart1> for Pin<PIO, Special<FC1_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart2> for Pin<PIO, Special<FC2_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart3> for Pin<PIO, Special<FC3_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart4> for Pin<PIO, Special<FC4_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart5> for Pin<PIO, Special<FC5_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart6> for Pin<PIO, Special<FC6_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartRxPin<PIO, Usart7> for Pin<PIO, Special<FC7_RXD_SDA_MOSI_DATA>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart0> for Pin<PIO, Special<FC0_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart1> for Pin<PIO, Special<FC1_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart2> for Pin<PIO, Special<FC2_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart3> for Pin<PIO, Special<FC3_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart4> for Pin<PIO, Special<FC4_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart5> for Pin<PIO, Special<FC5_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart6> for Pin<PIO, Special<FC6_SCK>> {}
impl<PIO: PinId> UsartSclkPin<PIO, Usart7> for Pin<PIO, Special<FC7_SCK>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart0> for Pin<PIO, Special<FC0_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart1> for Pin<PIO, Special<FC1_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart2> for Pin<PIO, Special<FC2_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart3> for Pin<PIO, Special<FC3_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart4> for Pin<PIO, Special<FC4_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart5> for Pin<PIO, Special<FC5_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart6> for Pin<PIO, Special<FC6_TXD_SCL_MISO_WS>> {}
impl<PIO: PinId> UsartTxPin<PIO, Usart7> for Pin<PIO, Special<FC7_TXD_SCL_MISO_WS>> {}
