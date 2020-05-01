pub type UsbAccessType = u8; // note this is just a type definition, we depend on its size

/// Number of logical endpoints, including control
/// Default is high speed (6 endpoints). 
#[cfg( 
    any( 
        all(not(feature = "fullspeed"), not(feature = "highspeed")), 
        feature="highspeed"
    )
)]
pub const NUM_ENDPOINTS: usize = 1 + 5;
#[cfg(feature = "fullspeed")]
pub const NUM_ENDPOINTS: usize = 1 + 4;
pub const BYTES_PER_EP_REGISTER: usize = 4*4;

pub const USB1_SRAM_ADDR: usize = 0x4010_0000;
pub const EP_MEM_ADDR: usize = USB1_SRAM_ADDR;
pub const EP_MEM_SIZE: usize = 0x4000;
pub const EP_REGISTERS_SIZE: usize = NUM_ENDPOINTS * BYTES_PER_EP_REGISTER;
