use crate::{raw, states::init_state, syscon};

// use crate::pins::{
//     Pins,
// };

pub fn wrap(iocon: raw::IOCON) -> Iocon {
    Iocon::new(iocon)
}

impl Iocon {
    pub fn release(self) -> raw::IOCON {
        self.raw
    }
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
pub struct Iocon<State = init_state::Disabled> {
    raw: raw::IOCON,
    _state: State,
}

impl Iocon<init_state::Disabled> {
    pub(crate) fn new(iocon: raw::IOCON) -> Self {
        Iocon {
            raw: iocon,
            _state: init_state::Disabled,
        }
    }

    /// Enable IO pin configuration
    ///
    /// Turn on the clock for a disabled Iocon, enabling it.
    pub fn enable(mut self, syscon: &mut syscon::Handle) -> Iocon<init_state::Enabled> {
        // dbg!(syscon.is_clock_enabled(&self.iocon));
        syscon.enable_clock(&mut self.raw);
        // dbg!(syscon.is_clock_enabled(&self.iocon));

        Iocon {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }
}

impl Iocon<init_state::Enabled> {
    /// Disable IO pin configuration
    ///
    /// Turns off the clock for an enabled Iocon, disabling it.
    /// Code that attempts to call this method when the peripheral is already
    /// disabled will not compile.
    ///
    /// Consumes this instance of `IOCON` and returns another instance that has
    /// its `State` type parameter set to [`Disabled`].
    ///
    /// [`Enabled`]: ../init_state/struct.Enabled.html
    /// [`Disabled`]: ../init_state/struct.Disabled.html
    pub fn disable(mut self, syscon: &mut syscon::Handle) -> Iocon<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);

        Iocon {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}
