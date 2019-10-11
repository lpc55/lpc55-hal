pub mod constants;

pub mod endpoint;
use endpoint::Endpoint;

pub mod endpoint_memory;
use endpoint_memory::{
    EndpointMemoryAllocator,
    EP_MEM_PTR,
};

pub mod endpoint_list;

// move this into a submodule `bus` again?

use core::marker::PhantomData;
use core::mem;
use cortex_m::interrupt::{self, Mutex};
use usb_device::{Result, UsbDirection, UsbError};
use usb_device::endpoint::{EndpointType, EndpointAddress};
use usb_device::bus::{UsbBusAllocator, PollResult};
use crate::raw::USB0;
use crate::usbfs::device::UsbFsDev;
use crate::states::init_state;

use cortex_m_semihosting::{/*dbg,*/ hprintln};

use crate::{read_endpoint, modify_endpoint, read_endpoint_i};

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
    epl_regs: Mutex<endpoint_list::Instance>,
    endpoints: [Endpoint; self::constants::NUM_ENDPOINTS],
    ep_allocator: EndpointMemoryAllocator,
    max_endpoint: usize,
    pins: PhantomData<PINS>,
}


impl<PINS: UsbPins+Sync> UsbBus<PINS> {
    /// Constructs a new USB peripheral driver.
    // pub fn new(usb0: USB0, _pins: PINS) -> UsbBusAllocator<Self> {
    pub fn new(usbfs: UsbFsDev<init_state::Enabled>, _pins: PINS) -> UsbBusAllocator<Self> {
        use self::constants::NUM_ENDPOINTS;

        // TODO: "attach" or allocate the EndpointList
        let bus = UsbBus {
            usb_regs: Mutex::new(usbfs.release()),
            epl_regs: Mutex::new(endpoint_list::attach().unwrap()),
            ep_allocator: EndpointMemoryAllocator::new(),
            max_endpoint: 0,
            endpoints: unsafe {
                let mut endpoints: [Endpoint; NUM_ENDPOINTS] = mem::uninitialized();

                for i in 0..NUM_ENDPOINTS {
                    endpoints[i] = Endpoint::new(i as u8);
                }

                endpoints
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
        // let index = ep_addr.expect("implicit ep addresses not supported");
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
                // hprintln!(
                //     "databufstart: 0x{:x}, wrote 0x{:x}",
                //     EP_MEM_PTR as usize,
                //     usb.databufstart.read().da_buf().bits(),
                // ).unwrap();
            };

            // EPLISTSTART
            unsafe {
                let epliststart = epl.addr;
                // needs to be 256 byte aligned
                // assert!(epliststart & (256 - 1) == 0); // or epliststart as u8 == 0?
                assert!(epliststart as u8 == 0);
                usb.epliststart.modify(
                    |_, w| w.ep_list().bits(epliststart >> 8)
                );
                // hprintln!(
                //     "epliststart: 0x{:x}, wrote 0x{:x}",
                //     epliststart,
                //     usb.epliststart.read().ep_list().bits(),
                // ).unwrap();
            }

            // let intstat = usb.intstat.read();
            // let devcmdstat = usb.devcmdstat.read();

            // dbg!(intstat.dev_int().bit_is_set());
            // dbg!(intstat.ep0out().bit_is_set());
            // dbg!(intstat.ep0in().bit_is_set());
            // dbg!(devcmdstat.setup().bit_is_set());

            // ENABLE + CONNECT
            usb.devcmdstat.modify(|_, w| w
                .dev_en().set_bit()
                .dcon().set_bit()
                // if this bit is not set, it seems like we sometimes
                // miss an OUT interrupt, e.g. for CDC-ACM
                // TODO: figure out if there's a logic error
                .intonnak_ao().set_bit()
                // .intonnak_ai().set_bit()
            );
        });
    }

    fn reset(&self) {
        interrupt::free(|cs| {
            // set device address to 0
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            unsafe {
                usb.devcmdstat.modify(|_, w| w.dev_addr().bits(0));
            }

            for ep in self.endpoints.iter() {
                ep.configure(cs, usb, epl);
            }

            // // clear all interrupts
            // unsafe {
            //     usb.intstat.modify(|_, w| w.bits(!0));
            // }
        });
    }

    fn set_device_address(&self, addr: u8) {
        interrupt::free(|cs| {
            unsafe { self.usb_regs.borrow(cs).devcmdstat.modify(|_, w| w.dev_addr().bits(addr)) };
        });
    }

    fn poll(&self) -> PollResult {
        interrupt::free(|cs| {
            let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            let devcmdstat = &usb.devcmdstat;
            let intstat = &usb.intstat;

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
            let devcmdstat_r = usb.devcmdstat.read();
            let intstat_r = usb.intstat.read();

            // First handle endpoint 0 (the only control endpoint)
            if intstat_r.ep0out().bit_is_set() {
                ep_out |= bit;
            }

            if devcmdstat_r.setup().bit_is_set() {
                ep_setup |= bit;
            }

            if intstat_r.ep0in().bit_is_set() {
                intstat.modify(|_, w| w.ep0in().set_bit());
                assert!(intstat.read().ep0in().bit_is_clear());
                ep_in_complete |= bit;

                // EP0 needs manual toggling of Active bits
                // Weeelll interesting, not changing this makes no difference
                modify_endpoint!(endpoint_list, epl, EP0IN, A: NotActive);
                // prevents OUT-DATA-NAK
                modify_endpoint!(endpoint_list, epl, EP0OUT, A: Active);
            }

            // let mut i = 0;
            for ep in &self.endpoints[1..=self.max_endpoint] {
                bit <<= 1;
                let i = ep.index();

                // TODO: implement these endpoints
                let ep_out_offset = 2*i;
                let ep_in_offset = 2*i + 1;

                let ep_out_int = ((intstat_r.bits() >> ep_out_offset) & 0x1) != 0;
                if ep_out_int {
                    ep_out |= bit;
                    // hprintln!("OUT on EP {}", i).ok();
                } else {
                    let nbytes = read_endpoint_i!(endpoint_list, epl, i as usize, 0, 0, NBYTES) as usize;
                    if (nbytes > 0) && (nbytes != 64) {
                        // hprintln!("man, missed an interrupt! {}", nbytes).ok();
                        // ep_out |= bit;
                    }
                }

                let ep_in_int = ((intstat_r.bits() >> ep_in_offset) & 0x1) != 0;
                if ep_in_int {
                    ep_in_complete |= bit;
                    let intstat_r = usb.intstat.read();
                    // clear it
                    unsafe { usb.intstat.write(|w| w.bits(intstat_r.bits() | (1u32 << ep_in_offset))) };
                    // hprintln!("IN-COMPLETE on EP {}", i).ok();
                    // ep.reset_in_buf(cs, epl);
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
            // let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            // hprintln!("to do some stalling {}, direction {:?}",
            //           stalled, ep_addr.direction()).ok();
            if self.is_stalled(ep_addr) == stalled {
                return
            }

            match (stalled, ep_addr.direction()) {
                (true, UsbDirection::In) => modify_endpoint!(endpoint_list, epl, EP0IN, S: Stalled),
                (true, UsbDirection::Out) => modify_endpoint!(endpoint_list, epl, EP0OUT, S: Stalled),
                (false, UsbDirection::In) => modify_endpoint!(endpoint_list, epl, EP0IN, S: NotStalled),
                (false, UsbDirection::Out) => modify_endpoint!(endpoint_list, epl, EP0OUT, S: NotStalled),
            };
        });
    }

    fn is_stalled(&self, ep_addr: EndpointAddress) -> bool {
        interrupt::free(|cs| {
            // let usb = self.usb_regs.borrow(cs);
            let epl = self.epl_regs.borrow(cs);

            match ep_addr.direction() {
                UsbDirection::In => {
                    return read_endpoint!(endpoint_list, epl, EP0IN, S == Stalled)
                },
                UsbDirection::Out => {
                    return read_endpoint!(endpoint_list, epl, EP0OUT, S == Stalled)
                },
            }
        })
    }

    fn suspend(&self) {
        hprintln!("suspend not implemented!").unwrap();
        // interrupt::free(|cs| {
        //      self.regs.borrow(cs).cntr.modify(|_, w| w
        //         .fsusp().set_bit()
        //         .lpmode().set_bit());
        // });
    }

    fn resume(&self) {
        hprintln!("resume not implemented!").unwrap();
        // interrupt::free(|cs| {
        //     self.regs.borrow(cs).cntr.modify(|_, w| w
        //         .fsusp().clear_bit()
        //         .lpmode().clear_bit());
        // });
    }
}
