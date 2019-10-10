use core::slice;
use core::cmp::min;
use vcell::VolatileCell;
use crate::usbfs::bus::constants::{
    UsbAccessType,
    // EP_MEM_ADDR,
    EP_MEM_SIZE,
    NUM_ENDPOINTS,
};
use usb_device::{Result, UsbError};

use cortex_m_semihosting::{dbg, hprintln};

// It seems the USB peripheral is flexible about which SRAM to use.
// - On the one hand, the USB HS has no access to regular SRAM, and
// must use "USB_SRAM" at 0x40100000 (size 0x4000, 4KB). We can also
// use this for USB FS.
// - On the other, we could use a stack-allocated or static buffer.
//   --> do this too later on

// TODO TODO TODO
// - for the regular SRAM case, instead of manual memory allocation,
//   just create an array, take the `&'static mut`, and `mem::forget`
//   the array. This is supposedly one of the intended uses of forget,
//   and comes in handy here
// - oops, arrays need to have size known at compile time. MEHHHH
//

pub struct EndpointBuffer(&'static mut [VolatileCell<UsbAccessType>]);

/// Alternative would be make an explicit choice, and
/// configure `memory.x` to exclude that region
static mut EP_MEMORY: [u8; EP_MEM_SIZE] = [0; EP_MEM_SIZE];

pub(crate) static mut EP_MEM_PTR: *mut VolatileCell<UsbAccessType> = unsafe {
    &EP_MEMORY[0] as *const u8 as *mut u8 as *mut VolatileCell<UsbAccessType>
};


impl EndpointBuffer {
    pub fn new(offset: usize, size: usize) -> Self {
        let addr = unsafe { EP_MEM_PTR.add(offset) };
        let mem = unsafe { slice::from_raw_parts_mut(addr, size) };
        Self(mem)
    }

    pub fn read(&self, buf: &mut [u8]) {
        // use iterators?
        for i in 0..min(buf.len(), self.0.len()) {
            buf[i] = self.0[i].get();
        }
    }

    pub fn write(&self, buf: &[u8]) {
        for i in 0..min(buf.len(), self.0.len()) {
            self.0[i].set(buf[i]);
        }
    }

    pub fn offset(&self) -> usize {
        let buffer_address = self.0.as_ptr() as usize;
        buffer_address - (unsafe { EP_MEM_PTR as usize } )
    }

    pub fn addr(&self) -> u32 {
        self.0.as_ptr() as u32
    }

    // blee... capacity
    pub fn capacity(&self) -> usize {
        self.0.len()
    }

    pub fn len(&self) -> usize {
        self.0.len()
    }
}

pub struct EndpointMemoryAllocator {
    next_free_offset: usize,
}

impl EndpointMemoryAllocator {
    pub fn new() -> Self {
        Self {
            // keep BufferDescriptors at top
            // isn't this just NUM_ENDPOINTS * 4 though?
            // next_free_offset: 0//NUM_ENDPOINTS * 8
            next_free_offset: NUM_ENDPOINTS * 8
        }
    }

    pub fn allocate_buffer(&mut self, size: usize) -> Result<EndpointBuffer> {
        let ep_mem_addr = unsafe { EP_MEM_PTR as usize };
        let next_free_addr = ep_mem_addr + self.next_free_offset;

        // buffers have to be 64 byte aligned
        let addr = if next_free_addr & 0x3f > 0 {
            (next_free_addr & !0x3f) + 64
        } else {
            next_free_addr
        };

        let offset = addr - ep_mem_addr;
        if offset + size > EP_MEM_SIZE {
            return Err(UsbError::EndpointMemoryOverflow);
        }
        self.next_free_offset = offset + size;

        // hprintln!("allocating at offset 0x{:x}, so address 0x{:x}", offset, addr).unwrap();
        Ok(EndpointBuffer::new(offset, size))
    }
}
