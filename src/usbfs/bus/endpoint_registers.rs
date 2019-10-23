use core::marker::PhantomData;

pub const USB1_SRAM_ADDR: u32 = 0x4010_0000;
static mut ENDPOINT_REGISTERS_ATTACHED: bool = false;

pub struct Instance {
    pub(crate) addr: u32,
    pub(crate) _marker: PhantomData<*const RegisterBlock>,
}

impl core::ops::Deref for Instance {
    type Target = RegisterBlock;
    #[inline(always)]
    fn deref(&self) -> &RegisterBlock {
        unsafe { &*(self.addr as *const _) }
    }
}

unsafe impl Send for Instance {}
unsafe impl Send for RegisterBlock {}

impl Instance {
    pub fn addr(&self) -> u32 {
        self.addr
    }
}

fn new(addr: u32) -> Instance {
    let instance = Instance {
        addr,
        _marker: PhantomData,
    };
    reset(&instance);
    instance
}


pub fn attach() -> Option<Instance> {
    cortex_m::interrupt::free(|_| unsafe {
        if ENDPOINT_REGISTERS_ATTACHED {
            None
        } else {
            ENDPOINT_REGISTERS_ATTACHED = true;
            Some(new(USB1_SRAM_ADDR))
        }
    })
}

/// Does not zero the memory
pub unsafe fn steal() -> Instance {
    ENDPOINT_REGISTERS_ATTACHED = true;
    Instance {
        addr: USB1_SRAM_ADDR,
        _marker: PhantomData,
    }
}

// fn reset(instance: &Instance) {
//     (*instance).ep0out.reset();
//     (*instance).setup.reset();
//     (*instance).ep0in.reset();
//     (*instance).__.reset();

//     for ep in (*instance).eps.iter() {
//         ep.ep_out[0].reset();
//         ep.ep_out[1].reset();
//         ep.ep_in[0].reset();
//         ep.ep_in[1].reset();
//     }
// }

fn reset(instance: &Instance) {
    for ep in (*instance).eps.iter() {
        ep.ep_out[0].reset();
        ep.ep_out[1].reset();
        ep.ep_in[0].reset();
        ep.ep_in[1].reset();
    }
}

// NOTE: It would be cleaner to use this approach, since the rule
// for access are different for control vs non-control, and SETUP
// is special-cased.
// But then the indices into RegisterBlock.eps need to be offset
// by 1, which is annoying.
// TODO: Consider using a union.

// #[doc = r"Register block"]
// #[repr(C)]
// pub struct RegisterBlock {
//     // logical control endpoint
//     pub ep0out: EPR,
//     pub setup: EPR,
//     pub ep0in: EPR,
//     pub __: EPR,
//     // logical non-control endpoints (four)
//     pub eps: [EP; 4],
// }

#[doc = r"Register block"]
#[repr(C)]
pub struct RegisterBlock {
    // TODO: Consider turning this struct into a newtype with dereferencing
    pub eps: [EP; 5],
}

#[doc = "logical endpoint register"]
#[repr(C)]
pub struct EP {
    // double-buffered, for single-buffered use only first
    pub ep_out: [EPR; 2],
    // double-buffered, for single-buffered use only first
    pub ep_in: [EPR; 2],
}

#[doc = "physical endpoint register"]
pub struct EPR {
    register: vcell::VolatileCell<u32>,
}


pub mod epr {
    impl super::EPR {
        pub fn modify<F>(&self, f: F) where
            for<'w> F: FnOnce(&R, &'w mut W) -> &'w mut W
        {
            let bits = self.register.get();
            let r = R { bits };
            let mut w = W { bits };
            f(&r, &mut w);
            self.register.set(w.bits);
        }

        pub fn read(&self) -> R {
            R {
                bits: self.register.get(),
            }
        }

        pub fn write<F>(&self, f: F) where
            F: FnOnce(&mut W) -> &mut W,
        {
            let mut w = W::reset_value();
            f(&mut w);
            self.register.set(w.bits);
        }

