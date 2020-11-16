
use crate::{
    raw,
    peripherals::{
        rng::Rng,
    },
    typestates::{
        init_state,
    }
};

#[derive(Copy, Clone)]
pub enum Region {
    Region0,
    Region1,
    Region2,
}

// crate::wrap_stateful_peripheral!(Rtc, RTC);
pub struct Prince<State = init_state::Unknown> {
    pub(crate) raw: raw::PRINCE,
    pub _state: State,
}

impl core::convert::From<raw::PRINCE> for Prince {
    fn from(raw: raw::PRINCE) -> Self {
        Prince::new(raw)
    }
}

impl Prince {

    pub fn new(raw: raw::PRINCE) -> Self {
        Prince { raw , _state: init_state::Unknown }
    }

    // PRINCE doesn't actually get enabled or disabled,
    // but am using this pattern to enforce that random numbers get written to the mask registers.
    pub fn enabled(self, rng: &Rng<init_state::Enabled>) -> Prince<init_state::Enabled> {

        // "It is a good practice to set this register to a different random value each time the system is booted."
        self.raw.mask_lsb.write(|w| unsafe {w.bits( rng.get_random_u32() )});
        self.raw.mask_msb.write(|w| unsafe {w.bits( rng.get_random_u32() )});

        self.raw.base_addr2.write(|w| unsafe{w.bits(0x80000)});
        self.raw.base_addr1.write(|w| unsafe{w.bits(0x40000)});

        // Default is 0.
        // self.raw.base_addr0.write(|w| unsafe{w.bits(0x00000)});

        Prince {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }
}

impl Prince<init_state::Enabled> {

    pub fn enable_all_region_2(&self) {
        self.raw.sr_enable2.write(|w| unsafe{w.bits(0xffffffff)});
    }
    pub fn enable_all_region_1(&self) {
        self.raw.sr_enable1.write(|w| unsafe{w.bits(0xffffffff)});
    }
    pub fn enable_all_region_0(&self) {
        self.raw.sr_enable0.write(|w| unsafe{w.bits(0xffffffff)});
    }

    pub fn disable_all_region_2(&self) {
        self.raw.sr_enable2.write(|w| unsafe{w.bits(0x0)});
    }
    pub fn disable_all_region_1(&self) {
        self.raw.sr_enable1.write(|w| unsafe{w.bits(0x0)});
    }
    pub fn disable_all_region_0(&self) {
        self.raw.sr_enable0.write(|w| unsafe{w.bits(0x0)});
    }

    pub fn set_region_enable(&self, region: Region, enable: u32) {
        match region {
            Region::Region0 =>
                self.raw.sr_enable0.write(|w| unsafe{w.bits(enable)}),
            Region::Region1 =>
                self.raw.sr_enable1.write(|w| unsafe{w.bits(enable)}),
            Region::Region2 =>
                self.raw.sr_enable2.write(|w| unsafe{w.bits(enable)}),
        };
    }

    pub fn encrypted_write(&mut self, f: impl FnOnce() -> ()) {
        // Immediately prior to flash programming, set the ENC_ENABLE.EN bit
        self.raw.enc_enable.write(|w| w.en().set_bit());

        f();

        // After completion of flash programming clear ENC_ENABLE.EN, to prevent
        // unintended PRINCE encryption of writes
        self.raw.enc_enable.write(|w| w.en().clear_bit());
    }

    /// This is marked unsafe because it is on the programmer to ensure that
    /// encrypted writes are disabled following the flash operation.
    pub unsafe fn enable_encrypted_write(&mut self) {
        // Immediately prior to flash programming, set the ENC_ENABLE.EN bit
        self.raw.enc_enable.write(|w| w.en().set_bit());
    }

    pub fn disable_encrypted_write(&mut self) {
        // After completion of flash programming clear ENC_ENABLE.EN, to prevent
        // unintended PRINCE encryption of writes
        self.raw.enc_enable.write(|w| w.en().clear_bit());
    }

}

