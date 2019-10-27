use crate::traits::established::blocking::i2c::{Write, WriteRead, Read};
use crate::peripherals::{
    i2c::{
        // Trait marking I2C peripherals
        I2c, // as I2cPeripheral
        // Actual I2c HAL peripherals
        I2c2,
        I2c4,
        I2cPins,
    },
};
use crate::drivers::clocks::Hertz;

/// I2C error
#[derive(Debug)]
pub enum Error {
    /// Bus error (catch-all)
    Bus,
    /// Arbitration loss
    ArbitrationLoss,
    /// NACK
    Nack,
    /// Start/Stop error
    StartStop,

    #[doc(hidden)]
    _Extensible,
}


// TODO: Parametrize with Master/Slave MODE
/// I2C peripheral operating in master mode
pub struct I2cMaster<I2C, PINS>
where
    I2C: I2c,
    PINS: I2cPins<I2C>,
{
    i2c: I2C,
    pins: PINS,
}

// trait I2cCommon {
//     fn send_byte(&self, byte: u8) -> Result<(), Error>;

//     fn recv_byte(&self) -> Result<u8, Error>;
// }

macro_rules! impl_i2c {
    ($I2cX:ident) => {

impl<PINS> I2cMaster<$I2cX, PINS>
where
    PINS: I2cPins<$I2cX>,
{
    pub fn new(i2c: $I2cX, pins: PINS, speed: /*Kilo*/Hertz, /*_compatible_clocks: ClocksSupportI2cToken*/) -> Self {
        i2c.raw.cfg.modify(|_, w| w
            .msten().enabled()
            .slven().disabled()
            .monen().disabled()
            // ...etc.
        );
        // or whatever...
        i2c.raw.msttime.modify(|_, w| w
            .mstscllow().clocks_7()
            .mstsclhigh().clocks_7()
        );

        Self {
            i2c,
            pins: pins,
        }
    }

    pub fn release(self) -> ($I2cX, PINS) {
        (self.i2c, self.pins)
    }
}

// impl<I2C, PINS> I2cMaster<I2C, PINS>
// where
//     I2C: I2c,
//     PINS: I2cPins<I2C>,
// {
//     pub fn new(i2c: I2C, pins: PINS, speed: /*Kilo*/Hertz, /*_compatible_clocks: ClocksSupportI2cToken*/) -> Self {
//         i2c.raw.cfg.modify(|_, w| w
//             .msten().enabled()
//             .slven().disabled()
//             .monven().disabled()
//             // ...etc.
//         );
//         // or whatever...
//         i2c.raw.msttime.modify(|_, w| w
//             .mstscllow().clocks_7()
//             .mstsclhigh().clocks_7()
//         );

//         Self {
//             i2c,
//             pins,
//         }
//     }
// }

impl<PINS> Write for I2cMaster<$I2cX, PINS>
where
    PINS: I2cPins<$I2cX>,
{
    type Error = Error;

    fn write(&mut self, addr: u8, bytes: &[u8]) -> Result<(), Self::Error> {
        // Write the slave address with the RW bit set to 0 to the master data register MSTDAT.
        self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits(addr << 1) } );

        // Start the transmission by setting the MSTSTART bit to 1 in the master control register.
        self.i2c.raw.mstctl.modify(|_, w| w.mststart().start());

        // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
        //
        // TODO: Consider implementing a timeout (loop at most N times...) :TODO
        //
        while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

        if self.i2c.raw.stat.read().mststate().is_nack_address() {
            return Err(Error::Nack);
        }
        if self.i2c.raw.stat.read().mstarbloss().is_arbitration_loss() {
            return Err(Error::ArbitrationLoss);
        }
        if self.i2c.raw.stat.read().mstststperr().is_error() {
            return Err(Error::StartStop);
        }
        if !self.i2c.raw.stat.read().mststate().is_transmit_ready() {
            return Err(Error::Bus);
        }

        // Send bytes
        for byte in bytes {
            // write a byte
            self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits(*byte) } );
            // instruct master to continue
            self.i2c.raw.mstctl.modify(|_, w| w.mstcontinue().continue_());

            // Wait until done
            while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

            // Error handling
            if self.i2c.raw.stat.read().mststate().is_nack_data() {
                return Err(Error::Nack);
            }
            if !self.i2c.raw.stat.read().mststate().is_transmit_ready() {
                return Err(Error::Bus);
            }
        }

        // Stop the transmission by setting the MSTSTOP bit to 1 in the master control register.
        self.i2c.raw.mstctl.modify(|_, w| w.mststop().stop());

        // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
        while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

        if self.i2c.raw.stat.read().mstarbloss().is_arbitration_loss() {
            return Err(Error::ArbitrationLoss);
        }
        if self.i2c.raw.stat.read().mstststperr().is_error() {
            return Err(Error::StartStop);
        }
        if !self.i2c.raw.stat.read().mststate().is_idle() {
            return Err(Error::Bus);
        }

        // Fallthrough is success
        Ok(())
    }
}

