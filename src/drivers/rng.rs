#[derive(Debug)]
pub enum Error {}

#[cfg(feature = "rand-core-06")]
mod rand06 {
    use crate::typestates::init_state;
    use crate::Rng;

    use rand_core06::RngCore;

    impl RngCore for Rng<init_state::Enabled> {
        fn next_u32(&mut self) -> u32 {
            self.get_random_u32()
        }

        fn next_u64(&mut self) -> u64 {
            rand_core06::impls::next_u64_via_u32(self)
        }

        fn fill_bytes(&mut self, dest: &mut [u8]) {
            rand_core06::impls::fill_bytes_via_next(self, dest)
        }

        fn try_fill_bytes(&mut self, dest: &mut [u8]) -> Result<(), rand_core06::Error> {
            self.fill_bytes(dest);
            Ok(())
        }
    }

    impl rand_core06::CryptoRng for Rng<init_state::Enabled> {}
}

#[cfg(feature = "rand-core-09")]
mod rand09 {
    use crate::typestates::init_state;
    use crate::Rng;

    use rand_core09::RngCore;

    impl RngCore for Rng<init_state::Enabled> {
        fn next_u32(&mut self) -> u32 {
            self.get_random_u32()
        }

        fn next_u64(&mut self) -> u64 {
            rand_core09::impls::next_u64_via_u32(self)
        }

        fn fill_bytes(&mut self, dest: &mut [u8]) {
            rand_core09::impls::fill_bytes_via_next(self, dest)
        }
    }

    impl rand_core09::CryptoRng for Rng<init_state::Enabled> {}
}
