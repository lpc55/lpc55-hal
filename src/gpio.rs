#[allow(deprecated)]
use embedded_hal::digital::{OutputPin, StatefulOutputPin};
// embedded_hal::digital::v2_compat::*;

use cortex_m_semihosting::dbg;

use crate::{
    init_state, raw,
    syscon,
};

use self::pin_state::PinState;

/// Contains types to indicate the direction of GPIO pins
pub mod direction {
    /// Implemented by types that indicate GPIO pin direction
    pub trait Direction {}

    pub struct Unknown;
    impl Direction for Unknown {}

    pub struct Input;
    impl Direction for Input {}

    pub struct Output;
    impl Direction for Output {}

    pub trait NotOutput: Direction {}
    impl NotOutput for Unknown {}
    impl NotOutput for Input {}
}

/// Contains types that indicate pin states
pub mod pin_state {
    use crate::gpio::direction::Direction;
    use crate::raw::gpio::{CLR, DIRSET, PIN, SET};

    /// Implemented by types that indicate pin state
    pub trait PinState {}

    /// Marks a [`Pin`] as being unused
    pub struct Unused;
    impl PinState for Unused {}

    /// Marks a [`Pin`]  as being assigned to general-purpose I/O
    pub struct Gpio<'gpio, D: Direction> {
        pub(crate) dirset: &'gpio [DIRSET],
        pub(crate) pin: &'gpio [PIN],
        pub(crate) set: &'gpio [SET],
        pub(crate) clr: &'gpio [CLR],

        pub(crate) _direction: D,
    }

    impl<'gpio, D> PinState for Gpio<'gpio, D> where D: Direction {}
}

/// Implemented by types that identify pins
pub trait PinId {
    /// This is `0` for [`PIO0_0`] and `1` for [`PIO1_0`]
    const PORT: usize;

    /// This is `0` for [`PIO0_0`], `1` for [`PIO0_1`] and so forth.
    const ID: u8;

    /// This is `0x00000001` for [`PIO0_0`], `0x00000002` for [`PIO0_1`],
    /// `0x00000004` for [`PIO0_2`], and so forth.
    const MASK: u32;
}

/// Main API to control for controlling pins
///
/// `Pin` has two type parameters:
/// - `T`, to indicate which specific pin this instance of `Pin` represents (so,
///   [`PIO0_0`], [`PIO0_1`], and so on)
/// - `S`, to indicate which state the represented pin is currently in
///
/// A pin instance can be in one of the following states:
/// - [`pin_state::Unused`], to indicate that the pin is currently not used
/// - [`pin_state::Gpio`], to indicate that the pin is being used for
///   general-purpose I/O
/// - TODO: others
///
/// # State Management
///
/// All pins start out their initial state, as defined in the user manual. To
/// prevent us from making mistakes, only the methods that induce a valid state
/// transition are available. Code that tries to call a method that would cause
/// an invalid state transition will simply not compile.
///
/// TODO: change this towards "assume nothing on the pin"
/// TBD: what does this mean exactly...
///
/// # General Purpose I/O
///
/// All pins can be used for general-purpose I/O (GPIO), meaning they can be
/// used for reading digital input signals and writing digital output signals.
/// To set up a pin for GPIO use, you need to call [`Pin::into_gpio_pin`] when
/// it is in its unused state.
///
/// (( Example ))
///
/// Now `pin` is in the GPIO state. The GPIO state has the following sub-states:
/// - [`direction::Unknown`], to indicate that the current GPIO configuration is
///   not known
/// - [`direction::Input`], to indicate that the pin is configured for digital
///   input
/// - [`direction::Output`], to indicate that the pin is configured for digital
///   output
///
/// To use a pin, that we previously configured for GPIO (see example above),
/// for digital output, we need to set the pin direction and initial low/high
/// state using [`Pin::into_output_low`] or [`Pin::into_output_high`].
///
/// Using pins for digital input is currently not supported by the API.
///
/// # Fixed and Movable Functions
///
/// Besides general-purpose I/O, pins can be used for a number of more
/// specialized functions. Some of those can be used only on one specific pin
/// (fixed functions), others can be assigned to any pin (movable functions).
///
/// (...)
///
/// This is currently not supported.
pub struct Pin<T: PinId, S: PinState> {
    pub(crate) id: T,
    pub(crate) state: S,
}

