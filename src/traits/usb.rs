use core::ops::Deref;

#[derive(Copy, Clone)]
pub enum UsbSpeed{
    FullSpeed,
    HighSpeed,
}
pub trait Usb <State>: Deref<Target = crate::raw::usb1::RegisterBlock> + Sync  {
    fn get_speed(&self) -> UsbSpeed;
}