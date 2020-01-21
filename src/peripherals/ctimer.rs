use crate::{
    raw,
    peripherals::{
        syscon::Syscon,
    },
    typestates::{
        init_state,
    }
};



crate::wrap_stateful_peripheral!(Ctimer, CTIMER1);

impl<State> Ctimer<State> {
    pub fn enabled(mut self, syscon: &mut Syscon) -> Ctimer <init_state::Enabled> {
        Ctimer{
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    pub fn disabled(mut self, syscon: &mut Syscon) -> Ctimer <init_state::Disabled> {
        Ctimer{
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}


