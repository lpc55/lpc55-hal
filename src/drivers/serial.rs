use core::fmt;
use core::marker::PhantomData;

use crate::{
    typestates::{
        pin::{
            flexcomm::{
                // Trait marking USART peripherals and pins
                Usart,
                UsartPins,
            },
            PinId,
        },
    },
    traits::wg::serial,
    time::Hertz,
};

pub mod config;

/// Serial error
#[derive(Debug)]
pub enum Error {
    /// Framing error
    Framing,
    /// Noise error
    Noise,
    /// RX buffer overrun
    Overrun,
    /// Parity check error
    Parity,
    #[doc(hidden)]
    _Extensible,
}

// /// Interrupt event
// pub enum Event {
//     /// New data has been received
//     Rxne,
//     /// New data can be sent
//     Txe,
//     /// Idle line state detected
//     Idle,
// }

/// USART peripheral operating as serial
pub struct Serial<TX, RX, USART, PINS>
where
    TX: PinId,
    RX: PinId,
    USART: Usart,
    PINS: UsartPins<TX, RX, USART>,
{
    usart: USART,
    pins: PINS,
    _tx: PhantomData<TX>,
    _rx: PhantomData<RX>,
}

// such a Serial can be split() into (Tx, Rx)

/// Serial transmitter
pub struct Tx<USART: Usart> {
    raw: raw::usart0::RegisterBlock,
    _usart: PhantomData<USART>,
}

/// Serial receiver
pub struct Rx<USART: Usart> {
    raw: raw::usart0::RegisterBlock,
    _usart: PhantomData<USART>,
}

impl<TX, RX, USART, PINS> Serial<TX, RX, USART, PINS>
where
    TX: PinId,
    RX: PinId,
    USART: Usart,
    PINS: UsartPins<TX, RX, USART>,
{
    pub fn new(usart: USART, pins: PINS, config: config::Config) -> Self {
        use self::config::*;

        let speed: Hertz = config.speed.into();
        let speed: u32 = speed.0;

        usart.fifocfg.modify(|_, w| w
            .enabletx().disabled()
            .enablerx().disabled()
        );

        usart.fifotrig.modify(|_, w| unsafe { w
            .txlvl().bits(0)
            .txlvlena().enabled()
            .rxlvl().bits(1)
            .rxlvlena().enabled()
        });

        usart.cfg.write(|w| unsafe { w
            .paritysel().bits(match config.parity {
                Parity::ParityNone => 0,
                Parity::ParityEven => 2,
                Parity::ParityOdd => 3,
            })
            .stoplen().bit(match config.stopbits {
                StopBits::STOP1 => false,
                StopBits::STOP2 => true,
            })
            .datalen().bits(match config.wordlength {
                WordLength::DataBits7 => 0,
                WordLength::DataBits8 => 1,
                WordLength::DataBits9 => 2,
            })

            // these are just some defaults (of zero)

            // loopback mode
            .loop_().normal()
            // asynch mode
            .syncen().asynchronous_mode()
            // polarity
            .clkpol().falling_edge()

            // enable it
            .enable().enabled()
        });

        // baudrate logic from `fsl_usart.c` in SDK
        let mut best_diff = !0;
        let mut best_osr = 15;
        let mut best_brg = !0;

        // SDK says: "Smaller values of OSR can make the sampling position within a data bit less
        // accurate and may potentially cause more noise errors or incorrect data."
        for osr in (9..=16).rev() {
            let brg = 12_000_000 / (osr * speed);
            if brg >= 0xffff {
                continue;
            }
            let realized_speed = 12_000_000 / (osr * brg);
            let diff = if speed > realized_speed { speed - realized_speed} else { realized_speed - speed };
            if diff < best_diff {
                best_diff = diff;
                best_osr = osr;
                best_brg = brg;
            }
        }

        // TODO: return Result
        if best_brg >= 0xffff {
            panic!("baudrate not supported");
        }

        usart.brg.write(|w| unsafe { w.brgval().bits(best_brg as u16 - 1) });
        usart.osr.write(|w| unsafe { w.osrval().bits(best_osr as u8 - 1) });

        Self {
            usart,
            pins,
            _tx: PhantomData,
            _rx: PhantomData,
        }
    }

    pub fn split(self) -> (Tx<USART>, Rx<USART>) {
        // so umm... Tx/Rx "promise" to not step on each others' toes
        (
            Tx {
                raw: unsafe { core::ptr::read(&(*self.usart) as *const _) },
                _usart: PhantomData,
            },
            Rx {
                // raw: *self.usart,
                raw: unsafe { core::ptr::read(&(*self.usart) as *const _) },
                _usart: PhantomData,
            },
        )
    }
    pub fn release(self) -> (USART, PINS) {
        (self.usart, self.pins)
    }
}

