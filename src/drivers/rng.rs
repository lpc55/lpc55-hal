use crate::traits::established::blocking::rng;

use crate::states::{
    init_state,
};

use crate::Rng;

#[derive(Debug)]
pub enum Error {}

impl rng::Read for Rng<init_state::Enabled> {
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
