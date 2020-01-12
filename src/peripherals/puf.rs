use crate::{
    raw,
    peripherals::{
        syscon::Syscon,
    },
    typestates::{
        init_state,
    }
};

trait PufStates {}    
pub struct Started;    
impl PufStates for Started {}    
pub struct Enrolled;    
impl PufStates for Enrolled {}    

/// PUF error
#[derive(Debug)]
pub enum Error {
    /// PUF Command could not start
    CommandFailedToStart,
    /// PUF Command could not complete
    CommandFailed,
    /// PUF Command is not allowed
    NotAllowed,
}
pub type Result<T> = core::result::Result<T, Error>;

crate::wrap_stateful_peripheral!(Puf, PUF);

impl<State> Puf<State> {
    pub fn enabled(mut self, syscon: &mut Syscon) -> Puf<init_state::Enabled> {
        syscon.enable_clock(&mut self.raw);
        self.raw.pwrctrl.write(|w| {w.ramon().set_bit()});
        while self.raw.stat.read().busy().bit_is_set()
        {
        }

        Puf {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    pub fn disabled(mut self, syscon: &mut Syscon) -> Puf<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);
        self.raw.pwrctrl.write(|w| {w.ramon().clear_bit()});

        Puf {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }
}

impl Puf<init_state::Enabled> {

    // Enroll a new key for the PUF.  Writes 1192-byte AC to buffer which should be stored in NV memory.
    // Enroll should occur once per device.
    pub fn enroll(&self, ac_buffer: &mut [u8; 1192]) -> Result<()> {
        if self.raw.allow.read().allowenroll().bit_is_clear() {
            return Err(Error::NotAllowed);
        }

        //FIX PAC
        self.raw.ctrl.write(|w| unsafe {w.bits(1<<1)} );

        // Wait for command to start being busy or get an error
        while self.raw.stat.read().busy().bit_is_clear() && self.raw.stat.read().error().bit_is_clear() {
        }

        if self.raw.stat.read().error().bit_is_set() {
            return Err(Error::CommandFailedToStart);
        }

        let mut count = 0;
        while self.raw.stat.read().busy().bit_is_set() {
            if self.raw.stat.read().codeoutavail().bit_is_set() {
                let ac_word = self.raw.codeoutput.read().bits();

                ac_buffer[count..count+4].copy_from_slice( &ac_word.to_ne_bytes() );
                count += 4;
            }
        }

        if self.raw.stat.read().success().bit_is_clear() {
            return Err(Error::CommandFailed);
        }

        Ok(())
    }


    pub fn version(&self) -> u32 {
        self.raw.version.read().bits()
    }

    // Put PUF into reset state.
    pub fn reset(&self) -> (){

    }

}

impl<State> core::fmt::Debug for Puf<State> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        writeln!(f, "").unwrap();
        writeln!(f, "  control  = x{:X}", self.raw.ctrl.read().bits()).unwrap();
        writeln!(f, "  ramstatus= x{:X}", self.raw.pwrctrl.read().bits()).unwrap();
        writeln!(f, "  status   = x{:X}", self.raw.stat.read().bits()).unwrap();
        writeln!(f, "  if-status= x{:X}", self.raw.ifstat.read().bits()).unwrap();
        writeln!(f, "  allow    = x{:X}", self.raw.allow.read().bits()).unwrap();
        writeln!(f, "  keyindex = x{:X}", self.raw.keyindex.read().bits())
    }
}