        pub fn reset(&self) {
            self.write(|w| w)
        }
    }

    pub struct R {
        bits: u32,
    }
    pub struct W {
        bits: u32,
    }

    pub struct ADDROFFR {
        bits: u16,
    }
    impl ADDROFFR {
        #[inline]
        pub fn bits(&self) -> u16 {
            self.bits
        }
    }

    pub struct _ADDROFFW<'a> {
        w: &'a mut W,
    }
    impl<'a> _ADDROFFW<'a> {
        #[inline]
        pub fn bits(self, value: u16) -> &'a mut W {
            const MASK: u16 = !0;
            const OFFSET: u8 = 0;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    pub struct NBYTESR {
        bits: u16,
    }
    impl NBYTESR {
        #[inline]
        pub fn bits(&self) -> u16 {
            self.bits
        }
    }

    pub struct _NBYTESW<'a> {
        w: &'a mut W,
    }
    impl<'a> _NBYTESW<'a> {
        #[inline]
        pub fn bits(self, value: u16) -> &'a mut W {
            const MASK: u16 = (1 << 10) - 1;
            const OFFSET: u8 = 16;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    #[derive(Clone, Copy, Debug, PartialEq)]
    pub enum TR {
        #[doc = "Generic endpoint (bulk or interrupt)"]
        GENERIC,
        #[doc = "Isochronous endpoint"]
        ISOCHRONOUS,
    }
    impl TR {
        #[doc = "Value of the field as raw bits"]
        #[inline]
        pub fn bits(&self) -> u8 {
            match *self {
                TR::GENERIC => 0,
                TR::ISOCHRONOUS => 1,
            }
        }
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _from(value: bool) -> TR {
            match value {
                false => TR::GENERIC,
                true => TR::ISOCHRONOUS,
            }
        }
        pub fn is_generic(&self) -> bool {
            *self == TR::GENERIC
        }
        pub fn is_isochronous(&self) -> bool {
            *self == TR::ISOCHRONOUS
        }
    }

    pub enum TW {
        #[doc = "Generic endpoint (bulk or interrupt)"]
        GENERIC,
        #[doc = "Isochronous endpoint"]
        ISOCHRONOUS,
    }
    impl TW {
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _bit(&self) -> bool {
            match *self {
                TW::GENERIC => false,
                TW::ISOCHRONOUS => true,
            }
        }
    }

    pub struct _TW<'a> {
        w: &'a mut W,
    }
    impl<'a> _TW<'a> {
        #[inline]
        pub fn variant(self, variant: TW) -> &'a mut W {
            { self.bit(variant._bit()) }
        }
        #[inline]
        pub fn generic(self) -> &'a mut W {
            self.variant(TW::GENERIC)
        }
        #[inline]
        pub fn isochronous(self) -> &'a mut W {
            self.variant(TW::ISOCHRONOUS)
        }
        #[inline]
        pub fn bit(self, value: bool) -> &'a mut W {
            const MASK: bool = true;
            const OFFSET: u8 = 26;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    #[derive(Clone, Copy, Debug, PartialEq)]
    pub enum SR {
        NOT_STALLED,
        STALLED,
    }
    impl SR {
        #[inline]
        pub fn bits(&self) -> u8 {
            match *self {
                SR::NOT_STALLED => 0,
                SR::STALLED => 1,
            }
        }
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _from(value: bool) -> SR {
            match value {
                false => SR::NOT_STALLED,
                true => SR::STALLED,
            }
        }
        pub fn is_not_stalled(&self) -> bool {
            *self == SR::NOT_STALLED
        }
        pub fn is_stalled(&self) -> bool {
            *self == SR::STALLED
        }
    }

    pub enum SW {
        NOT_STALLED,
        STALLED,
    }
    impl SW {
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _bit(&self) -> bool {
            match *self {
                SW::NOT_STALLED => false,
                SW::STALLED => true,
            }
        }
    }

    pub struct _SW<'a> {
        w: &'a mut W,
    }
    impl<'a> _SW<'a> {
        #[inline]
        pub fn variant(self, variant: SW) -> &'a mut W {
            { self.bit(variant._bit()) }
        }
        #[inline]
        pub fn not_stalled(self) -> &'a mut W {
            self.variant(SW::NOT_STALLED)
        }
        #[inline]
        pub fn stalled(self) -> &'a mut W {
            self.variant(SW::STALLED)
        }
        #[inline]
        pub fn bit(self, value: bool) -> &'a mut W {
            const MASK: bool = true;
            const OFFSET: u8 = 29;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    #[derive(Clone, Copy, Debug, PartialEq)]
    pub enum DR {
        ENABLED,
        DISABLED,
    }
    impl DR {
        #[inline]
        pub fn bits(&self) -> u8 {
            match *self {
                DR::ENABLED => 0,
                DR::DISABLED => 1,
            }
        }
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _from(value: bool) -> DR {
            match value {
                false => DR::ENABLED,
                true => DR::DISABLED,
            }
        }
        pub fn is_enabled(&self) -> bool {
            *self == DR::ENABLED
        }
        pub fn is_disabled(&self) -> bool {
            *self == DR::DISABLED
        }
    }

    pub enum DW {
        ENABLED,
        DISABLED,
    }
    impl DW {
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _bit(&self) -> bool {
            match *self {
                DW::ENABLED => false,
                DW::DISABLED => true,
            }
        }
    }

    pub struct _DW<'a> {
        w: &'a mut W,
    }
    impl<'a> _DW<'a> {
        #[inline]
        pub fn variant(self, variant: DW) -> &'a mut W {
            { self.bit(variant._bit()) }
        }
        #[inline]
        pub fn enabled(self) -> &'a mut W {
            self.variant(DW::ENABLED)
        }
        #[inline]
        pub fn disabled(self) -> &'a mut W {
            self.variant(DW::DISABLED)
        }
        #[inline]
        pub fn bit(self, value: bool) -> &'a mut W {
            const MASK: bool = true;
            const OFFSET: u8 = 30;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    #[derive(Clone, Copy, Debug, PartialEq)]
    pub enum AR {
        NOT_ACTIVE,
        ACTIVE,
    }
    impl AR {
        #[inline]
        pub fn bits(&self) -> u8 {
            match *self {
                AR::NOT_ACTIVE => 0,
                AR::ACTIVE => 1,
            }
        }
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _from(value: bool) -> AR {
            match value {
                false => AR::NOT_ACTIVE,
                true => AR::ACTIVE,
            }
        }
        pub fn is_not_active(&self) -> bool {
            *self == AR::NOT_ACTIVE
        }
        pub fn is_active(&self) -> bool {
            *self == AR::ACTIVE
        }
    }

    pub enum AW {
        NOT_ACTIVE,
        ACTIVE,
    }
    impl AW {
        #[allow(missing_docs)]
        #[doc(hidden)]
        #[inline]
        pub fn _bit(&self) -> bool {
            match *self {
                AW::NOT_ACTIVE => false,
                AW::ACTIVE => true,
            }
        }
    }

    pub struct _AW<'a> {
        w: &'a mut W,
    }
    impl<'a> _AW<'a> {
        #[inline]
        pub fn variant(self, variant: AW) -> &'a mut W {
            { self.bit(variant._bit()) }
        }
        #[inline]
        pub fn not_active(self) -> &'a mut W {
            self.variant(AW::NOT_ACTIVE)
        }
        #[inline]
        pub fn active(self) -> &'a mut W {
            self.variant(AW::ACTIVE)
        }
        #[inline]
        pub fn bit(self, value: bool) -> &'a mut W {
            const MASK: bool = true;
            const OFFSET: u8 = 31;
            self.w.bits &= !((MASK as u32) << OFFSET);
            self.w.bits |= ((value & MASK) as u32) << OFFSET;
            self.w
        }
    }

    // pub struct SR {
    //     bits: bool,
    // }
    // impl SR {
    //     #[inline]
    //     pub fn bit(&self) -> bool {
    //         self.bits
    //     }
    //     #[inline]
    //     pub fn bit_is_clear(&self) -> bool {
    //         !self.bit()
    //     }
    //     #[inline]
    //     pub fn bit_is_set(&self) -> bool {
    //         self.bit()
    //     }
    // }

    // pub struct _SW<'a> {
    //     w: &'a mut W,
    // }
    // impl<'a> _SW<'a> {
    //     #[inline]
    //     pub fn set_bit(self) -> &'a mut W {
    //         self.bit(true)
    //     }
    //     #[inline]
    //     pub fn clear_bit(self) -> &'a mut W {
    //         self.bit(false)
    //     }
    //     #[inline]
    //     pub fn bit(self, value: bool) -> &'a mut W {
    //         const MASK: bool = true;
    //         const OFFSET: u8 = 29;
    //         self.w.bits &= !((MASK as u32) << OFFSET);
    //         self.w.bits |= ((value & MASK) as u32) << OFFSET;
    //         self.w
    //     }
    // }

    impl R {
        #[doc = r"Value of the register as raw bits"]
        #[inline]
        pub fn bits(&self) -> u32 {
            self.bits
        }
        #[doc = "Bits 0:15 - Endpoint buffer address offset"]
        #[inline]
        pub fn addroff(&self) -> ADDROFFR {
            let bits = {
                const MASK: u16 = !0;
                const OFFSET: u8 = 0;
                ((self.bits >> OFFSET) & MASK as u32) as u16
            };
            ADDROFFR { bits }
        }
        #[doc = "Bits 16:25 - Endpoint buffer NBytes"]
        #[inline]
        pub fn nbytes(&self) -> NBYTESR {
            let bits = {
                const MASK: u16 = (1 << 11) - 1;
                const OFFSET: u8 = 16;
                ((self.bits >> OFFSET) & MASK as u32) as u16
            };
            NBYTESR { bits }
        }
        #[doc = "Bit 26 - Endpoint type"]
        #[inline]
        pub fn t(&self) -> TR {
            TR::_from({
                const MASK: bool = true;
                const OFFSET: u8 = 26;
                ((self.bits >> OFFSET) & MASK as u32) != 0
            })
        }
        // #[doc = "Bit 27 - Rate Feedback mode / Toggle Value"]
        // #[inline]
        // pub fn rftv(&self) -> RFTVR {
        //     let bits = {
        //         const MASK: u8 = true;
        //         const OFFSET: u8 = 27;
        //         ((self.bits >> OFFSET) & MASK as u32) != 0
        //     };
        //     RFTVR { bits }
        // }
        // #[doc = "Bit 28 - Toggle reset"]
        // #[inline]
        // pub fn tr(&self) -> TRR {
        //     let bits = {
        //         const MASK: u8 = true;
        //         const OFFSET: u8 = 28;
        //         ((self.bits >> OFFSET) & MASK as u32) != 0
        //     };
        //     TRR { bits }
        // }
        #[doc = "Bit 29 - Stall"]
        #[inline]
        pub fn s(&self) -> SR {
            SR::_from({
                const MASK: bool = true;
                const OFFSET: u8 = 29;
                ((self.bits >> OFFSET) & MASK as u32) != 0
            })
        }
        #[doc = "Bit 30 - Disabled"]
        #[inline]
        pub fn d(&self) -> DR {
            DR::_from({
                const MASK: bool = true;
                const OFFSET: u8 = 30;
                ((self.bits >> OFFSET) & MASK as u32) != 0
            })
        }
        #[doc = "Bit 31 - Active"]
        #[inline]
        pub fn a(&self) -> AR {
            AR::_from({
                const MASK: bool = true;
                const OFFSET: u8 = 31;
                ((self.bits >> OFFSET) & MASK as u32) != 0
            })
        }
    }

    impl W {
        #[doc = r"Reset value of the register"]
        #[inline]
        pub fn reset_value() -> W {
            W { bits: 0 }
        }
        #[doc = r"Writes raw bits to the register"]
        #[inline]
        pub unsafe fn bits(&mut self, bits: u32) -> &mut Self {
            self.bits = bits;
            self
        }
        #[doc = "Bits 0:15 - Endpoint buffer address offset"]
        #[inline]
        pub fn addroff(&mut self) -> _ADDROFFW {
            _ADDROFFW { w: self }
        }
        #[doc = "Bits 16:25 - Endpoint buffer NBytes"]
        #[inline]
        pub fn nbytes(&mut self) -> _NBYTESW {
            _NBYTESW { w: self }
        }
        #[doc = "Bit 26 - Endpoint type"]
        #[inline]
        pub fn t(&mut self) -> _TW {
            _TW { w: self }
        }
        // #[doc = "Bit 27 - Rate Feedback mode / Toggle Value"]
        // #[inline]
        // pub fn rftv(&self) -> _RFTVW {
        //     _RFTVW { w: self }
        // }
        // #[doc = "Bit 28 - Toggle reset"]
        // #[inline]
        // pub fn tr(&self) -> _TRW {
        //     _TRW { w: self }
        // }
        #[doc = "Bit 29 - Stall"]
        #[inline]
        pub fn s(&mut self) -> _SW {
            _SW { w: self }
        }
        #[doc = "Bit 30 - Disabled"]
        #[inline]
        pub fn d(&mut self) -> _DW {
            _DW { w: self }
        }
        #[doc = "Bit 31 - Active"]
        #[inline]
        pub fn a(&mut self) -> _AW {
            _AW { w: self }
        }
    }
}
