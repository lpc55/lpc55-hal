// extern crate core;
use core::cmp;

use crate::raw::RNG;

/// Constrained RNG peripheral
pub struct Rng {
    rng: RNG,
}

impl Rng {

    // the new constructor approach
    pub fn new(rng: RNG) -> Rng {
        let _self = Self { rng: rng };
        _self.enable();
        _self
    }

    fn enable(&self) {
        // it seems nothing is necessary with default configuration
    }

    #[allow(dead_code)]
    fn disable(&self) {
    }

    pub fn free(self) -> RNG {
        self.rng
    }

    pub fn get_random_u32(&self)-> u32 {
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
            let n = cmp::min(4, buffer.len() - i);
            buffer[i..i + n].copy_from_slice(&bytes[..n]);
            i += n;
        }

        Ok(())

    }
}
