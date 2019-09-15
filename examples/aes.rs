#![no_main]
#![no_std]

///
/// Compare also with: https://github.com/Ko-/aes-armcortexm
///
extern crate panic_halt;
use cortex_m_rt::entry;

#[allow(unused_imports)]
use hal::prelude::*;
#[allow(unused_imports)]
use lpc55s6x_hal as hal;

use aes_soft::block_cipher_trait::generic_array::GenericArray;
use aes_soft::block_cipher_trait::BlockCipher;

use cortex_m_semihosting::dbg;

#[entry]
fn main() -> ! {
    // AES-xxx variants have key sizes of xxx bits
    let key = GenericArray::from_slice(&[0u8; 32]);
    // AES always has block size of 128 bits
    let mut block = GenericArray::clone_from_slice(&[0u8; 16]);
    // let mut block8 = GenericArray::clone_from_slice(&[block; 8]);
    // Initialize cipher
    let cipher = aes_soft::Aes256::new(&key);

    let block_copy = block.clone();
    // dbg!(block_copy);
    // Encrypt block in-place
    let before = hal::get_cycle_count();
    cipher.encrypt_block(&mut block);
    let after = hal::get_cycle_count();
    dbg!("encrypting took {} cycles", after - before);
    dbg!(block);
    // And decrypt it back
    cipher.decrypt_block(&mut block);
    dbg!(block);
    assert_eq!(block, block_copy);

    // // We can encrypt 8 blocks simultaneously using
    // // instruction-level parallelism
    // let block8_copy = block8.clone();
    // // dbg!(block8_copy);
    // cipher.encrypt_blocks(&mut block8);
    // // dbg!(block8);
    // cipher.decrypt_blocks(&mut block8);
    // // dbg!(block8);
    // assert_eq!(block8, block8_copy);

    // dbg!("all done");
    loop {}
}
