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

use cortex_m_semihosting::{dbg, hprintln};

use crate::{
    read_endpoint, write_endpoint, modify_endpoint,
};

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
    // TODO: use either a RegProxy, or perhaps a
    // UsbFsDev<is::Enabled>
    usb0_regs: Mutex<USB0>,
    ep_regs: Mutex<endpoint_list::Instance>,
    endpoints: [Endpoint; self::constants::NUM_ENDPOINTS],
    ep_allocator: EndpointMemoryAllocator,
    /// maximum endpoint in use
    /// NB: they are assumed to be consecutive, to avoid book-keeping
    max_endpoint: usize,
    pins: PhantomData<PINS>,
}


impl<PINS: UsbPins+Sync> UsbBus<PINS> {
    /// Constructs a new USB peripheral driver.
    // pub fn new(usb0: USB0, _pins: PINS) -> UsbBusAllocator<Self> {
    pub fn new(usbfs: UsbFsDev<init_state::Enabled>, _pins: PINS) -> UsbBusAllocator<Self> {
//        apb_usb_enable();

        // TODO:
        // - use UsbFsDev<Enabled>
        // - "attach" or allocate the EndpointList
        use self::constants::NUM_ENDPOINTS;
        let bus = UsbBus {
//            regs: Mutex::new(UsbRegisters::new(regs)),
            usb0_regs: Mutex::new(usbfs.release()),
            // usb0_regs: Mutex::new(usb0),
            ep_regs: Mutex::new(endpoint_list::attach().unwrap()),
            ep_allocator: EndpointMemoryAllocator::new(),
            // NB: technically not correct, control pipe is not allocated yet,
            // but of course it will be, later on. This field is actually set only
            // when `.enable()` is called and the bus configuration is frozen
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

//    /// Simulates a disconnect from the USB bus, causing the host to reset and re-enumerate the
//    /// device.
//    ///
//    /// Mostly used for development. By calling this at the start of your program ensures that the
//    /// host re-enumerates your device after a new program has been flashed.
//    ///
//    /// `disconnect` parameter is used to provide a custom disconnect function.
//    /// This function will be called with USB peripheral powered down
//    /// and interrupts disabled.
//    /// It should perform disconnect in a platform-specific way.
//    pub fn force_reenumeration<F: FnOnce()>(&self, disconnect: F)
//    {
//        interrupt::free(|cs| {
//            let regs = self.regs.borrow(cs);

//            let pdwn = regs.cntr.read().pdwn().bit_is_set();
//            regs.cntr.modify(|_, w| w.pdwn().set_bit());

//            disconnect();

//            regs.cntr.modify(|_, w| w.pdwn().bit(pdwn));
//        });
//    }
}


impl<PINS: Send+Sync> usb_device::bus::UsbBus for UsbBus<PINS> {
    fn alloc_ep(
        &mut self,
        ep_dir: UsbDirection,
        ep_addr: Option<EndpointAddress>,
        ep_type: EndpointType,
        max_packet_size: u16,
        _interval: u8) -> Result<EndpointAddress>
    {
        // let index = ep_addr.expect("implicit ep addresses not supported");
        for index in ep_addr.map(|a| a.index()..a.index()+1).unwrap_or(1..self::constants::NUM_ENDPOINTS) {
            let ep = &mut self.endpoints[index];

            match ep.ep_type() {
                None => { ep.set_ep_type(ep_type); },
                Some(t) if t != ep_type => { continue; },
                _ => { },
            };

            // usb-device uses 8 bytes IN/OUT buffers for control by default
            match ep_dir {
                UsbDirection::Out if !ep.is_out_buf_set() => {
                    // let (out_size, size_bits) = calculate_count_rx(max_packet_size as usize)?;
                    let size = max_packet_size;

                    let buffer = self.ep_allocator.allocate_buffer(size as _)?;
                    // hprintln!("alloc_ep allocated {}B for OUT buffer {}", size, index).unwrap();

                    ep.set_out_buf(buffer);

                    return Ok(EndpointAddress::from_parts(index, ep_dir));
                },
                UsbDirection::In if !ep.is_in_buf_set() => {
                    // let size = (max_packet_size as usize + 1) & !0x01;
                    let size = max_packet_size;

                    let buffer = self.ep_allocator.allocate_buffer(size as _)?;
                    // hprintln!("alloc_ep allocated {}B for IN buffer {}", size, index).unwrap();

                    ep.set_in_buf(buffer);

                    return Ok(EndpointAddress::from_parts(index, ep_dir));
                }
                _ => { }
            }
        }

        Err(match ep_addr {
            Some(_) => UsbError::InvalidEndpoint,
            None => UsbError::EndpointOverflow,
        })
    }

    fn enable(&mut self) {
        let mut max = 0;
        for (index, ep) in self.endpoints.iter().enumerate() {
            if ep.is_out_buf_set() || ep.is_in_buf_set() {
                max = index;
            }
        }

        self.max_endpoint = max;
        // hprintln!("Set max_endpoint to {}", max).unwrap();


        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let ep_regs = self.ep_regs.borrow(cs);

        //     regs.cntr.modify(|_, w| w.pdwn().clear_bit());

        //     // There is a chip specific startup delay. For STM32F103xx it's 1µs and this should wait for
        //     // at least that long.
        //     delay(72);

        //     regs.btable.modify(|_, w| w.btable().bits(0));
        //     regs.cntr.modify(|_, w| w
        //         .fres().clear_bit()
        //         .resetm().set_bit()
        //         .suspm().set_bit()
        //         .wkupm().set_bit()
        //         .ctrm().set_bit());
        //     regs.istr.modify(|_, w| unsafe { w.bits(0) });

        //     #[cfg(feature = "dp_pull_up_support")]
        //     regs.bcdr.modify(|_, w| w.dppu().set_bit());

            unsafe {
                let databufstart = ((EP_MEM_PTR as usize) >> 22) as u16;
                usb0_regs.databufstart.modify(
                    |_, w| w.da_buf().bits(databufstart)
                );
                hprintln!("databufstart 0x{:x}", usb0_regs.databufstart.read().da_buf().bits()).unwrap();
            };

            unsafe {
                let epliststart = ep_regs.addr;
                // needs to be 256 byte aligned
                assert!(epliststart & (256 - 1) == 0);
                // hprintln!("epliststart {:x}", epliststart).unwrap();
                // hprintln!("epliststart >> 8 {:x}", epliststart >> 8).unwrap();
                usb0_regs.epliststart.modify(
                    |_, w| w.ep_list().bits(epliststart >> 8)
                );
                hprintln!("epliststart 0x{:x}", usb0_regs.epliststart.read().ep_list().bits()).unwrap();
            }

            usb0_regs.devcmdstat.modify(|_, w| w
                .dev_en().set_bit()
                .dcon().set_bit()
            );
        });
    }

