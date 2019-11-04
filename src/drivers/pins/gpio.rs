use crate::traits::{
    wg::{
        digital::v2::{
            OutputPin,
            StatefulOutputPin,
        },
    }
};

use crate::typestates::{
    pin::{
        state,
        gpio::{
            direction,
            Level,
        },
        PinId,
    },
};

use super::Pin;

use crate::{
    raw::gpio::{
        CLR,
        DIRSET,
        PIN,
        SET,
    },
    reg_cluster,
};

reg_cluster!(DIRSET, DIRSET, raw::GPIO, dirset);
reg_cluster!(PIN, PIN, raw::GPIO, pin);
reg_cluster!(SET, SET, raw::GPIO, set);
reg_cluster!(CLR, CLR, raw::GPIO, clr);


impl<T> OutputPin for Pin<T, state::Gpio<direction::Output>>
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

impl<T> StatefulOutputPin for Pin<T, state::Gpio<direction::Output>>
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

impl<T, D> Pin<T, state::Gpio<D>>
where
    T: PinId,
    D: direction::NotOutput,
{
    pub fn into_output_high(self) -> Pin<T, state::Gpio<direction::Output>> {
        self.into_output(Level::High)
    }
    pub fn into_output_low(self) -> Pin<T, state::Gpio<direction::Output>> {
        self.into_output(Level::Low)
    }
    pub fn into_output(self, initial: Level) -> Pin<T, state::Gpio<direction::Output>> {
        match initial {
            Level::High => self.state.set[T::PORT].write(|w| unsafe { w.setp().bits(T::MASK) }),
            Level::Low => self.state.clr[T::PORT].write(|w| unsafe { w.clrp().bits(T::MASK) }),
        }

        self.state.dirset[T::PORT].write(|w| unsafe { w.dirsetp().bits(T::MASK) });

        Pin {
            id: self.id,

            state: state::Gpio {
                dirset: crate::reg_proxy::RegClusterProxy::new(),
                pin: crate::reg_proxy::RegClusterProxy::new(),
                set: crate::reg_proxy::RegClusterProxy::new(),
                clr: crate::reg_proxy::RegClusterProxy::new(),

                _direction: direction::Output,
            },
        }
    }
}

