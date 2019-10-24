use crate::{raw, states::init_state, syscon};

// use crate::pins::{
//     Pins,
// };

pub fn wrap(iocon: raw::IOCON) -> Iocon {
    Iocon::new(iocon)
}

impl core::convert::From<raw::IOCON> for Iocon<init_state::Unknown> {
    fn from(raw: raw::IOCON) -> Self {
        Iocon::new(raw)
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
pub struct Iocon<State = init_state::Unknown> {
    raw: raw::IOCON,
    _state: State,
}

impl Iocon<init_state::Unknown> {
    pub(crate) fn new(iocon: raw::IOCON) -> Self {
        Iocon {
            raw: iocon,
            _state: init_state::Unknown,
        }
    }
}

impl<State> Iocon<State> {
    /// Enable IO pin configuration
    ///
    /// Turn on the clock for a disabled Iocon, enabling it.
    pub fn enabled(mut self, syscon: &mut syscon::Syscon) -> Iocon<init_state::Enabled> {
        // dbg!(syscon.is_clock_enabled(&self.iocon));
        syscon.enable_clock(&mut self.raw);
        // dbg!(syscon.is_clock_enabled(&self.iocon));

        Iocon {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

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
    pub fn disabled(mut self, syscon: &mut syscon::Syscon) -> Iocon<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);

        Iocon {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }

    pub fn release(self) -> raw::IOCON {
        self.raw
    }
}

impl Iocon<init_state::Enabled> {
    pub fn get_pio_0_8_config(&self) -> u32 {
        self.raw.pio0_8.read().bits()
    }

    pub fn get_pio_0_8_func(&self) -> u8 {
        self.raw.pio0_8.read().func().bits()
    }

    pub fn set_pio_0_8_swo_func(&self) {
        self.raw.pio0_8.modify(|_, w| w.func().alt4());
    }

    pub fn get_pio_0_10_config(&self) -> u32 {
        self.raw.pio0_10.read().bits()
    }

    pub fn get_pio_0_10_func(&self) -> u8 {
        self.raw.pio0_10.read().func().bits()
    }

    pub fn set_pio_0_10_swo_func(&self) {
        self.raw.pio0_10.modify(|_, w| w.func().alt6());
    }


    pub fn get_pio_0_22_config(&self) -> u32 {
        self.raw.pio0_22.read().bits()
    }

    pub fn configure_pio_0_22_as_usb0_vbus(&self) {
        self.raw.pio0_22.modify(|_, w|
            w
            .func().alt7() // FUNC7, pin configured as USB0_VBUS
            .mode().inactive() // MODE_INACT, no additional pin function
            .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
            .invert().disabled() // INV_DI, input function is not inverted
            .digimode().digital() // DIGITAL_EN, enable digital fucntion
            .od().normal() // OPENDRAIN_DI, open drain is disabled
        );
    }
}