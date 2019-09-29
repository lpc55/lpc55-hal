use core::{slice, mem};
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

/// Alternative would be make an explicit choice, and
/// configure `memory.x` to exclude that region
static mut EP_MEMORY: [u8; EP_MEM_SIZE] = [0; EP_MEM_SIZE];

pub(crate) static mut EP_MEM_PTR: *mut VolatileCell<UsbAccessType> = unsafe {
    &EP_MEMORY[0] as *const u8 as *mut u8 as *mut VolatileCell<UsbAccessType>
};

// pub(crate) static EP_MEM_START_ADDR: usize = unsafe {
//     // &EP_MEMORY[0] as *const u8 as *mut u8 as u32
//     mem::transmute::<&u8, usize>(&EP_MEMORY[0])
// };

pub struct EndpointBuffer(&'static mut [VolatileCell<UsbAccessType>]);


impl EndpointBuffer {
    pub fn new(offset: usize, size: usize) -> Self {
        let addr = unsafe { EP_MEM_PTR.add(offset) };

        let mem = unsafe { slice::from_raw_parts_mut(addr, size) };
        use cortex_m_semihosting::hprintln;
        unsafe {
        //     hprintln!("EP mem addr {:p}", &EP_MEMORY[0]).unwrap();
            hprintln!("allocated buffer at 0x{:p} with offset 0x{:x}", addr, offset ).unwrap();
        }

        Self(mem)
    }

    pub fn read(&self, mut buf: &mut [u8]) {
        // use iterators?
        // check that buf.len() < self.0.len()?
        for i in 0..buf.len() {
            buf[i] = self.0[i].get();
        }
    }

    pub fn write(&self, mut buf: &[u8]) {
        for i in 0..buf.len() {
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

pub struct BufferDescriptor {
    pub addr_tx: VolatileCell<UsbAccessType>,
    pub count_tx: VolatileCell<UsbAccessType>,
    pub addr_rx: VolatileCell<UsbAccessType>,
    pub count_rx: VolatileCell<UsbAccessType>,
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
        // buffers have to be 64 byte aligned
        // TODO: check if setting EP_MEMORY to 64 byte alignment works
        // Otherwise, need to change this

        let ep_mem_addr = unsafe { EP_MEM_PTR as usize };
        dbg!(self.next_free_offset);
        let next_free_addr = ep_mem_addr + self.next_free_offset;
        hprintln!("ep_mem_addr 0x{:x}, next_free_addr 0x{:x}", ep_mem_addr, next_free_addr).unwrap();

        let addr =
            if next_free_addr & 0x3f > 0 {
                dbg!("would not be 64 byte aligned");
                (next_free_addr & !0x3f) + 64
            } else {
                dbg!("is 64 byte aligned");
                next_free_addr
            };
        let offset = addr - ep_mem_addr;

        if offset + size > EP_MEM_SIZE {
            return Err(UsbError::EndpointMemoryOverflow);
        }
        self.next_free_offset = offset + size;
        hprintln!("allocating at offset 0x{:x}, so address 0x{:x}", offset, addr).unwrap();
        Ok(EndpointBuffer::new(offset, size))
    }

    // pub fn buffer_descriptor(index: u8) -> &'static BufferDescriptor {
    //     unsafe { &*(EP_MEM_ADDR as *const BufferDescriptor).add(index as usize) }
    // }
}
