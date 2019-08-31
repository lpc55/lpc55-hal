#[allow(deprecated)]
use embedded_hal::digital::{OutputPin, StatefulOutputPin};
// embedded_hal::digital::v2_compat::*;

use cortex_m_semihosting::dbg;

use crate::{
    init_state, raw,
    iocon::{pin_state, Pin, PinId},
    syscon,
};

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
}

impl<State> GPIO<State> {
    /// Return the raw peripheral
    pub fn free(self) -> raw::GPIO {
        self.gpio
    }
}
