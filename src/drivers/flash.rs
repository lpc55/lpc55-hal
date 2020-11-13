use core::convert::TryInto;
// use cortex_m_semihosting::hprintln;

use crate::{
    peripherals::{
        flash::Flash,
    },
    typestates::init_state::Enabled,
    traits::{
        flash::{
            Error,
            Result,
            Read,
            WriteErase,
        },
    },
};

use generic_array::{
    GenericArray,
    typenum::{U16, U512},
};

#[cfg(feature = "littlefs")]
use generic_array::typenum::{U256, U1022};

#[cfg(feature = "littlefs")]
use littlefs2::io::Result as LfsResult;

// one physical word of Flash consists of 128 bits (or 4 u32, or 16 bytes)
// one page is 32 physical words, or 128 u32s, or 512 bytes)

// reads must be physical word aligned (16 bytes)
// erase and write must be page aligned (512 bytes)

pub const READ_SIZE: usize = 16;
pub const WRITE_SIZE: usize = 512;
pub const PAGE_SIZE: usize = 512;

pub struct FlashGordon {
    flash: Flash<Enabled>,
}

impl FlashGordon {
    pub fn new(flash: Flash<Enabled>) -> Self {

        flash.raw.event.write(|w| w.rst().set_bit());
        // seems immediate
        while flash.raw.int_status.read().done().bit_is_clear() {}

        // first thing to check! illegal command
        debug_assert!(flash.raw.int_status.read().err().bit_is_clear());
        // first thing to check! legal command failed
        debug_assert!(flash.raw.int_status.read().fail().bit_is_clear());

        FlashGordon {
            flash,
        }
    }

    fn clear_status(&self) {
        self.flash.raw.int_clr_status.write(|w| w
            .done().set_bit()
            .ecc_err().set_bit()
            .err().set_bit()
            .fail().set_bit()
        );

    }

    fn status(&self) -> Result {
        let status = self.flash.raw.int_status.read();
        // if status.done().bit_is_clear() {
        //     return Err(Error::Busy);
        // }
        if status.err().bit_is_set() {
            return Err(Error::Illegal);
        }
        if status.ecc_err().bit_is_set() {
            return Err(Error::EccError);
        }
        if status.fail().bit_is_set() {
            return Err(Error::Failure);
        }

        Ok(())
    }

    pub fn just_program_at(
        &mut self,
        address: usize,
    ) -> Result {

        let flash = &self.flash.raw;
        assert!(flash.int_status.read().done().bit_is_set());
        self.clear_status();

        flash.event.write(|w| w.rst().set_bit());
        // seems immediate
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;
        self.clear_status();

        flash.starta.write(|w| unsafe { w.starta().bits((address >> 4) as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Program as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        debug_assert!(flash.int_status.read().err().bit_is_clear());
        debug_assert!(flash.int_status.read().fail().bit_is_clear());
        self.status()?;

        Ok(())

    }

    pub fn clear_page_register(&mut self) {
        let flash = &self.flash.raw;
        assert!(flash.int_status.read().done().bit_is_set());
        self.clear_status();

        for i in 0..32 {
            for j in 0..4 {
                flash.dataw[j].write(|w| unsafe { w.bits(0x0) });
            }
            flash.starta.write(|w| unsafe { w.starta().bits(i as u32) } );
            flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Write as u32) });

            while flash.int_status.read().done().bit_is_clear() {}
            debug_assert!(flash.int_status.read().err().bit_is_clear());
            debug_assert!(flash.int_status.read().fail().bit_is_clear());
            assert!(self.status().is_ok());
        }
    }

