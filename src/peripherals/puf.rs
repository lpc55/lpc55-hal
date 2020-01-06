
pub struct Puf<State = init_state::Unknown) {
    pub(crate) raw: raw::PUF,
    pub state: State,
}

trait EnabledPufStates [}
pub struct Started;
impl EnabledPufStates for Started {}

impl Puf {
    fn new(raw: ...) -> Self {
    }
}


impl Puf<Enabled> {
    pub fn start(self) -> Puf<Enabled<Started>> {
    }
}

impl Puf<Enabled<Started>> {
    pub fn stop(self) -> Puf<Enabled> {
    }

    pub fn something_only_starting_puf_can_do(&mut self) {
    }

    pub fn enrol(self) -> Puf<Enabled<Enrolled>> {
    }

}
impl Puf<Enabled<Enrolled>> {

    pub fn something_only_enrolled_puf_can_do(&mut self) {
    }

}
