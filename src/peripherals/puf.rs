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
pub struct Enrolled;    
impl PufStates for Started {}    
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

// Must enroll once per device.  Enrolling consumes the PUF and device must be restarted.
impl Puf<init_state::Enabled> {

    fn wait_for_cmd(&self) -> Result<()> {
        // Wait for command to start being busy or get an error
        while self.raw.stat.read().busy().bit_is_clear() && self.raw.stat.read().error().bit_is_clear() {
        }

        if self.raw.stat.read().error().bit_is_set() {
            return Err(Error::CommandFailedToStart);
        }
        Ok(())
    }

    fn check_success(&self) -> Result<()> {
        if self.raw.stat.read().success().bit_is_clear() {
            return Err(Error::CommandFailed);
        }
        Ok(())
    }

    // Enroll a new key for the PUF.  Writes 1192-byte AC to buffer which should be stored in NV memory.
    // Enroll should occur once per device.
    pub fn enroll(self, ac_buffer: &mut [u8; 1192]) -> Result< Puf<init_state::Enabled<Enrolled>> > {
        if self.raw.allow.read().allowenroll().bit_is_clear() {
            return Err(Error::NotAllowed);
        }

        //FIX PAC
        self.raw.ctrl.write(|w| unsafe {w.bits( 1<<1 /*ENROLL*/)} );

        self.wait_for_cmd()?;

        let mut count = 0;
        while self.raw.stat.read().busy().bit_is_set() {
            if self.raw.stat.read().codeoutavail().bit_is_set() {
                let ac_word = self.raw.codeoutput.read().bits();

                ac_buffer[count..count+4].copy_from_slice( &ac_word.to_ne_bytes() );
                count += 4;
            }
        }

        self.check_success()?;

        Ok(Puf{
            raw: self.raw,
            _state: init_state::Enabled(Enrolled),
        })
    }

    pub fn start(self, ac_buffer: &[u8; 1192]) -> Result< Puf<init_state::Enabled<Started>> >{
        if self.raw.allow.read().allowstart().bit_is_clear() {
            return Err(Error::NotAllowed);
        }
        
        //FIX PAC
        self.raw.ctrl.write(|w| unsafe {w.bits( 1<<2 /*START*/)} );

        self.wait_for_cmd()?;

        let mut word_buf = [0u8; 4];
        let mut i = 0;
        while self.raw.stat.read().busy().bit_is_set() {
            if self.raw.stat.read().codeinreq().bit_is_set() {
                word_buf.copy_from_slice(&ac_buffer[i..i+4]);
                let word = u32::from_ne_bytes(word_buf);
                self.raw.codeinput.write(|w| unsafe{w.bits(word)});
                i += 4;
            }
        }

        self.check_success()?;

        Ok(Puf{
            raw: self.raw,
            _state: init_state::Enabled(Started),
        })
    }


    pub fn version(&self) -> u32 {
        self.raw.version.read().bits()
    }

    // Put PUF into reset state.
    pub fn reset(&self) -> (){

    }

}

// Once a PUF is started, you can generate or derive keys.
// Check NXP AN2324 for the best explanation.
// 1.  First generate a key using `GenerateKey` or `SetKey`.  Both will output
//     a Key Code (KC), which is used to derive a key later.  `GenerateKey` and `SetKey`
//     differ in that `SetKey` is based on a User input key/seed and `GenerateKey` is generated randomly by PUF.
// 2. The KC is a fixed 4-byte header with formation on key index, length, etc.
// 3. Derive a real key using `GetKey` and an input `KC`.  The key will be generated and given to the proper
//    IP via secure bus, or given raw if that was the index in `KC`.
impl Puf<init_state::Enabled<Started>> {

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
