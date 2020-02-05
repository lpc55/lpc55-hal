use crate::{
    raw,
    peripherals::{
        syscon::Syscon,
        pmc::Pmc,
    },
    typestates::{
        init_state,
    }
};

crate::wrap_stateful_peripheral!(Adc, ADC0);

impl<State> Adc<State> {
    pub fn enabled(mut self, pmc: &mut Pmc, syscon: &mut Syscon) -> Adc<init_state::Enabled> {
        syscon.enable_clock(&mut self.raw);
        syscon.raw.adcclkdiv.write(|w| {w.reset().set_bit()});
        syscon.raw.adcclkdiv.write(|w| unsafe {w.div().bits(0)});
        syscon.raw.adcclkdiv.write(|w| unsafe {w.bits(0)});

        syscon.raw.adcclksel.write(|w| {w.sel().fro96()});

        pmc.power_on(&mut self.raw);

        self.raw.ctrl.write(|w| {w.rst().set_bit()});   // Reset
        self.raw.ctrl.write(|w| {w.rst().clear_bit()});

        self.raw.ctrl.write(|w| {w.rstfifo0().set_bit()});  // Reset FIFO
        self.raw.ctrl.write(|w| {w.rstfifo0().clear_bit()});

        self.raw.ctrl.write(|w| {w.rstfifo1().set_bit()});  // Reset FIFO
        self.raw.ctrl.write(|w| {w.rstfifo1().clear_bit()});

        self.raw.ctrl.write(|w| {w.adcen().clear_bit()}); // Turn off prior to configuration
        self.raw.cfg.write(|w| {w.pwren().clear_bit()}); //Must be cleared prior to ADC being enabled


        Adc {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    pub fn disabled(mut self, syscon: &mut Syscon) -> Adc<init_state::Disabled> {
        self.raw.ctrl.write(|w| {w.adcen().clear_bit()});
        syscon.raw.adcclksel.write(|w| {w.sel().none()});
        syscon.disable_clock(&mut self.raw);

        Adc {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

