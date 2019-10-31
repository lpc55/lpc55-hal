use crate::{
    raw,
    states::init_state,
    peripherals::syscon,
};

use crate::states::{
    // pin_function,
    // pin_state::Special,
    ClocksSupportFlexcommToken,
};
use crate::drivers::pins::{
    // Pin,
    PinId,
};

pub type Flexcomm = (
    Flexcomm0,
    Flexcomm1,
    Flexcomm2,
    Flexcomm3,
    Flexcomm4,
    Flexcomm5,
    Flexcomm6,
    Flexcomm7,
);

macro_rules! flexcomm {
    ($fc_hal:ident, $i2c_hal:ident, $i2s_hal:ident, $spi_hal:ident, $usart_hal:ident,
     $fc_pac:ident, $i2c_pac:ident, $i2s_pac:ident, $spi_pac:ident, $usart_pac:ident,
     $register_sel:ident
    ) => {
        pub struct $fc_hal<State = init_state::Unknown> {
            pub(crate) raw_fc: raw::$fc_pac,
            pub(crate) raw_i2c: raw::$i2c_pac,
            pub(crate) raw_i2s: raw::$i2s_pac,
            pub(crate) raw_spi: raw::$spi_pac,
            pub(crate) raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $i2c_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$i2c_pac,
            pub(crate) _raw_i2s: raw::$i2s_pac,
            pub(crate) _raw_spi: raw::$spi_pac,
            pub(crate) _raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $i2s_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            pub(crate) _raw_i2c: raw::$i2c_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$i2s_pac,
            pub(crate) _raw_spi: raw::$spi_pac,
            pub(crate) _raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $spi_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            pub(crate) _raw_i2c: raw::$i2c_pac,
            pub(crate) _raw_i2s: raw::$i2s_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$spi_pac,
            pub(crate) _raw_usart: raw::$usart_pac,
            pub _state: State,
        }

        pub struct $usart_hal<State = init_state::Enabled> {
            pub(crate) _raw_fc: raw::$fc_pac,
            pub(crate) _raw_i2c: raw::$i2c_pac,
            pub(crate) _raw_i2s: raw::$i2s_pac,
            pub(crate) _raw_spi: raw::$spi_pac,
            #[allow(dead_code)]
            pub(crate) raw: raw::$usart_pac,
            pub _state: State,
        }

        impl core::convert::From<(raw::$fc_pac, raw::$i2c_pac, raw::$i2s_pac, raw::$spi_pac, raw::$usart_pac)> for $fc_hal {
            fn from(raw: (raw::$fc_pac, raw::$i2c_pac, raw::$i2s_pac, raw::$spi_pac, raw::$usart_pac)) -> Self {
                $fc_hal::new(raw)
            }
        }

        impl $fc_hal {
            fn new(raw: (raw::$fc_pac, raw::$i2c_pac, raw::$i2s_pac, raw::$spi_pac, raw::$usart_pac)) -> Self {
                $fc_hal {
                    raw_fc: raw.0,
                    raw_i2c: raw.1,
                    raw_i2s: raw.2,
                    raw_spi: raw.3,
                    raw_usart: raw.4,
                    _state: init_state::Unknown,
                }
            }

            // pub unsafe fn steal() -> Self {
            //     // seems a little wastefule to steal the full peripherals but ok..
            //     Self::new(raw::Peripherals::steal().$pac_name)
            // }
        }

        impl<State> $fc_hal<State> {
            pub fn release(self) -> (raw::$fc_pac, raw::$i2c_pac, raw::$i2s_pac, raw::$spi_pac, raw::$usart_pac) {
                (self.raw_fc, self.raw_i2c, self.raw_i2s, self.raw_spi, self.raw_usart)
            }
        }

        impl $fc_hal {
            fn enabled(&mut self, syscon: &mut syscon::Syscon) {
                syscon.reset(&mut self.raw_fc);
                syscon.enable_clock(&mut self.raw_fc);
            }

            pub fn enabled_as_i2c(
                mut self,
                syscon: &mut syscon::Syscon,
                _clocks_token: &ClocksSupportFlexcommToken,
            ) -> $i2c_hal<init_state::Enabled> {

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
                    _raw_i2s: self.raw_i2s,
                    _raw_spi: self.raw_spi,
                    _raw_usart: self.raw_usart,
                    _state: init_state::Enabled(()),
                }
            }

            pub fn enabled_as_spi(
                mut self,
                syscon: &mut syscon::Syscon,
                _clocks_token: &ClocksSupportFlexcommToken,
            ) -> $spi_hal<init_state::Enabled> {

                // The FRG output frequency must not be higher than 48 MHz for SPI and I2S
                // and not higher than 44 MHz for USART and I2C.
                //
                // Currently, we just use the 12MHz clock

                syscon.raw.$register_sel().modify(|_, w| w.sel().enum_0x2()); // Fro12MHz

                self.enabled(syscon);

                self.raw_fc.pselid.modify(|_, w| w
                    // select SPI function on corresponding FLEXCOMM
                    .persel().spi()
                    // lock it
                    .lock().locked()
                );
                assert!(self.raw_fc.pselid.read().spipresent().is_present());

                $spi_hal {
                    _raw_fc: self.raw_fc,
                    _raw_i2c: self.raw_i2c,
                    _raw_i2s: self.raw_i2s,
                    raw: self.raw_spi,
                    _raw_usart: self.raw_usart,
                    _state: init_state::Enabled(()),
                }
            }

            pub fn enabled_as_usart(
                mut self,
                syscon: &mut syscon::Syscon,
                _clocks_token: &ClocksSupportFlexcommToken,
            ) -> $usart_hal<init_state::Enabled> {

                // The FRG output frequency must not be higher than 48 MHz for SPI and I2S
                // and not higher than 44 MHz for USART and I2C.
                //
                // Currently, we just use the 12MHz clock

                syscon.raw.$register_sel().modify(|_, w| w.sel().enum_0x2()); // Fro12MHz

                self.enabled(syscon);

                self.raw_fc.pselid.modify(|_, w| w
                    // select USART function on corresponding FLEXCOMM
                    .persel().usart()
                    // lock it
                    .lock().locked()
                );
                assert!(self.raw_fc.pselid.read().usartpresent().is_present());

                $usart_hal {
                    _raw_fc: self.raw_fc,
                    _raw_i2c: self.raw_i2c,
                    _raw_i2s: self.raw_i2s,
                    _raw_spi: self.raw_spi,
                    raw: self.raw_usart,
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

flexcomm!(Flexcomm0, I2c0, I2s0, Spi0, Usart0, FLEXCOMM0, I2C0, I2S0, SPI0, USART0, fcclksel0);
flexcomm!(Flexcomm1, I2c1, I2s1, Spi1, Usart1, FLEXCOMM1, I2C1, I2S1, SPI1, USART1, fcclksel1);
flexcomm!(Flexcomm2, I2c2, I2s2, Spi2, Usart2, FLEXCOMM2, I2C2, I2S2, SPI2, USART2, fcclksel2);
flexcomm!(Flexcomm3, I2c3, I2s3, Spi3, Usart3, FLEXCOMM3, I2C3, I2S3, SPI3, USART3, fcclksel3);
flexcomm!(Flexcomm4, I2c4, I2s4, Spi4, Usart4, FLEXCOMM4, I2C4, I2S4, SPI4, USART4, fcclksel4);
flexcomm!(Flexcomm5, I2c5, I2s5, Spi5, Usart5, FLEXCOMM5, I2C5, I2S5, SPI5, USART5, fcclksel5);
flexcomm!(Flexcomm6, I2c6, I2s6, Spi6, Usart6, FLEXCOMM6, I2C6, I2S6, SPI6, USART6, fcclksel6);
flexcomm!(Flexcomm7, I2c7, I2s7, Spi7, Usart7, FLEXCOMM7, I2C7, I2S7, SPI7, USART7, fcclksel7);


pub trait I2c {}

impl I2c for I2c0 {}
impl I2c for I2c1 {}
impl I2c for I2c2 {}
impl I2c for I2c3 {}
impl I2c for I2c4 {}
impl I2c for I2c5 {}
impl I2c for I2c6 {}
impl I2c for I2c7 {}

pub trait I2s {}

impl I2s for I2s0 {}
impl I2s for I2s1 {}
impl I2s for I2s2 {}
impl I2s for I2s3 {}
impl I2s for I2s4 {}
impl I2s for I2s5 {}
impl I2s for I2s6 {}
impl I2s for I2s7 {}

pub trait Spi {}

impl Spi for Spi0 {}
impl Spi for Spi1 {}
impl Spi for Spi2 {}
impl Spi for Spi3 {}
impl Spi for Spi4 {}
impl Spi for Spi5 {}
impl Spi for Spi6 {}
impl Spi for Spi7 {}

pub trait Usart {}

impl Usart for Usart0 {}
impl Usart for Usart1 {}
impl Usart for Usart2 {}
impl Usart for Usart3 {}
impl Usart for Usart4 {}
impl Usart for Usart5 {}
impl Usart for Usart6 {}
impl Usart for Usart7 {}

/// I2C serial clock
pub trait I2cSclPin<PIO, I2C> where PIO: PinId, I2C: I2c {}
/// I2C serial data
pub trait I2cSdaPin<PIO, I2C> where PIO: PinId, I2C: I2c {}

/// I2S serial clock
pub trait I2sSckPin<PIO, I2S> where PIO: PinId, I2S: I2s {}
/// I2S word select
pub trait I2sWsPin<PIO, I2S> where PIO: PinId, I2S: I2s {}
/// I2S serial data
pub trait I2sSdaPin<PIO, I2S> where PIO: PinId, I2S: I2s {}
/// I2S master clock
pub trait I2sMclkPin<PIO, I2S> where PIO: PinId, I2S: I2s {}

/// SPI serial clock
pub trait SpiSckPin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI master-out/slave-in data
pub trait SpiMosiPin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI master-in/slave-sout data
pub trait SpiMisoPin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI slave select 0
pub trait SpiSsel0Pin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI slave select 1
pub trait SpiSsel1Pin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI slave select 2
pub trait SpiSsel2Pin<PIO, SPI> where PIO: PinId, SPI: Spi {}
/// SPI slave select 3
pub trait SpiSsel3Pin<PIO, SPI> where PIO: PinId, SPI: Spi {}

/// USART transmitter output
pub trait UsartTxPin<PIO, USART> where PIO: PinId, USART: Usart {}
/// USART receiver input
pub trait UsartRxPin<PIO, USART> where PIO: PinId, USART: Usart {}
/// USART request-to-send output
pub trait UsartRtsPin<PIO, USART> where PIO: PinId, USART: Usart {}
/// USART clear-to-send input
pub trait UsartCtsPin<PIO, USART> where PIO: PinId, USART: Usart {}
/// USART serial clock
pub trait UsartSclkPin<PIO, USART> where PIO: PinId, USART: Usart {}

use crate::drivers::pins::types::PinType;
pub struct NoPio;
impl PinId for NoPio {
    const PORT: usize = !0;
    const NUMBER: u8 = !0;
    const MASK: u32 = !0;

    const TYPE: PinType = PinType::D;
}

// TODO: revisit this. Instead of passing in fake pins,
// write proper drivers for the use cases.
// Think about using a generic enum {Read, Write, ReadWrite}
// parameter
/// Filler type for when no Tx is necessary
pub struct NoTx;
/// Filler type for when no Rx is necessary
pub struct NoRx;
impl<USART: Usart> UsartTxPin<NoPio, USART> for NoTx {}
impl<USART: Usart> UsartRxPin<NoPio, USART> for NoRx {}


pub trait I2cPins<PIO1: PinId, PIO2: PinId, I2C: I2c> {}

impl<PIO1, PIO2, I2C, SCL, SDA> I2cPins<PIO1, PIO2, I2C> for (SCL, SDA)
where
    PIO1: PinId,
    PIO2: PinId,
    I2C: I2c,
    SCL: I2cSclPin<PIO1, I2C>,
    SDA: I2cSdaPin<PIO2, I2C>,
{}


pub trait SpiPins<PIO1: PinId, PIO2: PinId, PIO3: PinId, SPI: Spi> {}

impl<PIO1, PIO2, PIO3, SPI, SCK, MISO, MOSI> SpiPins<PIO1, PIO2, PIO3, SPI> for (SCK, MOSI, MISO)
where
    PIO1: PinId,
    PIO2: PinId,
    PIO3: PinId,
    SPI: Spi,
    SCK: SpiSckPin<PIO1, SPI>,
    MOSI: SpiMosiPin<PIO3, SPI>,
    MISO: SpiMisoPin<PIO2, SPI>,
{}

pub trait UsartPins<PIO1: PinId, PIO2: PinId, USART: Usart> {}

impl<PIO1, PIO2, USART, TX, RX> UsartPins<PIO1, PIO2, USART> for (TX, RX)
where
    PIO1: PinId,
    PIO2: PinId,
    USART: Usart,
    TX: UsartTxPin<PIO1, USART>,
    RX: UsartRxPin<PIO2, USART>,
{}

// Note: Pio0_12 can be both: into_i2c_3_scl_pin() and into_i2c_6_scl_pin() [alt1 vs alt7]
//
// pin.into_I2C3_SCL_pin()
//
// what about: let scl_pin: <_, Special<I2c4, Scl>> = pins.pio1_20.into();
// what about: let scl_pin = Pin<Pio1_20, Special<I2c4, Scl>>::from(pins.pio1_20);
//
// what about... `I2cMaster(i2c, (p0_12.into(), p1_1.into()))` <-- too much magic/work in `From`?

