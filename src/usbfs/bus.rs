pub mod constants;

pub mod endpoint;
use endpoint::Endpoint;

pub mod endpoint_memory;
use endpoint_memory::{
    EndpointMemoryAllocator,
    EP_MEM_PTR,
};

pub mod endpoint_registers;

// move this into a submodule `bus` again?

use core::{
    marker::PhantomData,
    mem,
};

use cortex_m::interrupt::{
    self,
    Mutex,
};

use usb_device::{
    Result,
    UsbDirection,
    UsbError,
    endpoint::{
        EndpointType,
        EndpointAddress,
    },
    bus::{
        UsbBusAllocator,
        PollResult,
    },
};

use crate::{
    raw::USB0,
    usbfs::EnabledUsbfsDevice,
};

// use cortex_m_semihosting::{/*dbg,*/ hprintln};

// TODO: fixme
pub trait UsbPins: Send { }
// impl UsbPins for (lpc55s6x_hal::pins::Pin<lpc55s6x_hal::pins::PIO0_22, lpc55s6x_hal::states::pin_state::Unused>,)
impl UsbPins for () {}

/// Implements the `usb_device::bus::UsbBus` trait.
///
/// From that documentation:
///
/// The UsbBus is shared by reference between the global UsbDevice as well as UsbClasses,
/// and therefore any required mutability must be implemented using interior mutability.
/// Most operations that may mutate the bus object itself take place before enable is called.
/// After the bus is enabled, in practice most access won't mutate the object itself
/// but only endpoint-specific registers and buffers, the access to which is mostly
/// arbitrated by endpoint handles.
pub struct UsbBus<PINS> {
    // TODO: use either a RegProxy, or perhaps a UsbFsDev<is::Enabled>
    usb_regs: Mutex<USB0>,
    epl_regs: Mutex<endpoint_registers::Instance>,
    endpoints: [Endpoint; self::constants::NUM_ENDPOINTS],
    ep_allocator: EndpointMemoryAllocator,
    max_endpoint: usize,
    pins: PhantomData<PINS>,
}


impl<PINS: UsbPins+Sync> UsbBus<PINS> {
    /// Constructs a new USB peripheral driver.
    pub fn new(usbfsd: EnabledUsbfsDevice, _pins: PINS) -> UsbBusAllocator<Self> {
        use self::constants::NUM_ENDPOINTS;

        let bus = UsbBus {
            usb_regs: Mutex::new(usbfsd.release().0),
            epl_regs: Mutex::new(endpoint_registers::attach().unwrap()),
            ep_allocator: EndpointMemoryAllocator::new(),
            max_endpoint: 0,
            endpoints: {
                let mut endpoints: [mem::MaybeUninit<Endpoint>; NUM_ENDPOINTS] = unsafe {
                    mem::MaybeUninit::uninit().assume_init()
                };

                for (i, endpoint) in endpoints.iter_mut().enumerate() {
                    *endpoint = mem::MaybeUninit::new(Endpoint::new(i as u8));
                }

                unsafe { mem::transmute::<_, [Endpoint; NUM_ENDPOINTS]>(endpoints) }
            },
            pins: PhantomData,
        };

        UsbBusAllocator::new(bus)
    }
}


impl<PINS: Send+Sync> usb_device::bus::UsbBus for UsbBus<PINS> {

    // override the default (contrary to USB spec),
    // as describe in the user manual
    const QUIRK_SET_ADDRESS_BEFORE_STATUS: bool = true;