    pub fn write_u8(&mut self, address: usize, byte: u8) -> Result {
        self.clear_page_register();
        let flash = &self.flash.raw;
        // which "physical word" is this?
        let page_register_column = (address & (512 - 1)) >> 4;
        let mut word = [0u8; 4];
        word[address % 4] = byte;
        // redundant since done in clear_page_register
        for j in 0..4 {
            flash.dataw[j].write(|w| unsafe { w.bits(0) });
        }
        flash.dataw[(address >> 2) % 4].write(|w| unsafe { w.bits(u32::from_ne_bytes(word)) });
        flash.starta.write(|w| unsafe { w.starta().bits(page_register_column as u32) } );
        self.clear_status();
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Write as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;

        self.clear_status();
        // self.just_program_at(address & !(512 - 1));
        flash.starta.write(|w| unsafe { w.starta().bits((address >> 4) as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Program as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;
        Ok(())
    }

    pub fn write_u32(&mut self, address: usize, word: u32) -> Result {
        self.clear_page_register();
        let flash = &self.flash.raw;

        // which "physical word" is this?
        let page_register_column = (address & (512 - 1)) >> 4;
        // redundant since done in clear_page_register
        for j in 0..4 {
            flash.dataw[j].write(|w| unsafe { w.bits(0) });
        }
        flash.dataw[(address >> 2) % 4].write(|w| unsafe { w.bits(word) });
        flash.starta.write(|w| unsafe { w.starta().bits(page_register_column as u32) } );
        self.clear_status();
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Write as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;

        self.clear_status();
        // self.just_program_at(address & !(512 - 1));
        flash.starta.write(|w| unsafe { w.starta().bits((address >> 4) as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Program as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;

        Ok(())
    }

    pub fn write_u128(&mut self, address: usize, data: u128) -> Result {
        // self.clear_page_register();

        let flash = &self.flash.raw;

        let buf: [u8; 16] = data.to_ne_bytes();

        for (i, chunk) in buf.chunks(4).enumerate() {
            flash.dataw[i].write(|w| unsafe { w.bits(u32::from_ne_bytes(chunk.try_into().unwrap())) } );
        }
        flash.starta.write(|w| unsafe { w.starta().bits((address >> 4) as u32) } );
        self.clear_status();
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Write as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;

        self.clear_status();
        // self.just_program_at(address & !(512 - 1));
        flash.starta.write(|w| unsafe { w.starta().bits((address >> 4) as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Program as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        self.status()?;

        Ok(())
    }

    pub fn read_u128(&mut self, address: usize) -> u128 {
        let mut buf = [0u8; 16];
        self.read(address, &mut buf);
        u128::from_ne_bytes(buf)
    }
}

#[allow(dead_code)]
#[repr(C)]
enum FlashCommands {
    Init = 0x0,
    PowerDown = 0x1,
    SetReadMode = 0x2,
    ReadSingleWord = 0x3,
    EraseRange = 0x4,
    BlankCheck = 0x5,
    MarginCheck = 0x6,
    Checksum = 0x7,
    Write = 0x8,
    WriteProgram = 0xA,
    Program = 0xC,
    /// report ECC error (correction) count
    ReportEcc= 0xD,
}

#[cfg(feature = "littlefs")]
#[allow(non_camel_case_types)]
pub mod littlefs_params {
    use super::*;
    pub const BASE_OFFSET: usize = 0x0008_0000;
    pub const READ_SIZE: usize = 16;
    pub const WRITE_SIZE: usize = 512;
    pub const BLOCK_SIZE: usize = 512;

    pub const BLOCK_COUNT: usize = 256;
    // no wear-leveling for now
    pub const BLOCK_CYCLES: isize = -1;

    pub type CACHE_SIZE = U512;
    pub type LOOKAHEADWORDS_SIZE = U16;
    /// TODO: We can't actually be changed currently
    pub type FILENAME_MAX_PLUS_ONE = U256;
    pub type PATH_MAX_PLUS_ONE = U256;
    pub const FILEBYTES_MAX: usize = littlefs2::ll::LFS_FILE_MAX as _;
    /// TODO: We can't actually be changed currently
    pub type ATTRBYTES_MAX = U1022;
}

#[cfg(feature = "littlefs")]
impl littlefs2::driver::Storage for FlashGordon {
    const READ_SIZE: usize = littlefs_params::READ_SIZE;
    const WRITE_SIZE: usize = littlefs_params::WRITE_SIZE;
    const BLOCK_SIZE: usize = littlefs_params::BLOCK_SIZE;

    const BLOCK_COUNT: usize = littlefs_params::BLOCK_COUNT;
    const BLOCK_CYCLES: isize = littlefs_params::BLOCK_CYCLES;

    type CACHE_SIZE = littlefs_params::CACHE_SIZE;
    type LOOKAHEADWORDS_SIZE = littlefs_params::LOOKAHEADWORDS_SIZE;
    type FILENAME_MAX_PLUS_ONE = littlefs_params::FILENAME_MAX_PLUS_ONE;
    type PATH_MAX_PLUS_ONE = littlefs_params::PATH_MAX_PLUS_ONE;
    const FILEBYTES_MAX: usize = littlefs_params::FILEBYTES_MAX;
    type ATTRBYTES_MAX = littlefs_params::ATTRBYTES_MAX;


    fn read(&self, off: usize, buf: &mut [u8]) -> LfsResult<usize> {
        <Self as Read<U16>>::read(self, littlefs_params::BASE_OFFSET + off, buf);
        // hprintln!("read {} from {}", buf.len(), off).ok();
        // hprintln!("read {} from {}: {:?}", buf.len(), off, &buf[..16]).ok();
        Ok(buf.len())
    }

    fn write(&mut self, off: usize, data: &[u8]) -> LfsResult<usize> {
        // hprintln!("write {} to {}", data.len(), off).ok();
        // hprintln!("write {} to {}: {:?}", data.len(), off, &data[..16]).ok();
        let ret = <Self as WriteErase<U512, U512>>::write(self, littlefs_params::BASE_OFFSET + off, data);
        // if let Err(error) = ret {
        //     panic!("error writing: {:?}", &error);
        // }
        ret
            .map(|_| data.len())
            .map_err(|_| littlefs2::io::Error::Io)
    }

    fn erase(&mut self, off: usize, len: usize) -> LfsResult<usize> {
        // hprintln!("erase {} from {}", len, off).ok();
        let first_page = (littlefs_params::BASE_OFFSET + off) / 512;
        let pages = len / 512;
        for i in 0..pages {
            <Self as WriteErase<U512, U512>>::erase_page(self, first_page + i)
                .map_err(|_| littlefs2::io::Error::Io)?;
        }
        // if true {
        //     hprintln!("checking erasure").ok();
        //     let mut data = [37u8; 16];
        //     let now = littlefs2::driver::Storage::read(self, off, &mut data);
        //     hprintln!("-> {:?}", &data).ok();
        // }
        Ok(512 * len)
    }

}

impl Read<U16> for FlashGordon {
    // this reads 16B or one flash word
    // address is in bytes, whereas starta expects address in flash words
    // so starta = address / 16 = address >> 4
    fn read_native(&self, address: usize, array: &mut GenericArray<u8, U16>) {
        // hprintln!("native read from {} of {:?} (first 16)", address, &array[..16]).ok();
        let flash = &self.flash.raw;

        assert!(flash.int_status.read().done().bit_is_set());
        self.clear_status();
        // if self.status().is_err() {
        //     cortex_m_semihosting::dbg!(flash.int_status.read().bits());
        //     assert!(self.status().is_ok());
        // }
        assert!(self.status().is_ok());

        let addr = address as u32;
        debug_assert!(addr & (READ_SIZE as u32 - 1) == 0);

        flash.starta.write(|w| unsafe { w.starta().bits(addr >> 4) } );
        // want to have normal reads
        flash.dataw[0].write(|w| unsafe { w.bits(0) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::ReadSingleWord as u32) });
        while flash.int_status.read().done().bit_is_clear() { continue; }

        assert!(flash.int_status.read().err().bit_is_clear());
        debug_assert!(flash.int_status.read().fail().bit_is_clear());

        // each dataw[i] now contains 4 bytes
        for (i, chunk) in array.chunks_mut(4).enumerate() {
            chunk.copy_from_slice(&flash.dataw[i].read().bits().to_ne_bytes());
        }
    }
}

impl WriteErase<U512, U512> for FlashGordon {

    fn status(&self) -> Result {
        self.status()
    }

    // TODO: use critical section?
    fn erase_page(&mut self, page: usize) -> Result {
        // starta is still in flash words, of which a page has 32
        let starta = page * 32;
        // hprintln!("native erase page {}", page).ok();

        let flash = &self.flash.raw;
        assert!(flash.int_status.read().done().bit_is_set());
        self.clear_status();
        assert!(flash.int_status.read().done().bit_is_clear());

        flash.starta.write(|w| unsafe { w.starta().bits(starta as u32) } );
        flash.stopa.write(|w| unsafe { w.stopa().bits(starta as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::EraseRange as u32) });
        while flash.int_status.read().done().bit_is_clear() {}

        debug_assert!(flash.int_status.read().err().bit_is_clear());
        debug_assert!(flash.int_status.read().fail().bit_is_clear());
        // cortex_m_semihosting::dbg!(self.status());
        self.status()?;

        Ok(())
    }

    fn write_native(
        &mut self,
        address: usize,
        array: &GenericArray<u8, U512>,
        // cs: &CriticalSection,
    ) -> Result {

        // hprintln!("native write to {} of {:?} (first 16)", address, &array[..16]).ok();
        let flash = &self.flash.raw;
        assert!(flash.int_status.read().done().bit_is_set());
        self.clear_status();

        // maybe check the page is erased?

        // write one physical word (16 bytes) at a time
        for (i, chunk) in array.chunks(16).enumerate() {
            let starta = (address >> 4) + i;
            flash.starta.write(|w| unsafe { w.starta().bits(starta as u32) } );

            for (j, word) in chunk.chunks(4).enumerate() {
                flash.dataw[j].write(|w| unsafe { w.bits(
                    u32::from_ne_bytes(word.try_into().unwrap())
                ) } );
            }

            flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Write as u32) });
            // flash.cmd.write(|w| unsafe { w.bits(FlashCommands::WriteProgram as u32) });
            while flash.int_status.read().done().bit_is_clear() {}
            debug_assert!(flash.int_status.read().err().bit_is_clear());
            debug_assert!(flash.int_status.read().fail().bit_is_clear());
            self.status()?;
        }
        self.clear_status();

        let starta = address >> 4;
        flash.starta.write(|w| unsafe { w.starta().bits(starta as u32) } );
        flash.cmd.write(|w| unsafe { w.bits(FlashCommands::Program as u32) });
        while flash.int_status.read().done().bit_is_clear() {}
        debug_assert!(flash.int_status.read().err().bit_is_clear());
        debug_assert!(flash.int_status.read().fail().bit_is_clear());
        self.status()?;

        Ok(())

    }
}
