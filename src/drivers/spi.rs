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

            // Actual Spi HAL peripherals
            Spi0,
            Spi1,
            Spi2,
            Spi3,
            Spi4,
            Spi5,
            Spi6,
            Spi7,
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
pub struct SpiMaster<SCK, MOSI, MISO, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, SPI>,
{
    spi: SPI,
    pins: PINS,
    _sck: PhantomData<SCK>,
    _mosi: PhantomData<MOSI>,
    _miso: PhantomData<MISO>,
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
        pub type $SpiMasterX<A, B, C, D> = SpiMaster<A, B, C, $SpiX, D>;

        impl<SCK, MOSI, MISO, PINS> SpiMaster<SCK, MOSI, MISO, $SpiX, PINS>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, $SpiX>,
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

                Self {
                    spi,
                    pins,
                    _sck: PhantomData,
                    _mosi: PhantomData,
                    _miso: PhantomData,
                }
            }

            pub fn release(self) -> ($SpiX, PINS) {
                (self.spi, self.pins)
            }

            fn return_on_error(&self) -> nb::Result<(), Error> {
                // TODO: error readout
                Ok(())
            }

        }

        impl<SCK, MOSI, MISO, PINS> FullDuplex<u8> for SpiMaster<SCK, MOSI, MISO, $SpiX, PINS>
        where
            SCK: PinId,
            MOSI: PinId,
            MISO: PinId,
            PINS: SpiPins<SCK, MOSI, MISO, $SpiX>,
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
                    self.spi.raw.fifowr.write(|w| unsafe { w
                        // control
                        .len().bits(7) // 8 bits
                        // data
                        .txdata().bits(byte as u16)
                    });
                    Ok(())
                } else {
                    Err(nb::Error::WouldBlock)
                }
            }
        }
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