    fn alloc_ep(
        &mut self,
        ep_dir: UsbDirection,
        ep_addr: Option<EndpointAddress>,
        ep_type: EndpointType,
        max_packet_size: u16,
        _interval: u8) -> Result<EndpointAddress>
    {
        // well this is clever but is it readable
        for index in ep_addr.map(|a| a.index()..a.index() + 1).unwrap_or(1..self::constants::NUM_ENDPOINTS) {
            let ep = &mut self.endpoints[index];

            match ep.ep_type() {
                None => { ep.set_ep_type(ep_type); },
                Some(t) if t != ep_type => { continue; },
                _ => { },
            };

            match ep_dir {
                UsbDirection::Out if !ep.is_out_buf_set() => {
                    let size = max_packet_size;
                    let buffer = self.ep_allocator.allocate_buffer(size as _)?;
                    ep.set_out_buf(buffer);
                    assert!(ep.is_out_buf_set());

                    if index == 0 {
                        let setup = self.ep_allocator.allocate_buffer(8)?;
                        ep.set_setup_buf(setup);
                    }

                    return Ok(EndpointAddress::from_parts(index, ep_dir));
                },

                UsbDirection::In if !ep.is_in_buf_set() => {
                    let size = max_packet_size;
                    let buffer = self.ep_allocator.allocate_buffer(size as _)?;
                    ep.set_in_buf(buffer);

                    return Ok(EndpointAddress::from_parts(index, ep_dir));
                },

                _ => { }
            }
        }

        Err(match ep_addr {
            Some(_) => UsbError::InvalidEndpoint,
            None => UsbError::EndpointOverflow,
        })
    }

    fn enable(&mut self) {
        cortex_m_semihosting::hprintln!("Enabling UsbBus").ok();
        interrupt::free(|cs| {
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            let mut max = 0;
            for (index, ep) in self.endpoints.iter().enumerate() {
                if ep.is_out_buf_set() || ep.is_in_buf_set() {
                    max = index;

                    // these are guarded against `None.unwrap()` internally
                    // but they are not set yet here
                    // assert!(ep.is_out_buf_set());
                    // ep.reset_out_buf(cs, epl);
                    // ep.reset_in_buf(cs, epl);
                    // ep.reset_setup_buf(cs, epl);
                }
            }
            self.max_endpoint = max;

            // DATABUFSTART
            unsafe {
                let databufstart = ((EP_MEM_PTR as usize) >> 22) as u16;
                usb.databufstart.modify(
                    |_, w| w.da_buf().bits(databufstart)
                );
            };

            // EPLISTSTART
            unsafe {
                let epliststart = epl.addr;
                // needs to be 256 byte aligned
                assert!(epliststart as u8 == 0);
                usb.epliststart.modify(
                    |_, w| w.ep_list().bits(epliststart >> 8)
                );
            }

            // ENABLE + CONNECT
            usb.devcmdstat.modify(|_, w| w
                .dev_en().set_bit()
                .dcon().set_bit()
            );
        });
    }

    fn reset(&self) {
        cortex_m_semihosting::hprintln!("Resetting UsbBus").ok();
        interrupt::free(|cs| {
            // set device address to 0
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            usb.devcmdstat.modify(|_, w| unsafe { w.dev_addr().bits(0) } );

            for ep in self.endpoints.iter() {
                ep.configure(cs, usb, epl);
            }

            // clear all interrupts
            usb.intstat.write(|w| unsafe { w.bits(!0) } );
        });
    }

    fn set_device_address(&self, addr: u8) {
        cortex_m_semihosting::hprintln!("Setting UsbBus device address {}", addr).ok();
        interrupt::free(|cs| {
            self.usb_regs.borrow(cs).devcmdstat.modify(|_, w| unsafe {
                w.dev_addr().bits(addr)
            });
        });
    }