impl<TX, RX, USART, PINS> serial::Read<u8> for Serial<TX, RX, USART, PINS>
where
    TX: PinId,
    RX: PinId,
    USART: Usart,
    PINS: UsartPins<TX, RX, USART>,
{
    type Error = Error;

    fn read(&mut self) -> nb::Result<u8, Error> {
        let mut rx: Rx<USART> = Rx {
            raw: unsafe { core::ptr::read(&(*self.usart) as *const _) },
            _usart: PhantomData,
        };
        rx.read()
    }
}

impl<USART: Usart> serial::Read<u8> for Rx<USART> {
    type Error = Error;

    fn read(&mut self) -> nb::Result<u8, Error> {
        if self.raw.fifostat.read().rxnotempty().bit() {

            // SDK uses stat, and e.g. framerrint instead of framerr,
            // but that's not in the SDK
            let fiford = self.raw.fiford.read();
            if fiford.framerr().bit_is_set() {
                return Err(nb::Error::Other(Error::Framing));
            }

            if fiford.parityerr().bit_is_set() {
                return Err(nb::Error::Other(Error::Parity));
            }

            if fiford.rxnoise().bit_is_set() {
                return Err(nb::Error::Other(Error::Noise));
            }

            let fifostat = self.raw.fifostat.read();

            if fifostat.rxerr().bit_is_set() {
                // clear by writing 1
                self.raw.fifocfg.modify(|_, w| w.emptyrx().set_bit());
                self.raw.fifostat.modify(|_, w| w.rxerr().set_bit());
                return Err(nb::Error::Other(Error::Overrun));
            }

            Ok(fiford.rxdata().bits() as u8)

        } else {
            Err(nb::Error::WouldBlock)
        }
    }
}


impl<TX, RX, USART, PINS> serial::Write<u8> for Serial<TX, RX, USART, PINS>
where
    TX: PinId,
    RX: PinId,
    USART: Usart,
    PINS: UsartPins<TX, RX, USART>,
{
    type Error = Error;

    fn flush(&mut self) -> nb::Result<(), Self::Error> {
        let mut tx: Tx<USART> = Tx {
            raw: unsafe { core::ptr::read(&(*self.usart) as *const _) },
            _usart: PhantomData,
        };
        tx.flush()
    }

    fn write(&mut self, byte: u8) -> nb::Result<(), Self::Error> {
        let mut tx: Tx<USART> = Tx {
            raw: unsafe { core::ptr::read(&(*self.usart) as *const _) },
            _usart: PhantomData,
        };
        tx.write(byte)
    }
}

impl<USART: Usart> serial::Write<u8> for Tx<USART> {
    type Error = Error;

    fn flush(&mut self) -> nb::Result<(), Self::Error> {
        if self.raw.stat.read().txidle().bit() {
            Ok(())
        } else {
            Err(nb::Error::WouldBlock)
        }
    }

    fn write(&mut self, byte: u8) -> nb::Result<(), Self::Error> {
        if self.raw.fifostat.read().txnotfull().bit() {
            // TODO: figure out if we need to perform an 8-bit write
            // This would not be possible via svd2rust API, and need some acrobatics
            self.raw.fifowr.write(|w| unsafe { w.bits(byte as u32) } );
            Ok(())
        } else {
            Err(nb::Error::WouldBlock)
        }
    }
}

impl<USART: Usart> fmt::Write for Tx<USART>
where
    Tx<USART>: serial::Write<u8>,
{
    fn write_str(&mut self, s: &str) -> fmt::Result {
        use crate::traits::wg::serial::Write;
        let _ = s
            .as_bytes()
            .iter()
            .map(|c| nb::block!(self.write(*c)))
            .last();
        Ok(())
    }
}
