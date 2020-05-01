pub type UsbAccessType = u8; // note this is just a type definition, we depend on its size

// TODO: Ideally, user could use both FS and HS peripherals.
// Then the Cargo feature could go away as well.
// For this, would need to move NUM_ENDPOINTS from global constants
// to associated constant (of traits::usb::Usb),
// but this does not currently work.
/// Number of logical endpoints, including control
/// Default is full speed (5 endpoints).
#[cfg(feature = "highspeed-usb")]
pub const NUM_ENDPOINTS: usize = 1 + 5;
#[cfg(not(feature = "highspeed-usb"))]
pub const NUM_ENDPOINTS: usize = 1 + 4;
pub const BYTES_PER_EP_REGISTER: usize = 4*4;

pub const USB1_SRAM_ADDR: usize = 0x4010_0000;
pub const EP_MEM_ADDR: usize = USB1_SRAM_ADDR;
pub const EP_MEM_SIZE: usize = 0x4000;
pub const EP_REGISTERS_SIZE: usize = NUM_ENDPOINTS * BYTES_PER_EP_REGISTER;
