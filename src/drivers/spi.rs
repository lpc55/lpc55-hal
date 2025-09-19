//! There are 8 "normal" SPIs and on high-speed SPI.
//! The high-speed SPI is tied to Flexcomm8, which it does not
//! share with any other peripherals.
//!
//! SPI3, SPI4, and this high-speed SPI8 have 4 possible chip selects,
//! whereas the others have two.

use core::marker::PhantomData;

use embedded_hal::spi::SpiBus;

use crate::time::Hertz;
pub use crate::traits::wg1::spi::{
    Error as ErrorTrait, ErrorKind, ErrorType, Mode, Operation, Phase, Polarity, SpiDevice,
};
use crate::typestates::pin::{
    flexcomm::{ChipSelect, NoPio, Spi, SpiPins},
    PinId,
};

pub mod prelude {
    pub use super::Error as SpiError;
    pub use super::Result as SpiResult;
    pub use super::SpiMaster;
}

/// SPI error
/// TODO: Use the actual ones from the chip
#[derive(Debug)]
#[non_exhaustive]
pub enum Error {
    /// Overrun occurred
    Overrun,
    /// Mode fault occurred
    ModeFault,
    /// CRC error
    Crc,
}

pub type Result<T, E = Error> = core::result::Result<T, E>;

/// SPI peripheral operating in master mode
pub struct SpiMaster<SCK, MOSI, MISO, CS, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    CS: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, CS, SPI>,
{
    spi: SPI,
    pins: PINS,
    _sck: PhantomData<SCK>,
    _mosi: PhantomData<MOSI>,
    _miso: PhantomData<MISO>,
    _cs: PhantomData<CS>,
    cs: ChipSelect,
}

impl<SCK, MOSI, MISO, CS, SPI, PINS> SpiMaster<SCK, MOSI, MISO, CS, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    CS: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, CS, SPI>,
    // CSPIN: SpiSselPin<CS, SPI>,
{
    pub fn new<Speed: Into<Hertz>>(spi: SPI, pins: PINS, speed: Speed, mode: Mode) -> Self {
        let speed: Hertz = speed.into();
        let speed: u32 = speed.0;

        while spi.stat.read().mstidle().bit_is_clear() {
            continue;
        }

        spi.fifocfg
            .modify(|_, w| w.enabletx().disabled().enablerx().disabled());
        spi.cfg.modify(|_, w| {
            w.enable()
                .disabled()
                .master()
                .master_mode()
                .lsbf()
                .standard() // MSB first
                .cpha()
                .bit(mode.phase == Phase::CaptureOnSecondTransition)
                .cpol()
                .bit(mode.polarity == Polarity::IdleHigh)
                .loop_()
                .disabled()
        });

        let div: u32 = 12_000_000 / speed - 1;
        debug_assert!(div <= 0xFFFF);
        spi.div
            .modify(|_, w| unsafe { w.divval().bits(div as u16) });

        // spi.raw.fifowr.write(|w| w
        //     .rxignore().ignore() // otherwise transmit halts if FIFORD buffer is full
        // );
        // spi.raw.fifotrig.modify(|_, w| w
        //     .enabletx().enabled()
        //     .enablerx().enabled()
        // );
        spi.fifocfg
            .modify(|_, w| w.enabletx().enabled().enablerx().enabled());
        spi.cfg.modify(|_, w| w.enable().enabled());
        // match pins.3.CS {
        //     0...3 => {},
        //     _ => { panic!() },
        // }

        Self {
            spi,
            pins,
            _sck: PhantomData,
            _mosi: PhantomData,
            _miso: PhantomData,
            _cs: PhantomData,
            // _cs_pin: PhantomData,
            cs: PINS::CS,
        }
    }

    pub fn release(self) -> (SPI, PINS) {
        (self.spi, self.pins)
    }

    fn return_on_error(&self) -> Result<()> {
        // TODO: error readout
        Ok(())
    }
}

impl ErrorTrait for Error {
    fn kind(&self) -> ErrorKind {
        match self {
            Self::Overrun => ErrorKind::Overrun,
            Self::ModeFault => ErrorKind::ModeFault,
            Self::Crc => ErrorKind::FrameFormat,
        }
    }
}

impl<SCK, MOSI, MISO, CS, SPI, PINS> ErrorType for SpiMaster<SCK, MOSI, MISO, CS, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    CS: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, CS, SPI>,
    // CSPIN: SpiSselPin<CS, SPI>,
{
    type Error = Error;
}

