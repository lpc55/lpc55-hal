use crate::{
    peripherals::{
        Flash,
    },
    traits::{
        flash::{
            Read,
            WriteErase,
        },
    },
};

use generic_array;

// one physical world (address) of Flash consists of 128 bits (or 4 u32, or 16 u8)

pub const READ_SIZE: usize = 16;
pub const WRITE_SIZE: usize = 16;
// NB: 1 page = 32 flash words
pub const PAGE_SIZE: usize = 512;

struct FlashGordon {
    flash: Flash,
}

impl Flash {
    pub fn init(flash: Flash) {
        FlashGordon {
            flash,
        }
    }

    fn status(&self) -> FlashResult {
        // let sr = self.flash.sr.read();
        // if sr.bsy().bit_is_set() {
        //     Err(FlashError::Busy)
        // } else if sr.progerr().bit_is_set() {
        //     Err(FlashError::ProgrammingError)
        // } else if sr.wrperr().bit_is_set() {
        //     Err(FlashError::WriteProtectionError)
        // } else {
        //     Ok(())
        // }

        Ok(())
    }

}


impl Read<generic_array::typenum::U8> for Flash {
    // flash read is two consecutive u32 words, aligned
    fn read_native(&self, address: usize, array: &mut GenericArray<u8, generic_array::typenum::U8>) {
        unsafe {
            byteorder::NativeEndian::write_u32(
                &mut array.as_mut_slice()[..4],
                gTcore::ptr::read_volatile(address as *mut u32),
            );
            byteorder::NativeEndian::write_u32(
                &mut array.as_mut_slice()[4..],
                core::ptr::read_volatile((address + 4) as *mut u32),
            );
        }
    }
}
impl WriteErase<generic_array::typenum::U512, generic_array::typenum::U8> for Flash {
    // TODO: use critical section?
    fn erase_page(&mut self, page: u8) -> FlashResult {
        self.status()?;

        let spi = &mut self.spi.raw;

        while spi.int_status.read().done().bit() { continue; };
        spi.int_clr_status.write(|_, w| w.done().set_bit());

        spi.starta.write(|w| w.page

int *src_i;
INT_CLR_STATUS = 0xf; //clear status register
STARTA = ((int)dst)>>4; //set start address. Assuming dst is a char*
STOPA = STARTA+32; //set end address. 1 page = 32 flash words.
CMD=CMD_ERASE_RANGE; //command: erase page range. Now erase starts.
while(!(INT_STATUS & 0x4 )) ; //wait until DONE is set
if(INT_STATUS & 3) handle_erase_errors();
//now write & program
src_i = (int *) src;
for(page=0; page < 2; page++) {
for(flashword=0; flashword<32; flashword++) {
INT_CLR_STATUS = 0xf; //clear status register
STARTA = flashword;
DATAW0 = *src_i++;
DATAW1 = *src_i++;
DATAW2 = *src_i++;
DATAW3 = *src_i++;
CMD=CMD_WRITE; //start write
while(!(INT_STATUS & 0x4 )) ; //wait until DONE is set
if(INT_STATUS & 3) handle_write_errors();
} //end of word loop
INT_CLR_STATUS = 0xf; //clear status register
STARTA = (((int)dst)>>4) + page*32
CMD=CMD_PROGRAM; //start program
while(!(INT_STATUS & 0x4 )) ; //wait until DONE is set
if(INT_STATUS & 3) handle_program_errors();
} //end of page loop








        // // enable page erase
        // self.flash.cr.modify(|_, w| w.per().set_bit());
        // // set page number
        // unsafe { self.flash.cr.modify(|_, w| w.pnb().bits(page)); }
        // // start erase page
        // self.flash.cr.modify(|_, w| w.start().set_bit());
        // // wait until done
        // while !self.flash.sr.read().bsy().bit_is_clear() {}
        // // disable page erase
        // self.flash.cr.modify(|_, w| w.per().clear_bit());

        Ok(())
    }
}
