use core::marker::PhantomData;
pub use crate::traits::wg::spi::{
    FullDuplex,
    Mode,
    Phase,
    Polarity,
};
use crate::{
    peripherals::{
        flexcomm::{
            // Trait marking SPI peripherals and pins
            Spi,
            SpiPins,
            SpiSselPin,
            SlaveSelect,

            // Actual Spi HAL peripherals
            Spi0,
            Spi1,
            Spi2,
            Spi3,
            Spi4,
            Spi5,
            Spi6,
            Spi7,
            Spi8,
        },
    },
    drivers::{
        clocks::Hertz,
        pins::{
            PinId,
        },
    }
};


/// SPI error
/// TODO: Use the actual ones from the chip
#[derive(Debug)]
pub enum Error {
    /// Overrun occurred
    Overrun,
    /// Mode fault occurred
    ModeFault,
    /// CRC error
    Crc,
    #[doc(hidden)]
    _Extensible,
}

/// SPI peripheral operating in master mode
pub struct SpiMaster<SCK, MOSI, MISO, SSEL, SPI, PINS, SSELPIN>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    SSEL: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, SSEL, SPI>,
    SSELPIN: SpiSselPin<SSEL, SPI>,
{
    spi: SPI,
    pins: PINS,
    _sck: PhantomData<SCK>,
    _mosi: PhantomData<MOSI>,
    _miso: PhantomData<MISO>,
    _ssel: PhantomData<SSEL>,
    _ssel_pin: PhantomData<SSELPIN>,
    ssel: SlaveSelect,
}

//
// TODO: How to encode the SSELi?
// - in the above setting, there is no SSEL
// - ideally, (in simple case), user would pass one SSELi pin
// - type would encode the `i`
//