impl<T> Pin<T, pin_state::Unused>
where
    T: PinId,
{
    /// Transition pin to GPIO state
    pub fn into_gpio_pin(self, gpio: &GPIO) -> Pin<T, pin_state::Gpio<direction::Unknown>> {
        Pin {
            id: self.id,
            state: pin_state::Gpio {
                dirset: &gpio.gpio.dirset,
                pin: &gpio.gpio.pin,
                set: &gpio.gpio.set,
                clr: &gpio.gpio.clr,

                _direction: direction::Unknown,
            },
        }
    }
}

impl<'gpio, T, D> Pin<T, pin_state::Gpio<'gpio, D>>
where
    T: PinId,
    D: direction::NotOutput,
{
    fn into_output(self) -> Pin<T, pin_state::Gpio<'gpio, direction::Output>> {
        self.state.dirset[T::PORT].write(|w| unsafe { w.dirsetp().bits(T::MASK) });

        Pin {
            id: self.id,

            state: pin_state::Gpio {
                dirset: self.state.dirset,
                pin: self.state.pin,
                set: self.state.set,
                clr: self.state.clr,

                _direction: direction::Output,
            },
        }
    }

    pub fn into_output_low(self) -> Pin<T, pin_state::Gpio<'gpio, direction::Output>> {
        let mut pin = self.into_output();

        // usually redundant

        #[allow(deprecated)]
        pin.set_low();
        pin
    }

    // used for instance for LEDs where off = high
    pub fn into_output_high(self) -> Pin<T, pin_state::Gpio<'gpio, direction::Output>> {
        // TODO: the LED still flicks on briefly with this method
        // Ensure it's high before setting the dirsetp bits
        let mut pin = self.into_output();

        #[allow(deprecated)]
        pin.set_high();
        pin
    }
}

/// These methods are only available if
/// - pin is in GPIO state.
/// - pin direction is output.
#[allow(deprecated)]
impl<'gpio, T> OutputPin for Pin<T, pin_state::Gpio<'gpio, direction::Output>>
where
    T: PinId,
{
    /// Set the pin output to HIGH
    ///
    ///
    fn set_high(&mut self) {
        self.state.set[T::PORT].write(|w| unsafe { w.setp().bits(T::MASK) })
    }

    fn set_low(&mut self) {
        self.state.clr[T::PORT].write(|w| unsafe { w.clrp().bits(T::MASK) });
    }
}

#[allow(deprecated)]
impl<'gpio, T> StatefulOutputPin for Pin<T, pin_state::Gpio<'gpio, direction::Output>>
where
	T: PinId,
{
    fn is_set_high(&self) -> bool {
		self.state.pin[T::PORT].read().port().bits() & T::MASK == T::MASK
	}

    fn is_set_low(&self) -> bool {
        !self.state.pin[T::PORT].read().port().bits() & T::MASK == T::MASK
    }
}

macro_rules! pins {
    ($(
        $field:ident,
        $type:ident,
        $port:expr,
        $id:expr,
        $default_state_ty:ty,
        $default_state_val:expr;
    )*) => {
        /// Provides access to all pins
        ///
        /// This struct is a part of [`swm::Parts`].
        ///
        /// # Limitations
        ///
        /// This struct currently provides access to all pins that can be
        /// available on an LPC82x part. Please make sure that you are aware of
        /// which pins are actually available on your specific part, and only
        /// use those.
        ///
        /// [`swm::Parts`]: struct.Parts.html
        #[allow(missing_docs)]
        pub struct Pins {
            $(pub $field: Pin<$type, $default_state_ty>,)*
        }

        impl Pins {
            pub(crate) fn new() -> Self {
                Pins {
                    $(
                        $field: Pin {
                            id   : $type(()),
                            state: $default_state_val,
                        },
                    )*
                }
            }
        }


        $(
            /// Identifies a specific pin
            ///
            /// Pins can be accessed via the field `pins` of [`swm::Parts`].
            ///
            /// [`swm::Parts`]: struct.Parts.html
            #[allow(non_camel_case_types)]
            pub struct $type(());

            impl PinId for $type {
                const PORT: usize = $port;
                const ID  : u8    = $id;
                const MASK: u32   = 0x1 << $id;
            }
        )*
    }
}