    fn reset(&self) {
        interrupt::free(|cs| {
        //     let regs = self.regs.borrow(cs);

        //     regs.istr.modify(|_, w| unsafe { w.bits(0) });
        //     regs.daddr.modify(|_, w| w.ef().set_bit().add().bits(0));

        //     for ep in self.endpoints.iter() {
        //         ep.configure(cs);
        //     }

            // set device address to 0
            let usb0_regs = self.usb0_regs.borrow(cs);
            unsafe {
                usb0_regs.devcmdstat.modify(|_, w| w.dev_addr().bits(0));
            }

            let ep_regs = self.ep_regs.borrow(cs);
            for ep in self.endpoints.iter() {
                ep.configure(cs, ep_regs);
            }
        });
    }

    fn set_device_address(&self, addr: u8) {
        hprintln!("setting device address {}", addr).unwrap();
        interrupt::free(|cs| {
            unsafe { self.usb0_regs.borrow(cs).devcmdstat.modify(|_, w| w.dev_addr().bits(addr as u8)) };
        });
    }

    fn poll(&self) -> PollResult {
        // hprintln!("poll not implemented").unwrap();
        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let ep_regs = self.ep_regs.borrow(cs);
            let devcmdstat = usb0_regs.devcmdstat.read();
            let intstat = usb0_regs.intstat.read();

            if devcmdstat.dres_c().bit_is_set() {
                usb0_regs.devcmdstat.modify(|_, w| w.dres_c().clear_bit());
                // devcmdstatregs.istr.write(|w| unsafe { w.bits(0xffff) }.reset().clear_bit() );
                // hprintln!("RESET demanded").unwrap();
                PollResult::Reset

            // TODO: Resume, Suspend handling
            // TODO: consider checking for intstat.dev_int here
            } else {
                // dbg!(intstat.dev_int().bit_is_set());
                let mut ep_out = 0;
                let mut ep_in_complete = 0;
                let mut ep_setup = 0;

                let mut bit = 1;

                // First handle endpoint 0 (the only control endpoint)
                // hprintln!("intstat = {:x}", intstat.bits()).unwrap();
                if intstat.ep0out().bit_is_set() {
                    // dbg!(usb0_regs.intstat.read().dev_int().bit_is_set());
                    // dbg!(usb0_regs.inten.read().ep_int_en().bits());
                    // dbg!(usb0_regs.inten.read().frame_int_en().bit_is_set());
                    // dbg!(usb0_regs.inten.read().dev_int_en().bit_is_set());
                    // hprintln!("EP0OUT interrupt").unwrap();
                    dbg!(usb0_regs.intstat.read().ep0out().bit_is_set());
                    usb0_regs.intstat.modify(|_, w| w.ep0out().set_bit());
                    dbg!(usb0_regs.intstat.read().ep0out().bit_is_set());
                    // dbg!(usb0_regs.intstat.read().dev_int().bit_is_set());
                    // hprintln!("intstat after clearing ep0out = {:x}", intstat.bits()).unwrap();
                    // hprintln!("intstat after clearing ep0out = {:x}", intstat.bits()).unwrap();
                    // dbg!(intstat.dev_int().bit_is_set());
                    if devcmdstat.setup().bit_is_set() {
                        // hprintln!("SETUP received").unwrap();
                        // dbg!(devcmdstat.setup().bit_is_set());
                        // hprintln!("{:x}", unsafe {
                        //     core::ptr::read_volatile(0x2000_0040u32 as *const u32)
                        // } ).unwrap();
                        ep_setup |= bit;

                        // Q: need to clear it?
                        // self.endpoints[0].clear_in_out_active_stall(cs, ep_regs);
                        modify_endpoint!(endpoint_list, ep_regs, EP0IN, A: NotActive);
                        modify_endpoint!(endpoint_list, ep_regs, EP0IN, S: NotStalled);
                        modify_endpoint!(endpoint_list, ep_regs, EP0OUT, A: NotActive);
                        modify_endpoint!(endpoint_list, ep_regs, EP0OUT, S: NotStalled);
                        usb0_regs.intstat.modify(|_, w| w.ep0in().set_bit());

                        usb0_regs.devcmdstat.modify(|_, w|
                            w
                            .intonnak_co().clear_bit()
                            .intonnak_ci().clear_bit()
                            .setup().clear_bit()
                        );
                        let ep0out_nbytes = read_endpoint!(endpoint_list, ep_regs, EP0OUT, NBYTES);
                        assert!(ep0out_nbytes >= 8);
                        modify_endpoint!(endpoint_list, ep_regs, EP0OUT, NBYTES: (ep0out_nbytes - 8));

                        // get SETUP, implement lowerright corner of ep0 OUT "flowchart"
                        let mut setup = [0u8; 8];
                        self.endpoints[0].peak(&mut setup, usb0_regs, ep_regs);
                        let host_read = (setup[0] >> 7) != 0;

                        if host_read {
                            // write_endpoint!(endpoint_list, ep_regs, EP0IN, A: Active);
                            // hmm... has a *
                            write_endpoint!(endpoint_list, ep_regs, EP0IN, S: NotStalled);
                            usb0_regs.devcmdstat.modify(|_, w|
                                w
                                // i *think* the idea is to allow the host to abort
                                // the IN transfer, assume has no influence on device functionality
                                .intonnak_co().set_bit()
                                .intonnak_ci().clear_bit()
                            );
                        } else {
                            use core::convert::TryInto;
                            let recv_length = u16::from_le_bytes(setup[6..].try_into().unwrap());
                            if recv_length != 0 {
                                write_endpoint!(endpoint_list, ep_regs, EP0OUT, A: NotActive);
                                write_endpoint!(endpoint_list, ep_regs, EP0OUT, S: Stalled);
                                write_endpoint!(endpoint_list, ep_regs, EP0IN, A: Active);
                                write_endpoint!(endpoint_list, ep_regs, EP0IN, S: Stalled);
                            } else {
                                write_endpoint!(endpoint_list, ep_regs, EP0OUT, A: Active);
                                // hmm... has a *
                                // write_endpoint!(endpoint_list, ep_regs, EP0OUT, S: Stalled);
                                usb0_regs.devcmdstat.modify(|_, w|
                                    w
                                    .intonnak_co().clear_bit()
                                    .intonnak_ci().set_bit()
                                );
                            }
                        }

                        // TODO: handle OUT and IN
                    } else {
                        // hprintln!("non-SETUP received").unwrap();
                        ep_out |= bit;
                    }
                }
                if intstat.ep0in().bit_is_set() {
                    // hprintln!("EP0IN received").unwrap();
                    usb0_regs.intstat.modify(|_, w| w.ep0in().set_bit());
                    ep_in_complete |= bit;
                }

                for ep in &self.endpoints[1..=self.max_endpoint] {
                    // TODO: implement these endpoints
                }

                if ep_out != 0 || ep_in_complete != 0 || ep_setup != 0 {
                    PollResult::Data { ep_out, ep_in_complete, ep_setup }
                } else {
                    PollResult::None
                }
            }


        //     let istr = regs.istr.read();
        //     } else if istr.ctr().bit_is_set() {
        //         let mut ep_out = 0;
        //         let mut ep_in_complete = 0;
        //         let mut ep_setup = 0;
        //         let mut bit = 1;

        //         for ep in &self.endpoints[0..=self.max_endpoint] {
        //             let v = ep.read_reg();

        //             if v.ctr_rx().bit_is_set() {
        //                 ep_out |= bit;

        //                 if v.setup().bit_is_set() {
        //                     ep_setup |= bit;
        //                 }
        //             }

        //             if v.ctr_tx().bit_is_set() {
        //                 ep_in_complete |= bit;

        //                 interrupt::free(|cs| {
        //                     ep.clear_ctr_tx(cs);
        //                 });
        //             }

        //             bit <<= 1;
        //         }

        //         PollResult::Data { ep_out, ep_in_complete, ep_setup }
        //     } else {
        //         PollResult::None
        //     }
        })

        // // TODO: remove
        // PollResult::None
    }

    fn write(&self, ep_addr: EndpointAddress, buf: &[u8]) -> Result<usize> {
        // hprintln!("write not implemented!").unwrap();
        if !ep_addr.is_in() {
            return Err(UsbError::InvalidEndpoint);
        }

        // hprintln!("want to write {:?}", buf).unwrap();
        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let ep_regs = self.ep_regs.borrow(cs);

            self.endpoints[ep_addr.index()].write(buf, usb0_regs, ep_regs)
        })
    }

    fn read(&self, ep_addr: EndpointAddress, buf: &mut [u8]) -> Result<usize> {
        // hprintln!("usb-bus reading").unwrap();
        if !ep_addr.is_out() {
            return Err(UsbError::InvalidEndpoint);
        }

        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let ep_regs = self.ep_regs.borrow(cs);

            self.endpoints[ep_addr.index()].read(buf, usb0_regs, ep_regs)
        })
    }

    fn set_stalled(&self, ep_addr: EndpointAddress, stalled: bool) {
        // hprintln!("set_stalled only implemented for control!").unwrap();
        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let epl = self.ep_regs.borrow(cs);

            if self.is_stalled(ep_addr) == stalled {
                return
            }

        //     let ep = &self.endpoints[ep_addr.index()];

            match (stalled, ep_addr.direction()) {
                (true, UsbDirection::In) => modify_endpoint!(endpoint_list, epl, EP0IN, S: Stalled),
                (true, UsbDirection::Out) => modify_endpoint!(endpoint_list, epl, EP0OUT, S: Stalled),
                (false, UsbDirection::In) => modify_endpoint!(endpoint_list, epl, EP0IN, S: NotStalled),
                (false, UsbDirection::Out) => modify_endpoint!(endpoint_list, epl, EP0OUT, S: NotStalled),
            };

        //     match (stalled, ep_addr.direction()) {
        //         (true, UsbDirection::In) => ep.set_stat_tx(cs, EndpointStatus::Stall),
        //         (true, UsbDirection::Out) => ep.set_stat_rx(cs, EndpointStatus::Stall),
        //         (false, UsbDirection::In) => ep.set_stat_tx(cs, EndpointStatus::Nak),
        //         (false, UsbDirection::Out) => ep.set_stat_rx(cs, EndpointStatus::Valid),
        //     };
        });
    }

    fn is_stalled(&self, ep_addr: EndpointAddress) -> bool {
        // hprintln!("is_stalled only implemented for control!").unwrap();
        interrupt::free(|cs| {
            let usb0_regs = self.usb0_regs.borrow(cs);
            let epl = self.ep_regs.borrow(cs);

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

        // let ep = &self.endpoints[ep_addr.index()];
        // let reg_v = ep.read_reg();

        // let status = match ep_addr.direction() {
        //     UsbDirection::In => reg_v.stat_tx().bits(),
        //     UsbDirection::Out => reg_v.stat_rx().bits(),
        // };

        // status == (EndpointStatus::Stall as u8)

        // TODO: remove
        // return true;
    // }

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
