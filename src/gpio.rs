use crate::hal::digital::v2::{OutputPin, StatefulOutputPin};

use crate::{
    pins::{Pin, PinId},
    raw,
    raw::gpio::{CLR, DIRSET, PIN, SET},
    states::{init_state, pin_state},
    syscon,
};

// /// Contains types to indicate the direction of GPIO pins
// pub mod direction {
//     /// Implemented by types that indicate GPIO pin direction
//     pub trait Direction {}

//     pub struct Unknown;
//     impl Direction for Unknown {}

//     pub struct Input;
//     impl Direction for Input {}

//     pub struct Output;
//     impl Direction for Output {}

//     pub trait NotOutput: Direction {}
//     impl NotOutput for Unknown {}
//     impl NotOutput for Input {}
// }

// // pub trait Level;
// // pub struct Low;
// // impl Level for Low;
// // pub struct High;
// // impl Level for High;

// pub enum Level {
//     Low,
//     High,
// }

pub use crate::states::gpio::*;

use crate::reg_cluster;
reg_cluster!(DIRSET, DIRSET, raw::GPIO, dirset);
reg_cluster!(PIN, PIN, raw::GPIO, pin);
reg_cluster!(SET, SET, raw::GPIO, set);
reg_cluster!(CLR, CLR, raw::GPIO, clr);

impl<T, D> Pin<T, pin_state::Gpio<D>>
where
    T: PinId,
    D: direction::NotOutput,
{
    pub fn into_output(self, initial: Level) -> Pin<T, pin_state::Gpio<direction::Output>> {
        match initial {
            Level::High => self.state.set[T::PORT].write(|w| unsafe { w.setp().bits(T::MASK) }),
            Level::Low => self.state.clr[T::PORT].write(|w| unsafe { w.clrp().bits(T::MASK) }),
        }

        self.state.dirset[T::PORT].write(|w| unsafe { w.dirsetp().bits(T::MASK) });

        Pin {
            id: self.id,

            state: pin_state::Gpio {
                dirset: crate::reg_proxy::RegClusterProxy::new(),
                pin: crate::reg_proxy::RegClusterProxy::new(),
                set: crate::reg_proxy::RegClusterProxy::new(),
                clr: crate::reg_proxy::RegClusterProxy::new(),

                _direction: direction::Output,
            },
        }
    }

    // Alternatively, remove level parameter, where `into_output` has unspecified level,
    // and add methods `into_output_{low,high}` like so
    //
    // pub fn into_output_high(self) -> Pin<T, pin_state::Gpio<'gpio, direction::Output>> {
    //     self.state.set[T::PORT].write(|w| unsafe { w.setp().bits(T::MASK) });
    //     self.into_output()
    // }
}
/// These methods are only available if
/// - pin is in GPIO state.
/// - pin direction is output.
impl<T> OutputPin for Pin<T, pin_state::Gpio<direction::Output>>
where
    T: PinId,
{
    type Error = void::Void;

    /// Set the pin output to HIGH
    fn set_high(&mut self) -> Result<(), Self::Error> {
        self.state.set[T::PORT].write(|w| unsafe { w.setp().bits(T::MASK) });
        Ok(())
    }

    /// Set the pin output to LOW
    fn set_low(&mut self) -> Result<(), Self::Error> {
        self.state.clr[T::PORT].write(|w| unsafe { w.clrp().bits(T::MASK) });
        Ok(())
    }
}

impl<T> StatefulOutputPin for Pin<T, pin_state::Gpio<direction::Output>>
where
    T: PinId,
{
    fn is_set_high(&self) -> Result<bool, Self::Error> {
        Ok(self.state.pin[T::PORT].read().port().bits() & T::MASK == T::MASK)
    }

    fn is_set_low(&self) -> Result<bool, Self::Error> {
        Ok(!self.state.pin[T::PORT].read().port().bits() & T::MASK == T::MASK)
    }
}

// // TODO: don't assume it's enabled (although it is at reset)
// pub struct Gpio<State = init_state::Enabled> {
//     pub(crate) raw: raw::GPIO,
//     _state: State,
// }

// pub fn wrap(gpio: raw::GPIO) -> Gpio<init_state::Disabled> {
//     Gpio::new(gpio)
// }

// impl Gpio<init_state::Disabled> {
//     pub fn new(gpio: raw::GPIO) -> Self {
//         Gpio {
//             raw: gpio,
//             _state: init_state::Disabled,
//         }
//     }

crate::wrap_stateful_peripheral!(Gpio, GPIO);

impl Gpio {
    /// Consumes disabled Gpio, returns an enabled one
    pub fn enabled(mut self, syscon: &mut syscon::Syscon) -> Gpio<init_state::Enabled> {
        // dbg!(syscon.is_clock_enabled(&self.gpio));
        syscon.enable_clock(&mut self.raw);
        // dbg!(syscon.is_clock_enabled(&self.gpio));

        Gpio {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    /// Consumes enabled Gpio, returns a disabled one
    pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> Gpio<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);

        Gpio {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

// impl<State> Gpio<State> {
//     /// Return the raw peripheral
//     pub fn release(self) -> raw::GPIO {
//         self.raw
//     }
// }