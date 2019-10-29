use core::marker::PhantomData;
use crate::traits::established::blocking::i2c::{Write, WriteRead, Read};
use crate::peripherals::{
    flexcomm::{
        // Trait marking I2C peripherals and pins
        I2c, // as I2cPeripheral
        I2cPins,
        // Actual I2c HAL peripherals
        I2c0,
        I2c1,
        I2c2,
        I2c3,
        I2c4,
        I2c5,
        I2c6,
        I2c7,
    },
};
use crate::drivers::{
    pins::{
        // Pin,
        PinId,
    },
};
// use crate::drivers::clocks::Hertz;

/// I2C error
#[derive(Debug)]
pub enum Error {
    /// Bus error (catch-all)
    Bus,
    /// Arbitration loss
    ArbitrationLoss,
    /// NACK
    NackAddress,
    /// NACK
    NackData,
    /// Start/Stop error
    StartStop,

    #[doc(hidden)]
    _Extensible,
}

pub type Result<T> = core::result::Result<T, Error>;


// TODO: Parametrize with Master/Slave MODE
/// I2C peripheral operating in master mode
pub struct I2cMaster<PIO1, PIO2, I2C, PINS>
where
    PIO1: PinId,
    PIO2: PinId,
    I2C: I2c,
    PINS: I2cPins<PIO1, PIO2, I2C>,
{
    i2c: I2C,
    pins: PINS,
    _pin1: PhantomData<PIO1>,
    _pin2: PhantomData<PIO2>,
}

// trait I2cCommon {
//     fn send_byte(&self, byte: u8) -> Result<(), Error>;

//     fn recv_byte(&self) -> Result<u8, Error>;
// }

