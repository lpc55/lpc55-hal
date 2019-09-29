pub type UsbAccessType = u8; // note this is just a type definition, we depend on its size
// pub const EP_MEM_ADDR: usize = 0x4010_0000;
pub const EP_MEM_SIZE: usize = 0x4000;
/// Number of logical endpoints, including control
pub const NUM_ENDPOINTS: usize = 1 + 4;
