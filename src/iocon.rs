use cortex_m_semihosting::dbg;

use crate::{
    gpio::{self, GPIO},
    init_state, raw, syscon,
};

use self::pin_state::PinState;

pub struct IOCON {
    iocon: raw::IOCON,
}

impl IOCON {
    pub fn new(iocon: raw::IOCON) -> Self {
        IOCON { iocon }
    }

    /// Splits the IOCON API into its component parts
    ///
    /// This is the regular way to access the IOCON API. It exists as an explicit
    /// step, as it's no longer possible to gain access to the raw peripheral
    /// using [`IOCON::free`] after you've called this method.
    pub fn split(self) -> Parts {
        Parts {
            handle: Handle::new(self.iocon),
            pins: Pins::new(),
            // movable_functions: MovableFunctions::new(),
            // fixed_functions: FixedFunctions::new(),
        }
    }

    /// Return the raw peripheral
    ///
    /// This method serves as an escape hatch from the HAL API. It returns the
    /// raw peripheral, allowing you to do whatever you want with it, without
    /// limitations imposed by the API.
    ///
    /// If you are using this method because a feature you need is missing from
    /// the HAL API, please [open an issue] or, if an issue for your feature
    /// request already exists, comment on the existing issue, so we can
    /// prioritize it accordingly.
    ///
    /// [open an issue]: https://github.com/lpc-rs/lpc8xx-hal/issues
    pub fn free(self) -> raw::IOCON {
        self.iocon
    }
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

/// The main API for the IO pin configuration (IOCON)
///
/// Provides access to all types that make up the IOCON API. Please refer to the
/// [module documentation] for more information.
///
/// [module documentation]: index.html
pub struct Parts {
    /// Handle to the IO pin configuration
    pub handle: Handle<init_state::Disabled>,

    /// Pins that can be used for GPIO or other functions
    pub pins: Pins,

    // /// Movable functions
    // pub movable_functions: MovableFunctions,

    // /// Fixed functions
    // pub fixed_functions: FixedFunctions,
}

/// Handle to the IOCON peripheral
///
/// Can be used to enable and disable the IO pin configuration. It is also required by
/// other parts of the API to synchronize access the the underlying registers,
/// wherever this is required.
///
/// Please refer to the [module documentation] for more information about the
/// PMU.
///
/// [module documentation]: index.html
pub struct Handle<State = init_state::Disabled> {
    iocon: raw::IOCON,
    _state: State,
}

impl Handle<init_state::Disabled> {
    pub(crate) fn new(iocon: raw::IOCON) -> Self {
        Handle {
            iocon: iocon,
            _state: init_state::Disabled,
        }
    }

    /// Enable the IO pin configuration
    ///
    /// This method is only available, if `IOCON` is in the [`Disabled`] state.
    /// Code that attempts to call this method when the peripheral is already
    /// enabled will not compile.
    ///
    /// Consumes this instance of `IOCON` and returns another instance that has
    /// its `State` type parameter set to [`Enabled`].
    ///
    /// [`Disabled`]: ../init_state/struct.Disabled.html
    /// [`Enabled`]: ../init_state/struct.Enabled.html
    pub fn enable(mut self, syscon: &mut syscon::Handle) -> Handle<init_state::Enabled> {
        dbg!(syscon.is_clock_enabled(&self.iocon));
        syscon.enable_clock(&mut self.iocon);
        dbg!(syscon.is_clock_enabled(&self.iocon));

        Handle {
            iocon: self.iocon,
            _state: init_state::Enabled(()),
        }
    }
}

impl Handle<init_state::Enabled> {
    /// Disable the IO pin configuration
    ///
    /// This method is only available, if `IOCON` is in the [`Enabled`] state.
    /// Code that attempts to call this method when the peripheral is already
    /// disabled will not compile.
    ///
    /// Consumes this instance of `IOCON` and returns another instance that has
    /// its `State` type parameter set to [`Disabled`].
    ///
    /// [`Enabled`]: ../init_state/struct.Enabled.html
    /// [`Disabled`]: ../init_state/struct.Disabled.html
    pub fn disable(mut self, syscon: &mut syscon::Handle) -> Handle<init_state::Disabled> {
        syscon.disable_clock(&mut self.iocon);

        Handle {
            iocon: self.iocon,
            _state: init_state::Disabled,
        }
    }
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
pub struct Pin<T: PinId, S: PinState> {
    pub(crate) id: T,
    pub(crate) state: S,
}

impl<T> Pin<T, pin_state::Unused>
where
    T: PinId,
{
    /// Transition pin to GPIO state
    pub fn into_gpio_pin(self, gpio: &GPIO) -> Pin<T, pin_state::Gpio<gpio::direction::Unknown>> {
        Pin {
            id: self.id,
            state: pin_state::Gpio {
                dirset: &gpio.gpio.dirset,
                pin: &gpio.gpio.pin,
                set: &gpio.gpio.set,
                clr: &gpio.gpio.clr,

                _direction: gpio::direction::Unknown,
            },
        }
    }
}