macro_rules! impl_i2c {
    ($I2cX:ident, $I2cXMaster:ident) => {

        /// hopefully, rustc's type inference will improve, and
        /// we can remove these types again
        pub type $I2cXMaster<A, B, C> = I2cMaster<A, B, $I2cX, C>;

        impl<PIO1, PIO2, PINS> I2cMaster<PIO1, PIO2, $I2cX, PINS>
        where
            PIO1: PinId,
            PIO2: PinId,
            PINS: I2cPins<PIO1, PIO2, $I2cX>,
        {
            pub fn new(i2c: $I2cX, pins: PINS, /*speed: KiloHertz, _compatible_clocks: ClocksSupportI2cToken*/) -> Self {
                i2c.raw.cfg.modify(|_, w| w
                    .msten().enabled()
                    // .slven().disabled()
                    // .monen().disabled()
                    // ...etc.
                );

                // DIVVAL = 10 - 1, MSTSCLHIGH = MSTSCLLOW = 6 - 2
                i2c.raw.clkdiv.modify(|_, w| unsafe { w.divval().bits(10 - 1) } );
                i2c.raw.msttime.modify(|_, w| w
                    .mstsclhigh().clocks_4()
                    .mstscllow().clocks_4()
                );

                // or whatever...

                Self {
                    i2c,
                    pins,
                    _pin1: PhantomData,
                    _pin2: PhantomData,
                }
            }

            pub fn release(self) -> ($I2cX, PINS) {
                (self.i2c, self.pins)
            }

            #[inline(always)]
            fn return_on_error(&self) -> Result<()> {
                if self.i2c.raw.stat.read().mststate().is_nack_data() {
                    return Err(Error::NackData);
                }
                if self.i2c.raw.stat.read().mststate().is_nack_address() {
                    return Err(Error::NackAddress);
                }
                if self.i2c.raw.stat.read().mstarbloss().is_arbitration_loss() {
                    return Err(Error::ArbitrationLoss);
                }
                if self.i2c.raw.stat.read().mstststperr().is_error() {
                    return Err(Error::StartStop);
                }
                Ok(())
            }
        }

        impl<PIO1, PIO2, PINS> Write for I2cMaster<PIO1, PIO2, $I2cX, PINS>
        where
            PIO1: PinId,
            PIO2: PinId,
            PINS: I2cPins<PIO1, PIO2, $I2cX>,
        {
            type Error = Error;

            fn write(&mut self, addr: u8, bytes: &[u8]) -> Result<()> {
                self.return_on_error()?;

                // Write the slave address with the RW bit set to 0 to the master data register MSTDAT.
                self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits(addr << 1) } );
                // Start the transmission by setting the MSTSTART bit to 1 in the master control register.
                self.i2c.raw.mstctl.write(|w| w.mststart().start());
                // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
                // TODO: Consider implementing a timeout (loop at most N times...) :TODO
                while self.i2c.raw.stat.read().mstpending().is_in_progress() { continue; }

                self.return_on_error()?;
                if !self.i2c.raw.stat.read().mststate().is_transmit_ready() {
                    return Err(Error::Bus);
                }

                // Send bytes
                for byte in bytes {
                    // write a byte
                    self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits(*byte) } );
                    // instruct master to continue
                    self.i2c.raw.mstctl.write(|w| w.mstcontinue().continue_());
                    // Wait until done
                    while self.i2c.raw.stat.read().mstpending().is_in_progress() { continue; }

                    // Error handling
                    self.return_on_error()?;
                    if !self.i2c.raw.stat.read().mststate().is_transmit_ready() {
                        return Err(Error::Bus);
                    }
                }

                // Stop the transmission by setting the MSTSTOP bit to 1 in the master control register.
                self.i2c.raw.mstctl.write(|w| w.mststop().stop());
                // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
                while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

                self.return_on_error()?;
                if !self.i2c.raw.stat.read().mststate().is_idle() {
                    return Err(Error::Bus);
                }

                // Fallthrough is success
                Ok(())
            }
        }

        impl<PIO1, PIO2, PINS> Read for I2cMaster<PIO1, PIO2, $I2cX, PINS>
        where
            PIO1: PinId,
            PIO2: PinId,
            PINS: I2cPins<PIO1, PIO2, $I2cX>,
        {
            type Error = Error;

            fn read(&mut self, addr: u8, buffer: &mut [u8]) -> Result<()> {
                if let Some((last, buffer)) = buffer.split_last_mut() {

                    // Write the slave address with the RW bit set to 1 to the master data register MSTDAT.
                    self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits((addr << 1) | 1) } );
                    // Start the transmission by setting the MSTSTART bit to 1 in the master control register.
                    self.i2c.raw.mstctl.write(|w| w.mststart().start());

                    // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
                    while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

                    self.return_on_error()?;
                    if !self.i2c.raw.stat.read().mststate().is_receive_ready() {
                        return Err(Error::Bus);
                    }


                    for byte in buffer {
                        // Read a byte
                        *byte = self.i2c.raw.mstdat.read().data().bits();
                        // Instruct master to continue
                        self.i2c.raw.mstctl.write(|w| w.mstcontinue().continue_());

                        // Wait for next byte
                        while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

                        self.return_on_error()?;
                        if !self.i2c.raw.stat.read().mststate().is_receive_ready() {
                            return Err(Error::Bus);
                        }
                    }

                    // Read last byte
                    *last = self.i2c.raw.mstdat.read().data().bits();

                    // Stop the transmission by setting the MSTSTOP bit to 1 in the master control register.
                    self.i2c.raw.mstctl.write(|w| w.mststop().stop());

                    // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
                    while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

                    self.return_on_error()?;
                    if !self.i2c.raw.stat.read().mststate().is_idle() {
                        return Err(Error::Bus);
                    }

                }

                // Fallthrough is success
                Ok(())
            }
        }

        impl<PIO1, PIO2, PINS> WriteRead for I2cMaster<PIO1, PIO2, $I2cX, PINS>
        where
            PIO1: PinId,
            PIO2: PinId,
            PINS: I2cPins<PIO1, PIO2, $I2cX>,
        {
            type Error = Error;

            fn write_read(&mut self, addr: u8, bytes: &[u8], buffer: &mut [u8]) -> Result<()> {
                self.write(addr, bytes)?;
                self.read(addr, buffer)?;

                Ok(())
            }
        }

        // impl<PINS> I2cCommon for I2cMaster<$I2cX, PINS>
        // where
        //     PINS: I2cPins<$I2cX>,
        // {
        //     fn send_byte(&self, byte: u8) -> Result<(), Error> {
        //         // Write the byte
        //         self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits(byte) } );
        //         // Instruct master to continue
        //         self.i2c.raw.mstctl.modify(|_, w| w.mstcontinue().continue_());
        //         // Wait until done
        //         while self.i2c.raw.stat.read().mstpending().is_in_progress() {}
        //         // Check for error
        //         if !self.i2c.raw.stat.read().mststate().is_transmit_ready() {
        //             return Err(Error::Nack);
        //         }

        //         Ok(())
        //     }

        //     fn recv_byte(&self) -> Result<u8, Error> {
        //         let data = self.i2c.raw.mstdat.read().data().bits();
        //         // Wait until done
        //         while self.i2c.raw.stat.read().mstpending().is_in_progress() {}
        //         // Check for error
        //         if !self.i2c.raw.stat.read().mststate().is_receive_ready() {
        //             return Err(Error::Nack);
        //         }
        //         Ok(data)
        //     }
        // }


// macro_rules impl_i2c
}}

impl_i2c!(I2c0, I2c0Master);
impl_i2c!(I2c1, I2c1Master);
impl_i2c!(I2c2, I2c2Master);
impl_i2c!(I2c3, I2c3Master);
impl_i2c!(I2c4, I2c4Master);
impl_i2c!(I2c5, I2c5Master);
impl_i2c!(I2c6, I2c6Master);
impl_i2c!(I2c7, I2c7Master);