macro_rules! impl_spi {
    ($SpiX:ident, $SpiMasterX:ident) => {

        /// hopefully, rustc's type inference will improve, and
        /// we can remove these types again
        pub type $SpiMasterX<A, B, C, D, E, F> = SpiMaster<A, B, C, D, $SpiX, E, F>;

        impl<SCK, MOSI, MISO, SSEL, PINS, SSELPIN> SpiMaster<SCK, MOSI, MISO, SSEL, $SpiX, PINS, SSELPIN>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            SSEL: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, SSEL, $SpiX>,
            SSELPIN: SpiSselPin<SSEL, $SpiX>,
        {
            pub fn new(spi: $SpiX, pins: PINS, mode: Mode, freq: Hertz) -> Self {
                while spi.raw.stat.read().mstidle().bit_is_clear() { continue; }

                // FIFO would be 8 entries of 16 bits; we don't use it
                spi.raw.fifocfg.modify(|_, w| w
                    .enabletx().disabled()
                    .enablerx().disabled()
                );
                spi.raw.cfg.modify(|_, w| w
                    .enable().disabled()
                    .master().master_mode()
                    .lsbf().standard() // MSB first
                    .cpha().bit(mode.phase == Phase::CaptureOnSecondTransition)
                    .cpol().bit(mode.polarity == Polarity::IdleHigh)
                    .loop_().disabled()
                );

                let div: u32 = 12_000_000 / u32::from(freq) - 1;
                assert!(div <= 0xFFFF);
                spi.raw.div.modify(|_, w| unsafe { w.divval().bits(div as u16) } );

                // spi.raw.fifowr.write(|w| w
                //     .rxignore().ignore() // otherwise transmit halts if FIFORD buffer is full
                // );
                // spi.raw.fifotrig.modify(|_, w| w
                //     .enabletx().enabled()
                //     .enablerx().enabled()
                // );
                spi.raw.fifocfg.modify(|_, w| w
                    .enabletx().enabled()
                    .enablerx().enabled()
                );
                spi.raw.cfg.modify(|_, w| w
                    .enable().enabled()
                );
                // match pins.3.SSEL {
                //     0...3 => {},
                //     _ => { panic!() },
                // }

                Self {
                    spi,
                    pins,
                    _sck: PhantomData,
                    _mosi: PhantomData,
                    _miso: PhantomData,
                    _ssel: PhantomData,
                    _ssel_pin: PhantomData,
                    ssel: SSELPIN::SSEL,
                }
            }

            pub fn release(self) -> ($SpiX, PINS) {
                (self.spi, self.pins)
            }

            fn return_on_error(&self) -> nb::Result<(), Error> {
                // TODO: error readout
                Ok(())
            }

            // pub fn ssel(&mut self, ssel: &mut SSELPIN) {
            //     self.ssel = SSELPIN::SSEL;
            // }

        }

        impl<SCK, MOSI, MISO, SSEL, PINS, SSELPIN> FullDuplex<u8> for SpiMaster<SCK, MOSI, MISO, SSEL, $SpiX, PINS, SSELPIN>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            SSEL: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, SSEL, $SpiX>,
            SSELPIN: SpiSselPin<SSEL, $SpiX>,
        {
            type Error = Error;

            fn read(&mut self) -> nb::Result<u8, Error> {
                // self.return_on_error()?;
                if self.spi.raw.fifostat.read().rxnotempty().bit_is_clear() {
                    // TODO: not sure how to turn this from u32 (or u16??) into u8
                    // Or whatever...
                    let byte = self.spi.raw.fiford.read().rxdata().bits();
                    Ok(byte as u8)
                } else {
                    Err(nb::Error::WouldBlock)
                }
            }

            fn send(&mut self, byte: u8) -> nb::Result<(), Error> {

                // NB: UM says "Do not read-modify-write the register."
                // - writing 0 to upper-half word means: keep previous control settings

                self.return_on_error()?;
                if self.spi.raw.fifostat.read().txempty().bit_is_set() {
                    // NB: we set 8 bits in constructor
                    // We could probably repeat this here
                    use SlaveSelect::*;
                    match self.ssel {
                        Slave0 =>  {
                            self.spi.raw.fifowr.write(|w| unsafe { w
                                // control
                                .len().bits(7) // 8 bits
                                .txssel0_n().asserted()
                                // data
                                .txdata().bits(byte as u16)
                            });
                        },
                        Slave1 =>  {
                            self.spi.raw.fifowr.write(|w| unsafe { w
                                // control
                                .len().bits(7) // 8 bits
                                .txssel1_n().asserted()
                                // data
                                .txdata().bits(byte as u16)
                            });
                        },
                        Slave2 =>  {
                            self.spi.raw.fifowr.write(|w| unsafe { w
                                // control
                                .len().bits(7) // 8 bits
                                .txssel2_n().asserted()
                                // data
                                .txdata().bits(byte as u16)
                            });
                        },
                        Slave3 =>  {
                            self.spi.raw.fifowr.write(|w| unsafe { w
                                // control
                                .len().bits(7) // 8 bits
                                .txssel3_n().asserted()
                                // data
                                .txdata().bits(byte as u16)
                            });
                        },
                        All =>  {
                            self.spi.raw.fifowr.write(|w| unsafe { w
                                // control
                                .len().bits(7) // 8 bits
                                .txssel0_n().asserted()
                                .txssel1_n().asserted()
                                .txssel2_n().asserted()
                                .txssel3_n().asserted()
                                // data
                                .txdata().bits(byte as u16)
                            });
                        },
                    }
                    Ok(())
                } else {
                    Err(nb::Error::WouldBlock)
                }
            }
        }

        impl<SCK, MOSI, MISO, SSEL, PINS, SSELPIN> crate::traits::wg::blocking::spi::transfer::Default<u8>
        for
            SpiMaster<SCK, MOSI, MISO, SSEL, $SpiX, PINS, SSELPIN>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            SSEL: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, SSEL, $SpiX>,
            SSELPIN: SpiSselPin<SSEL, $SpiX>,
        {}

        impl<SCK, MOSI, MISO, SSEL, PINS, SSELPIN> crate::traits::wg::blocking::spi::write::Default<u8>
        for
            SpiMaster<SCK, MOSI, MISO, SSEL, $SpiX, PINS, SSELPIN>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            SSEL: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, SSEL, $SpiX>,
            SSELPIN: SpiSselPin<SSEL, $SpiX>,
        {}
    }
}

impl_spi!(Spi0, SpiMaster0);
impl_spi!(Spi1, SpiMaster1);
impl_spi!(Spi2, SpiMaster2);
impl_spi!(Spi3, SpiMaster3);
impl_spi!(Spi4, SpiMaster4);
impl_spi!(Spi5, SpiMaster5);
impl_spi!(Spi6, SpiMaster6);
impl_spi!(Spi7, SpiMaster7);
impl_spi!(Spi8, SpiMaster8);

// impl<SPI, PINS> crate::traits::wg::blocking::spi::transfer::Default<u8> for SpiMaster<SPI, PINS>
// where
//     SPI: Spi
// {}

// impl<SPI, PINS> embedded_hal::blocking::spi::write::Default<u8> for SpiMaster<SPI, PINS>
// where
//     SPI: Deref<Target = spi1::RegisterBlock>,
// {}

