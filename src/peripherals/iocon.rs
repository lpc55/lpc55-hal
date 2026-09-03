use crate::{peripherals::syscon, raw, typestates::init_state};

// use crate::pins::{
//     Pins,
// };

crate::wrap_stateful_peripheral!(Iocon, IOCON);

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
}

#[derive(Debug, Clone, Copy)]
pub enum GpioMode {
    // No pull-down/pull-up resistor enabled
    Inactive,
    PullDown,
    PullUp,
    /// Repeater Mode
    Repeater,
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
        self.raw.pio0_22.modify(
            |_, w| {
                w.func()
                    .alt7() // FUNC7, pin configured as USB0_VBUS
                    .mode()
                    .inactive() // MODE_INACT, no additional pin function
                    .slew()
                    .standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
                    .invert()
                    .disabled() // INV_DI, input function is not inverted
                    .digimode()
                    .digital() // DIGITAL_EN, enable digital fucntion
                    .od()
                    .normal()
            }, // OPENDRAIN_DI, open drain is disabled
        );
    }
}

macro_rules! gpio_modes {
    ($($field:ident, $func:ident;)*) => {
        impl Iocon<init_state::Enabled> {
            $(
                pub fn $func(&self, mode: GpioMode) {
                    self.raw.$field.modify(|_, w| match mode {
                        GpioMode::Inactive => w.mode().inactive(),
                        GpioMode::PullDown => w.mode().pull_down(),
                        GpioMode::PullUp => w.mode().pull_up(),
                        GpioMode::Repeater => w.mode().repeater(),
                    })
                }
            )*
        }
    }
}

gpio_modes!(
    pio0_0, set_gpio_pio0_0_mode;
    pio0_1, set_gpio_pio0_1_mode;
    pio0_2, set_gpio_pio0_2_mode;
    pio0_3, set_gpio_pio0_3_mode;
    pio0_4, set_gpio_pio0_4_mode;
    pio0_5, set_gpio_pio0_5_mode;
    pio0_6, set_gpio_pio0_6_mode;
    pio0_7, set_gpio_pio0_7_mode;
    pio0_8, set_gpio_pio0_8_mode;
    pio0_9, set_gpio_pio0_9_mode;
    pio0_10, set_gpio_pio0_10_mode;
    pio0_11, set_gpio_pio0_11_mode;
    pio0_12, set_gpio_pio0_12_mode;
    pio0_13, set_gpio_pio0_13_mode;
    pio0_14, set_gpio_pio0_14_mode;
    pio0_15, set_gpio_pio0_15_mode;
    pio0_16, set_gpio_pio0_16_mode;
    pio0_17, set_gpio_pio0_17_mode;
    pio0_18, set_gpio_pio0_18_mode;
    pio0_19, set_gpio_pio0_19_mode;
    pio0_20, set_gpio_pio0_20_mode;
    pio0_21, set_gpio_pio0_21_mode;
    pio0_22, set_gpio_pio0_22_mode;
    pio0_23, set_gpio_pio0_23_mode;
    pio0_24, set_gpio_pio0_24_mode;
    pio0_25, set_gpio_pio0_25_mode;
    pio0_26, set_gpio_pio0_26_mode;
    pio0_27, set_gpio_pio0_27_mode;
    pio0_28, set_gpio_pio0_28_mode;
    pio0_29, set_gpio_pio0_29_mode;
    pio0_30, set_gpio_pio0_30_mode;
    pio0_31, set_gpio_pio0_31_mode;
    pio1_0, set_gpio_pio1_0_mode;
    pio1_1, set_gpio_pio1_1_mode;
    pio1_2, set_gpio_pio1_2_mode;
    pio1_3, set_gpio_pio1_3_mode;
    pio1_4, set_gpio_pio1_4_mode;
    pio1_5, set_gpio_pio1_5_mode;
    pio1_6, set_gpio_pio1_6_mode;
    pio1_7, set_gpio_pio1_7_mode;
    pio1_8, set_gpio_pio1_8_mode;
    pio1_9, set_gpio_pio1_9_mode;
    pio1_10, set_gpio_pio1_10_mode;
    pio1_11, set_gpio_pio1_11_mode;
    pio1_12, set_gpio_pio1_12_mode;
    pio1_13, set_gpio_pio1_13_mode;
    pio1_14, set_gpio_pio1_14_mode;
    pio1_15, set_gpio_pio1_15_mode;
    pio1_16, set_gpio_pio1_16_mode;
    pio1_17, set_gpio_pio1_17_mode;
    pio1_18, set_gpio_pio1_18_mode;
    pio1_19, set_gpio_pio1_19_mode;
    pio1_20, set_gpio_pio1_20_mode;
    pio1_21, set_gpio_pio1_21_mode;
    pio1_22, set_gpio_pio1_22_mode;
    pio1_23, set_gpio_pio1_23_mode;
    pio1_24, set_gpio_pio1_24_mode;
    pio1_25, set_gpio_pio1_25_mode;
    pio1_26, set_gpio_pio1_26_mode;
    pio1_27, set_gpio_pio1_27_mode;
    pio1_28, set_gpio_pio1_28_mode;
    pio1_29, set_gpio_pio1_29_mode;
    pio1_30, set_gpio_pio1_30_mode;
    pio1_31, set_gpio_pio1_31_mode;
);