    fn poll(&self) -> PollResult {
        interrupt::free(|cs| {
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            let devcmdstat = &usb.devcmdstat;
            let intstat = &usb.intstat;

            // Bus reset flag?
            if devcmdstat.read().dres_c().bit_is_set() {
                devcmdstat.modify(|_, w| w.dres_c().set_bit());
                assert!(devcmdstat.read().dres_c().bit_is_clear());
                return PollResult::Reset
            }

            // TODO: Resume, Suspend handling

            let mut ep_out = 0;
            let mut ep_in_complete = 0;
            let mut ep_setup = 0;

            let mut bit = 1;

            // NB: these are not "reader objects", but the actual value
            // of the registers at time of assignment :))
            let intstat_r = intstat.read();

            // First handle endpoint 0 (the only control endpoint)
            if intstat_r.ep0out().bit_is_set() {
                if devcmdstat.read().setup().bit_is_set() {
                    ep_setup |= bit;
                } else {
                    ep_out |= bit;
                }
            }

            if intstat_r.ep0in().bit_is_set() {
                intstat.write(|w| w.ep0in().set_bit());
                assert!(intstat.read().ep0in().bit_is_clear());
                ep_in_complete |= bit;

                // EP0 needs manual toggling of Active bits
                // Weeelll interesting, not changing this makes no difference
                // modify_endpoint!(endpoint_list, epl, EP0IN, A: NotActive);
                epl.eps[0].ep_in[0].modify(|_, w| w.a().not_active());
                // BELOW SEEMS NO LONGER NECESSARY!
                // prevents OUT-DATA-NAK
                // modify_endpoint!(endpoint_list, epl, EP0OUT, A: Active);
            }

            // non-CONTROL
            for ep in &self.endpoints[1..=self.max_endpoint] {
                bit <<= 1;
                let i = ep.index() as usize;

                // TODO: implement these endpoints
                let ep_out_offset = 2*i;
                let ep_out_int = ((intstat_r.bits() >> ep_out_offset) & 0x1) != 0;
                let ep_out_not_active = epl.eps[i].ep_out[0].read().a().is_not_active();
                if ep_out_int {
                    ep_out |= bit;
                    assert!(ep_out_not_active);
                }

                let ep_in_offset = 2*i + 1;
                let ep_in_int = ((intstat_r.bits() >> ep_in_offset) & 0x1) != 0;
                // WHYY is this sometimes still active?
                let ep_not_active = epl.eps[i].ep_in[0].read().a().is_not_active();
                if ep_in_int && ep_not_active {
                    ep_in_complete |= bit;
                    // clear it
                    usb.intstat.write(|w| unsafe { w.bits(1u32 << ep_in_offset) } );
                    assert!(epl.eps[i].ep_in[0].read().a().is_not_active());
                };
            }

            if (ep_out | ep_in_complete | ep_setup) != 0 {
                PollResult::Data { ep_out, ep_in_complete, ep_setup }
            } else {
                PollResult::None
            }
        })
    }

    fn read(&self, ep_addr: EndpointAddress, buf: &mut [u8]) -> Result<usize> {
        if !ep_addr.is_out() { return Err(UsbError::InvalidEndpoint); }

        interrupt::free(|cs| {
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);
            self.endpoints[ep_addr.index()].read(buf, cs, usb, epl)
        })
    }

    fn write(&self, ep_addr: EndpointAddress, buf: &[u8]) -> Result<usize> {
        if !ep_addr.is_in() { return Err(UsbError::InvalidEndpoint); }

        interrupt::free(|cs| {
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);
            self.endpoints[ep_addr.index()].write(buf, cs, usb, epl)
        })
    }

    fn set_stalled(&self, ep_addr: EndpointAddress, stalled: bool) {
        interrupt::free(|cs| {
            if self.is_stalled(ep_addr) == stalled { return }

            let ep = &self.epl_regs.borrow(cs).eps[ep_addr.index()];
            match (stalled, ep_addr.direction()) {
                (true, UsbDirection::In) => ep.ep_in[0].modify(|_, w| w.s().stalled()),
                (true, UsbDirection::Out) => ep.ep_out[0].modify(|_, w| w.s().stalled()),

                (false, UsbDirection::In) => ep.ep_in[0].modify(|_, w| w.s().not_stalled()),
                (false, UsbDirection::Out) => ep.ep_out[0].modify(|_, w| w.s().not_stalled()),
            };
        });
    }

    fn is_stalled(&self, ep_addr: EndpointAddress) -> bool {
        interrupt::free(|cs| {
            let ep = &self.epl_regs.borrow(cs).eps[ep_addr.index()];
            match ep_addr.direction() {
                UsbDirection::In => ep.ep_in[0].read().s().is_stalled(),
                UsbDirection::Out => ep.ep_out[0].read().s().is_stalled(),
            }
        })
    }

    fn suspend(&self) {
        // hprintln!("suspend not implemented!").unwrap();
        // interrupt::free(|cs| {
        //      self.regs.borrow(cs).cntr.modify(|_, w| w
        //         .fsusp().set_bit()
        //         .lpmode().set_bit());
        // });
    }

    fn resume(&self) {
        // hprintln!("resume not implemented!").unwrap();
        // interrupt::free(|cs| {
        //     self.regs.borrow(cs).cntr.modify(|_, w| w
        //         .fsusp().clear_bit()
        //         .lpmode().clear_bit());
        // });
    }
}

