use crate::traits::rand_core;

use crate::typestates::init_state;

use crate::Rng;

#[derive(Debug)]
pub enum Error {}

impl rand_core::RngCore for Rng<init_state::Enabled> {
    fn next_u32(&mut self) -> u32 {
        self.get_random_u32()
    }

    fn next_u64(&mut self) -> u64 {
        rand_core::impls::next_u64_via_u32(self)
    }

    fn fill_bytes(&mut self, dest: &mut [u8]) {
        rand_core::impls::fill_bytes_via_next(self, dest)
    }

    fn try_fill_bytes(&mut self, dest: &mut [u8]) -> Result<(), rand_core::Error> {
        self.fill_bytes(dest);
        Ok(())
    }
}

impl rand_core::CryptoRng for Rng<init_state::Enabled> {}
