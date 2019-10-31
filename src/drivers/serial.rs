use core::marker::PhantomData;
use crate::{
    peripherals::{
        flexcomm::{
            // Trait marking USART peripherals and pins
            Usart,
            UsartPins,

            // Actual Usart HAL peripherals
            Usart0,
            Usart1,
            Usart2,
            Usart3,
            Usart4,
            Usart5,
            Usart6,
            Usart7,
        },
    },
    drivers::{
        pins::{
            PinId,
        },
    }
};

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

/// Interrupt event
pub enum Event {
    /// New data has been received
    Rxne,
    /// New data can be sent
    Txe,
    /// Idle line state detected
    Idle,
}

pub mod config {
    use crate::time::Bps;
    use crate::time::U32Ext;

    pub enum WordLength {
        DataBits8,
        DataBits9,
    }

    pub enum Parity {
        ParityNone,
        ParityEven,
        ParityOdd,
    }

    pub enum StopBits {
        #[doc = "1 stop bit"]
        STOP1,
        #[doc = "0.5 stop bits"]
        STOP0P5,
        #[doc = "2 stop bits"]
        STOP2,
        #[doc = "1.5 stop bits"]
        STOP1P5,
    }

    pub struct Config {
        pub baudrate: Bps,
        pub wordlength: WordLength,
        pub parity: Parity,
        pub stopbits: StopBits,
    }

    impl Config {
        pub fn baudrate(mut self, baudrate: Bps) -> Self {
            self.baudrate = baudrate;
            self
        }

        pub fn parity_none(mut self) -> Self {
            self.parity = Parity::ParityNone;
            self
        }

        pub fn parity_even(mut self) -> Self {
            self.parity = Parity::ParityEven;
            self
        }

        pub fn parity_odd(mut self) -> Self {
            self.parity = Parity::ParityOdd;
            self
        }

        pub fn wordlength_8(mut self) -> Self {
            self.wordlength = WordLength::DataBits8;
            self
        }

        pub fn wordlength_9(mut self) -> Self {
            self.wordlength = WordLength::DataBits9;
            self
        }

        pub fn stopbits(mut self, stopbits: StopBits) -> Self {
            self.stopbits = stopbits;
            self
        }
    }

    #[derive(Debug)]
    pub struct InvalidConfig;

    impl Default for Config {
        fn default() -> Config {
            let baudrate = 19_200_u32.bps();
            Config {
                baudrate,
                wordlength: WordLength::DataBits8,
                parity: Parity::ParityNone,
                stopbits: StopBits::STOP1,
            }
        }
    }
}

/// USART peripheral operating as serial
pub struct Serial<PIO1, PIO2, USART, PINS>
where
    PIO1: PinId,
    PIO2: PinId,
    USART: Usart,
    PINS: UsartPins<PIO1, PIO2, USART>,
{
    usart: USART,
    pins: PINS,
    _pin1: PhantomData<PIO1>,
    _pin2: PhantomData<PIO2>,
    _pin3: PhantomData<PIO3>,
}

// such a Serial can be split() into (Tx, Rx) in STM32F4 HAL

/// Serial transmitter
pub struct Tx<USART> {
    _usart: PhantomData<USART>,
}

/// Serial receiver
pub struct Rx<USART> {
    _usart: PhantomData<USART>,
}

macro_rules! impl_serial {
    ($UsartX:ident, $SerialX:ident) => {

        /// hopefully, rustc's type inference will improve, and
        /// we can remove these types again
        pub type $SerialX<A, B, C> = Serial<A, B, $UsartX, C>;

        impl<PIO1, PIO2, PINS> Serial<PIO1, PIO2, $UsartX, PINS>
        where
            PIO1: PinId,
            PIO2: PinId,
            PINS: UsartPins<PIO1, PIO2, $UsartX>,
        {
            pub fn new(usart: $UsartX, pins: PINS, config: config::Config) -> Self {
            }
        }
    }
}

impl_serial!(Usart0, Serial0);
impl_serial!(Usart1, Serial1);
