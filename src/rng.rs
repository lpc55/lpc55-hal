/// Constrained RNG peripheral
pub struct Rng {
    rng: raw::RNG,
}

#[derive(Debug)]
// not sure why this kind of thing is not in `svd2rust`?
pub struct ModuleId {
    id: u16,
    maj_rev: u8,
    min_rev: u8,
    aperture: u8,
}

impl Rng {
    // the new constructor approach
    pub fn new(rng: raw::RNG) -> Rng {
        let _self = Self { rng };
        _self.enable();
        // _self.initialize_entropy();
        _self
    }

    pub fn module_id(&self) -> ModuleId {
        ModuleId {
            id: self.rng.moduleid.read().id().bits(),
            maj_rev: self.rng.moduleid.read().maj_rev().bits(),
            min_rev: self.rng.moduleid.read().min_rev().bits(),
            aperture: self.rng.moduleid.read().aperture().bits(),
        }
    }

    /// DO NOT CALL - doesn't work yet
    #[allow(dead_code, unreachable_code)]
    fn initialize_entropy(&self) {
        unimplemented!();

        // NB: there are functional and operational differences between
        // the A0 and A1 versions of the chip, see UM 48.14 (page 1033)
        //
        // A0/A1 refer to syscon.dieid.rev
        //
        // Here, we assume A1 (as maj.min = 3.2 seems to indicate this)
        // TODO: check this is true for the lpcxpresso55s69
        // TODO: check again when going into production

        // poll ONLINE_TEST_VAL
        let val = &self.rng.online_test_val.read();
        #[allow(non_snake_case)]
        let REF_CHI_SQUARED = 2;

        // dbg!("shift4x is", self.rng.counter_cfg.read().shift4x().bits());
        // let _: u8 =  self.rng.counter_cfg.read().shift4x().bits();

        loop {
            // activate CHI computing
            // dbg!(self.rng.online_test_cfg.read().activate().bit());  // <-- false
            self.rng
                .online_test_cfg
                .modify(|_, w| unsafe { w.data_sel().bits(4) });
            self.rng
                .online_test_cfg
                .modify(|_, w| w.activate().set_bit());
            // dbg!(self.rng.online_test_cfg.read().activate().bit());  // <-- true

            // dbg!(val.min_chi_squared().bits());  // <-- 15
            // dbg!(val.max_chi_squared().bits());  // <--  0

            // TODO: this gets stuck
            // unimplemented!("figure out how to make this not block");
            while val.min_chi_squared().bits() > val.max_chi_squared().bits() {}

            // dbg!("passed");

            if val.max_chi_squared().bits() > REF_CHI_SQUARED {
                // reset
                self.rng
                    .online_test_cfg
                    .modify(|_, w| w.activate().clear_bit());
                // increment SHIFT4X, which has bit width 3
                // self.rng.counter_cfg.modify(|_, w| (w.shift4x().bits() as u8) + 1);
                continue;
            } else {
                break;
            }
        }
    }

    fn enable(&self) {
        // TODO: check and enable clock
    }

    #[allow(dead_code)]
    fn disable(&self) {}

    pub fn free(self) -> raw::RNG {
        self.rng
    }

    pub fn get_random_u32(&self) -> u32 {
        for _ in 0..32 {
            while self.rng.counter_val.read().refresh_cnt() == 0 {
                // dbg!("was not zero");
            }
        }
        self.rng.random_number.read().bits()
    }
}

#[derive(Debug)]
pub enum Error {}

impl crate::hal::blocking::rng::Read for Rng {
    type Error = Error;

    fn read(&mut self, buffer: &mut [u8]) -> Result<(), Self::Error> {
        let mut i = 0usize;
        while i < buffer.len() {
            // get 4 bytes
            let random_word: u32 = self.get_random_u32();
            let bytes: [u8; 4] = random_word.to_ne_bytes();

            // copy to buffer as needed
            let n = core::cmp::min(4, buffer.len() - i);
            buffer[i..i + n].copy_from_slice(&bytes[..n]);
            i += n;
        }

        Ok(())
    }
}
