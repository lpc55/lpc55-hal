use crate::{
    init_state, raw, syscon,
};

use crate::pins::{
    Pins,
};

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
            iocon,
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
        // dbg!(syscon.is_clock_enabled(&self.iocon));
        syscon.enable_clock(&mut self.iocon);
        // dbg!(syscon.is_clock_enabled(&self.iocon));

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