// TODO: fill out properly
pins!(
    pio0_0 , PIO0_0 , 0, 0x00, pin_state::Unused, pin_state::Unused;
    pio0_1 , PIO0_1 , 0, 0x01, pin_state::Unused, pin_state::Unused;
    pio0_2 , PIO0_2 , 0, 0x02, pin_state::Unused, pin_state::Unused;
    pio0_3 , PIO0_3 , 0, 0x03, pin_state::Unused, pin_state::Unused;
    pio0_4 , PIO0_4 , 0, 0x04, pin_state::Unused, pin_state::Unused;
    pio0_5 , PIO0_5 , 0, 0x05, pin_state::Unused, pin_state::Unused;
    pio0_6 , PIO0_6 , 0, 0x06, pin_state::Unused, pin_state::Unused;
    pio0_7 , PIO0_7 , 0, 0x07, pin_state::Unused, pin_state::Unused;
    pio0_8 , PIO0_8 , 0, 0x08, pin_state::Unused, pin_state::Unused;
    pio0_9 , PIO0_9 , 0, 0x09, pin_state::Unused, pin_state::Unused;
    pio0_10, PIO0_10, 0, 0x0a, pin_state::Unused, pin_state::Unused;
    pio0_11, PIO0_11, 0, 0x0b, pin_state::Unused, pin_state::Unused;
    pio0_12, PIO0_12, 0, 0x0c, pin_state::Unused, pin_state::Unused;
    pio0_13, PIO0_13, 0, 0x0d, pin_state::Unused, pin_state::Unused;
    pio0_14, PIO0_14, 0, 0x0e, pin_state::Unused, pin_state::Unused;
    pio0_15, PIO0_15, 0, 0x0f, pin_state::Unused, pin_state::Unused;

    pio1_0 , PIO1_0 , 1, 0x00, pin_state::Unused, pin_state::Unused;
    pio1_1 , PIO1_1 , 1, 0x01, pin_state::Unused, pin_state::Unused;
    pio1_2 , PIO1_2 , 1, 0x02, pin_state::Unused, pin_state::Unused;
    pio1_3 , PIO1_3 , 1, 0x03, pin_state::Unused, pin_state::Unused;
    pio1_4 , PIO1_4 , 1, 0x04, pin_state::Unused, pin_state::Unused;
    pio1_5 , PIO1_5 , 1, 0x05, pin_state::Unused, pin_state::Unused;
    pio1_6 , PIO1_6 , 1, 0x06, pin_state::Unused, pin_state::Unused;
    pio1_7 , PIO1_7 , 1, 0x07, pin_state::Unused, pin_state::Unused;
);


// TODO: don't assume it's enabled (although it is at reset)
pub struct GPIO<State = init_state::Enabled> {
    pub(crate) gpio: raw::GPIO,
    _state: State,
}

impl GPIO<init_state::Disabled> {
    pub fn new(gpio: raw::GPIO) -> Self {
        GPIO {
            gpio: gpio,
            _state: init_state::Disabled,
        }
    }
    pub fn enable(mut self, syscon: &mut syscon::Handle) -> GPIO<init_state::Enabled> {
        dbg!(syscon.is_clock_enabled(&self.gpio));
        syscon.enable_clock(&mut self.gpio);
        dbg!(syscon.is_clock_enabled(&self.gpio));

        GPIO {
            gpio: self.gpio,
            _state: init_state::Enabled(()),
        }
    }
}

impl GPIO<init_state::Enabled> {
    pub fn disable(mut self, syscon: &mut syscon::Handle) -> GPIO<init_state::Disabled> {
        syscon.disable_clock(&mut self.gpio);

        GPIO {
            gpio: self.gpio,
            _state: init_state::Disabled,
        }
    }

    pub fn split(self) -> Parts {
        Parts {
            handle: self,
            pins: Pins::new(),
        }
    }
}

pub struct Parts {
    pub handle: GPIO<init_state::Enabled>,
    pub pins: Pins,
}

impl<State> GPIO<State> {
    /// Return the raw peripheral
    pub fn free(self) -> raw::GPIO {
        self.gpio
    }
}
