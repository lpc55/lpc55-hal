use crate::{
    raw::gpio::{CLR, DIRSET, PIN, SET},
    peripherals::gpio::Gpio,
    states::{init_state, pin_state},
};

use crate::hal::digital::v2::{OutputPin, StatefulOutputPin};

// bleeee *-imports
pub use crate::states::gpio::*;


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

static mut TAKEN: bool = false;

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
        /// This struct is a part of [`iocon::Parts`].
        ///
        /// # Limitations
        ///
        /// This struct currently provides access to all pins that can be
        /// available on an LPC82x part. Please make sure that you are aware of
        /// which pins are actually available on your specific part, and only
        /// use those.
        ///
        /// [`iocon::Parts`]: struct.Parts.html
        #[allow(missing_docs)]
        pub struct Pins {
            $(pub $field: Pin<$type, $default_state_ty>,)*
        }

        impl Pins {

            pub fn take() -> Option<Self> {
                if unsafe { TAKEN } {
                    None
                } else {
                    Some(unsafe {
                        TAKEN = true;
                        Pins::steal()
                    } )
                }
            }

            pub fn release(self) {
                unsafe { TAKEN = false };
            }

            pub unsafe fn steal() -> Self {
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
            /// Pins can be accessed via the field `pins` of [`iocon::Parts`].
            ///
            /// [`iocon::Parts`]: struct.Parts.html
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

    pio0_22, PIO0_22, 0, 0x16, pin_state::Unused, pin_state::Unused;

    pio1_0 , PIO1_0 , 1, 0x00, pin_state::Unused, pin_state::Unused;
    pio1_1 , PIO1_1 , 1, 0x01, pin_state::Unused, pin_state::Unused;
    pio1_2 , PIO1_2 , 1, 0x02, pin_state::Unused, pin_state::Unused;
    pio1_3 , PIO1_3 , 1, 0x03, pin_state::Unused, pin_state::Unused;
    pio1_4 , PIO1_4 , 1, 0x04, pin_state::Unused, pin_state::Unused;
    pio1_5 , PIO1_5 , 1, 0x05, pin_state::Unused, pin_state::Unused;
    pio1_6 , PIO1_6 , 1, 0x06, pin_state::Unused, pin_state::Unused;
    pio1_7 , PIO1_7 , 1, 0x07, pin_state::Unused, pin_state::Unused;
);

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
pub struct Pin<T: PinId, S: pin_state::PinState> {
    pub(crate) id: T,
    #[allow(dead_code)]
    pub(crate) state: S,
}

impl<T> Pin<T, pin_state::Unused>
where
    T: PinId,
{
    /// Transition pin to GPIO state
    pub fn into_gpio_pin(
        self,
        _: &mut Gpio<init_state::Enabled>,
    ) -> Pin<T, pin_state::Gpio<direction::Unknown>> {
        Pin {
            id: self.id,
            state: pin_state::Gpio {
                dirset: crate::reg_proxy::RegClusterProxy::new(),
                pin: crate::reg_proxy::RegClusterProxy::new(),
                set: crate::reg_proxy::RegClusterProxy::new(),
                clr: crate::reg_proxy::RegClusterProxy::new(),

                _direction: direction::Unknown,
            },
        }
    }
}

// impl<T, U> Pin<T, U>
// where
//     T: PinId,
// {
//     pub fn pin_info(&self, iocon: &iocon) -> u32 {
//         self.raw.pio0_22.modify(|_, w|
//     }

// }

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

use crate::reg_cluster;
reg_cluster!(DIRSET, DIRSET, raw::GPIO, dirset);
reg_cluster!(PIN, PIN, raw::GPIO, pin);
reg_cluster!(SET, SET, raw::GPIO, set);
reg_cluster!(CLR, CLR, raw::GPIO, clr);