impl<SCK, MOSI, MISO, CS, SPI, PINS> SpiMaster<SCK, MOSI, MISO, CS, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    CS: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, CS, SPI>,
{
    fn read_one(&mut self) -> nb::Result<u8, Error> {
        // self.return_on_error()?;
        if self.spi.fifostat.read().rxnotempty().bit_is_set() {
            // TODO: not sure how to turn this from u32 (or u16??) into u8
            // Or whatever...
            let byte = self.spi.fiford.read().rxdata().bits();
            Ok(byte as u8)
        } else {
            Err(nb::Error::WouldBlock)
        }
    }

    fn send_one(&mut self, byte: u8) -> nb::Result<(), Error> {
        // NB: UM says "Do not read-modify-write the register."
        // - writing 0 to upper-half word means: keep previous control settings

        self.return_on_error()?;
        if self.spi.fifostat.read().txnotfull().bit_is_set() {
            // NB: we set 8 bits in constructor
            // We could probably repeat this here
            use ChipSelect::*;
            match self.cs {
                Chip0 => {
                    self.spi.fifowr.write(|w| unsafe {
                        w
                            // control
                            .len()
                            .bits(7) // 8 bits
                            .txssel0_n()
                            .asserted()
                            // data
                            .txdata()
                            .bits(byte as u16)
                    });
                }
                Chip1 => {
                    self.spi.fifowr.write(|w| unsafe {
                        w
                            // control
                            .len()
                            .bits(7) // 8 bits
                            .txssel1_n()
                            .asserted()
                            // data
                            .txdata()
                            .bits(byte as u16)
                    });
                }
                Chip2 => {
                    self.spi.fifowr.write(|w| unsafe {
                        w
                            // control
                            .len()
                            .bits(7) // 8 bits
                            .txssel2_n()
                            .asserted()
                            // data
                            .txdata()
                            .bits(byte as u16)
                    });
                }
                Chip3 => {
                    self.spi.fifowr.write(|w| unsafe {
                        w
                            // control
                            .len()
                            .bits(7) // 8 bits
                            .txssel3_n()
                            .asserted()
                            // data
                            .txdata()
                            .bits(byte as u16)
                    });
                }
                NoChips => {
                    self.spi.fifowr.write(|w| unsafe {
                        w
                            // control
                            .len()
                            .bits(7) // 8 bits
                            // data
                            .txdata()
                            .bits(byte as u16)
                    });
                }
            }
            Ok(())
        } else {
            Err(nb::Error::WouldBlock)
        }
    }
}

impl<SCK, MOSI, MISO, SPI, PINS> SpiBus<u8> for SpiMaster<SCK, MOSI, MISO, NoPio, SPI, PINS>
where
    SCK: PinId,
    MOSI: PinId,
    MISO: PinId,
    SPI: Spi,
    PINS: SpiPins<SCK, MOSI, MISO, NoPio, SPI>,
    // CSPIN: SpiSselPin<CS, SPI>,
{
    fn read(&mut self, words: &mut [u8]) -> Result<()> {
        for w in words {
            *w = nb::block!(self.read_one())?;
        }
        Ok(())
    }
    fn write(&mut self, words: &[u8]) -> Result<()> {
        for w in words {
            nb::block!(self.send_one(*w))?;
        }
        Ok(())
    }

    fn transfer(&mut self, read: &mut [u8], write: &[u8]) -> Result<()> {
        for i in 0..read.len().max(write.len()) {
            let w = write.get(i).copied().unwrap_or(0xFF);
            nb::block!(self.send_one(w))?;
            let r = nb::block!(self.read_one())?;
            if let Some(w) = read.get_mut(i) {
                *w = r;
            }
        }
        Ok(())
    }

    fn transfer_in_place(&mut self, words: &mut [u8]) -> Result<()> {
        for w in words {
            // Corresponds to the previous implementation through embedded_hal_027::blocking::spi::transfer::Default
            nb::block!(self.send_one(*w))?;
            *w = nb::block!(self.read_one())?;
        }
        Ok(())
    }

    fn flush(&mut self) -> core::result::Result<(), Self::Error> {
        Ok(())
    }
}

// impl<SPI, PINS> crate::traits::wg::blocking::spi::transfer::Default<u8> for SpiMaster<SPI, PINS>
// where
//     SPI: Spi
// {}

// impl<SPI, PINS> embedded_hal::blocking::spi::write::Default<u8> for SpiMaster<SPI, PINS>
// where
//     SPI: Deref<Target = spi1::RegisterBlock>,
// {}