impl<PINS> Read for I2cMaster<$I2cX, PINS>
where
    PINS: I2cPins<$I2cX>,
{
    type Error = Error;

    fn read(&mut self, addr: u8, buffer: &mut [u8]) -> Result<(), Self::Error> {
        if let Some((last, buffer)) = buffer.split_last_mut() {

            // Write the slave address with the RW bit set to 1 to the master data register MSTDAT.
            self.i2c.raw.mstdat.modify(|_, w| unsafe { w.data().bits((addr << 1) | 1) } );

            // Start the transmission by setting the MSTSTART bit to 1 in the master control register.
            self.i2c.raw.mstctl.modify(|_, w| w.mststart().start());

            // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
            while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

            if self.i2c.raw.stat.read().mststate().is_nack_address() {
                return Err(Error::Nack);
            }
            if self.i2c.raw.stat.read().mstarbloss().is_arbitration_loss() {
                return Err(Error::ArbitrationLoss);
            }
            if self.i2c.raw.stat.read().mstststperr().is_error() {
                return Err(Error::StartStop);
            }
            if !self.i2c.raw.stat.read().mststate().is_receive_ready() {
                return Err(Error::Bus);
            }


            for byte in buffer {
                *byte = self.i2c.raw.mstdat.read().data().bits();

                // Wait for next byte
                while self.i2c.raw.stat.read().mstpending().is_in_progress() {}
                // Check for error
                if self.i2c.raw.stat.read().mststate().is_nack_data() {
                    return Err(Error::Nack);
                }
                if !self.i2c.raw.stat.read().mststate().is_receive_ready() {
                    return Err(Error::Bus);
                }
            }

            *last = self.i2c.raw.mstdat.read().data().bits();

            // Stop the transmission by setting the MSTSTOP bit to 1 in the master control register.
            self.i2c.raw.mstctl.modify(|_, w| w.mststop().stop());

            // Wait for the pending status to be set (MSTPENDING = 1) by polling the STAT register
            while self.i2c.raw.stat.read().mstpending().is_in_progress() {}

            if self.i2c.raw.stat.read().mstarbloss().is_arbitration_loss() {
                return Err(Error::ArbitrationLoss);
            }
            if self.i2c.raw.stat.read().mstststperr().is_error() {
                return Err(Error::StartStop);
            }
            if !self.i2c.raw.stat.read().mststate().is_idle() {
                return Err(Error::Bus);
            }

        }

        // Fallthrough is success
        Ok(())
    }
}

impl<PINS> WriteRead for I2cMaster<$I2cX, PINS>
where
    PINS: I2cPins<$I2cX>,
{
    type Error = Error;

    fn write_read(&mut self, addr: u8, bytes: &[u8], buffer: &mut [u8]) -> Result<(), Self::Error> {
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

impl_i2c!(I2c2);
impl_i2c!(I2c4);
