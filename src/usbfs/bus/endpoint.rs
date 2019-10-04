use core::mem;
use cortex_m::interrupt::{self, Mutex, CriticalSection};
use usb_device::{Result, UsbError};
use usb_device::endpoint::EndpointType;
use crate::usbfs::bus::constants::{
    UsbAccessType,
};
// use crate::target::{UsbRegisters, usb, UsbAccessType};
use crate::usbfs::bus::endpoint_memory::{EndpointBuffer, /*BufferDescriptor,*/ EndpointMemoryAllocator};
use super::endpoint_list;
use super::endpoint_list::Instance as EndpointListInstance;
use crate::{
    read_endpoint, write_endpoint, modify_endpoint,
    read_endpoint_i, write_endpoint_i, modify_endpoint_i,
};
use crate::raw::USB0;
use cortex_m_semihosting::{dbg, hprintln};
use vcell::VolatileCell;


/// Arbitrates access to the endpoint-specific registers and packet buffer memory.
#[derive(Default)]
pub struct Endpoint {
    out_buf: Option<Mutex<EndpointBuffer>>,
    in_buf: Option<Mutex<EndpointBuffer>>,
    ep_type: Option<EndpointType>,
    // TODO: protect this with a mutex or what?
    // epl: Mutex<EndpointListInstance>,
    index: u8,
}
unsafe impl Send for Endpoint {}

// pub fn calculate_count_rx(mut size: usize) -> Result<(usize, u16)> {
//     if size <= 62 {
//         // Buffer size is in units of 2 bytes, 0 = 0 bytes
//         size = (size + 1) & !0x01;

//         let size_bits = size >> 1;

//         Ok((size, (size_bits << 10) as u16))
//     } else if size <= 1024 {
//         // Buffer size is in units of 32 bytes, 0 = 32 bytes
//         size = (size + 31) & !0x1f;

//         let size_bits = (size >> 5) - 1;

//         Ok((size, (0x8000 | (size_bits << 10)) as u16))
//     } else {
//         Err(UsbError::EndpointMemoryOverflow)
//     }
// }

impl Endpoint {
    pub fn new(index: u8) -> Endpoint {
        Endpoint {
            out_buf: None,
            in_buf: None,
            ep_type: None,
            // epl: unsafe { endpoint_list::steal() },
            index,
        }
    }

    pub fn ep_type(&self) -> Option<EndpointType> {
        self.ep_type
    }

    pub fn set_ep_type(&mut self, ep_type: EndpointType) {
        self.ep_type = Some(ep_type);
    }

    pub fn is_out_buf_set(&self) -> bool {
        use super::endpoint_list as epl;
        self.out_buf.is_some()
    }

    pub fn out_buf_addroff(&self, cs: &CriticalSection, epl: &EndpointListInstance) -> usize {
        let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
        let out_buf_addr = out_buf.addr();
        let out_addroff = (out_buf_addr >> 6) & 0x7ff;
        out_addroff as usize
    }

    pub fn buf_addroff(&self, buf: &EndpointBuffer, cs: &CriticalSection, epl: &EndpointListInstance) -> u32 {
        // let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
        let buf_addr = buf.addr();
        let addroff = (buf_addr >> 6) & 0x7ff;
        addroff as u32
    }

    // need critical section?
    pub fn reset_out_buf(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // hardware modifies the NBytes and Offset entries,
        // need to change them back periodically
        let i = self.index as usize;
        // hprintln!("configuring endpoint {}", i).unwrap();
        let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
        if i == 0 {
            // we re-use out_buf for setup packets, which have size 8
            let len = out_buf.len() as u32;
            // dbg!(len);
            assert!(len >= 8);
            modify_endpoint!(endpoint_list, epl, EP0OUT, NBYTES: len);
            // let read_len = read_endpoint!(endpoint_list, epl, EP0OUT, NBYTES);

            // hprintln!("during reset_out_buf, EP0OUT NBYTES is {}", read_len).unwrap();
            // assert!(len == read_len);

            // let out_buf_addr = out_buf.addr();
            // // hprintln!("checking out_buf_addr 0x{:x}", out_buf_addr).unwrap();
            // assert!(out_buf_addr & 0x3f == 0);
            // let out_addroff = self.out_buf_addroff(cs, epl);
            let out_addroff = self.buf_addroff(out_buf, cs, epl);
            modify_endpoint!(endpoint_list, epl, EP0OUT, ADDROFF: out_addroff);
            modify_endpoint!(endpoint_list, epl, EP0OUT, A: Active);
            modify_endpoint!(endpoint_list, epl, SETUP, ADDROFF: out_addroff);

        } else {
            // hprintln!("rest_out_buf not implemented for non-control endpoints").unwrap();
        }
    }

    // pub fn set_out_buf(&mut self, buffer: EndpointBuffer, size_bits: u16) {
    pub fn set_out_buf(&mut self, buffer: EndpointBuffer) {
        // let offset = buffer.offset();
        self.out_buf = Some(Mutex::new(buffer));

        // TODO: need this already here?
        // self.reset_out_buf();

        // let descr = self.descr();
        // // uhh... do we need u16 capacity?
        // descr.addr_rx.set(offset as UsbAccessType);
        // descr.count_rx.set(size_bits as UsbAccessType);
    }

    pub fn is_in_buf_set(&self) -> bool {
        self.in_buf.is_some()
    }

    // need critical section?
    pub fn reset_in_buf(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // hardware modifies the NBytes and Offset entries,
        // need to change them back periodically
        let i = self.index as usize;
        // hprintln!("configuring endpoint {}", i).unwrap();
        let in_buf = self.in_buf.as_ref().unwrap().borrow(cs);
        if i == 0 {
            modify_endpoint!(endpoint_list, epl, EP0IN, NBYTES: 0);
            // let in_buf_addr = in_buf.addr();
            // assert!(in_buf_addr & 0x3f == 0);
            // let in_addroff = (in_buf_addr >> 6) & 0x7ff;
            let in_addroff = self.buf_addroff(in_buf, cs, epl);
            modify_endpoint!(endpoint_list, epl, EP0IN, ADDROFF: in_addroff);
            // modify_endpoint!(endpoint_list, epl, EP0IN, A: Active);
        } else {
            hprintln!("rest_in_buf not implemented for non-control endpoints").unwrap();
        }
    }

    pub fn set_in_buf(&mut self, buffer: EndpointBuffer) {
        // let offset = buffer.offset();
        self.in_buf = Some(Mutex::new(buffer));

        // TODO: need this already here?
        // self.reset_in_buf();

        // let descr = self.descr();
        // descr.addr_tx.set(offset as UsbAccessType);
        // descr.count_tx.set(0);
    }

    // pub fn setup_ready(&self) {
    //     self.setup_ready.set(true);
    // }

    pub fn clear_in_out_active_stall(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // hprintln!("clearing IN/OUT active/stall").unwrap();
        // NB: according to UM, need to clear Active bit(s) for EP0
        // (while in general software shouldn't do anything about it)
        // assert!(read_endpoint!(endpoint_list, epl, EP0IN, A == NotActive));
        modify_endpoint!(endpoint_list, epl, EP0IN, A: NotActive);
        modify_endpoint!(endpoint_list, epl, EP0IN, S: NotStalled);
        // assert!(read_endpoint!(endpoint_list, epl, EP0IN, S == NotStalled));

        // assert!(read_endpoint!(endpoint_list, epl, EP0OUT, A == NotActive));
        modify_endpoint!(endpoint_list, epl, EP0OUT, A: NotActive);
        modify_endpoint!(endpoint_list, epl, EP0OUT, S: NotStalled);
        // assert!(read_endpoint!(endpoint_list, epl, EP0OUT, S == NotStalled));
    }

    // fn descr(&self) -> &'static BufferDescriptor {
    //     EndpointMemoryAllocator::buffer_descriptor(self.index)
    // }

    // fn reg(&self) -> &'static usb::EPR {
    //     use crate::hal::raw::{usb, USB0};
    //     let usb_ptr = USB0::ptr() as *const usb::RegisterBlock;
    //     unsafe { &(*usb_ptr).epr[index as usize] }
    // }

    pub fn configure(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        let ep_type = match self.ep_type {
            Some(t) => t,
            None => {
                // hprintln!("not configuring endpoint {}", self.index).unwrap();
                return
            },
        };

        use super::endpoint_list as epl;

        // no support for Isochronous endpoints
        assert!(ep_type != EndpointType::Isochronous);

        let i = self.index as usize;
        // hprintln!("configuring endpoint {}", i).unwrap();
        if i == 0 {
            assert!(ep_type == EndpointType::Control);

            // TODO: do this here instead of in `set_out_buf` and `set_in_buf`?
            self.reset_out_buf(cs, epl);
            self.reset_in_buf(cs, epl);

            // now switch them on
            modify_endpoint!(epl, epl, EP0IN, A: 1);
            // modify_endpoint!(epl, epl, SETUP, A: 1);
            modify_endpoint!(epl, epl, EP0OUT, A: 1);

            // hprintln!("in configure, EP0OUT NBYTES is {}",
            //         read_endpoint!(endpoint_list, epl, EP0OUT, NBYTES),
            //         ).unwrap();

        } else {
            assert!(ep_type != EndpointType::Control);
            // OUT buffer 0
            modify_endpoint_i!(epl, epl, i, 0, 0, A: 1);
            // OUT buffer 1
            modify_endpoint_i!(epl, epl, i, 1, 0, A: 1);
            hprintln!("configuring endpoints > 0 not properly tested").unwrap();
        }

//         self.reg().modify(|_, w| {
//             Self::set_invariant_values(w)
//                 .ctr_rx().clear_bit()
//                 // dtog_rx
//                 // stat_rx
//                 .ep_type().bits(ep_type.bits())
//                 .ep_kind().clear_bit()
//                 .ctr_tx().clear_bit()
//                 // dtog_rx
//                 // stat_tx
//                 .ea().bits(self.index)
//         });

//         self.set_stat_rx(cs,
//             if self.out_buf.is_some() { EndpointStatus::Valid }
//             else { EndpointStatus::Disabled} );

//         self.set_stat_tx(cs,
//             if self.in_buf.is_some() { EndpointStatus::Nak }
//             else { EndpointStatus::Disabled} );
    }

    pub fn write(&self, buf: &[u8], usb0: &USB0, epl: &EndpointListInstance) -> Result<usize> {

        interrupt::free(|cs| {
            let in_buf = self.in_buf.as_ref().unwrap().borrow(cs);

            if buf.len() > in_buf.capacity() {
                return Err(UsbError::BufferOverflow);
            }

//             let reg = self.reg();

//             match reg.read().stat_tx().bits().into() {
//                 EndpointStatus::Valid | EndpointStatus::Disabled => return Err(UsbError::WouldBlock),
//                 _ => {},
//             };

            // hprintln!("write = {:?}, {}", buf, buf.len()).unwrap();
            in_buf.write(buf);
            self.reset_in_buf(cs, epl);
            write_endpoint!(endpoint_list, epl, EP0IN, NBYTES: buf.len() as u32);
            // hprintln!("intermediately NBYTES {}, Active {}",
            //           read_endpoint!(endpoint_list, epl, EP0IN, NBYTES),
            //           read_endpoint!(endpoint_list, epl, EP0IN, A == Active),
            //         ).unwrap();
            write_endpoint!(endpoint_list, epl, EP0IN, A: Active);
            // return Err(UsbError::BufferOverflow);
            // hprintln!("ending with NBYTES {}, Active {}",
            //           read_endpoint!(endpoint_list, epl, EP0IN, NBYTES),
            //           read_endpoint!(endpoint_list, epl, EP0IN, A == Active),
            //         ).unwrap();
            // only for EP0...
            if buf.len() == 0 || buf.len() == 8 {
                // write_endpoint!(endpoint_list, epl, EP0OUT, A: Active);
            }

//             self.descr().count_tx.set(buf.len() as u16 as UsbAccessType);

//             self.set_stat_tx(cs, EndpointStatus::Valid);

            Ok(buf.len())
        })
    }

    /// SUPER DANGEROUS, FIXME
    pub fn peak(&self, buf: &mut [u8], usb0: &USB0, epl: &EndpointListInstance) {
        interrupt::free(|cs| {
            let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
            // let i = self.index as usize;
            // if i == 0 {
            out_buf.read(buf);
        });
    }

    pub fn read(&self, buf: &mut [u8], usb0: &USB0, epl: &EndpointListInstance) -> Result<usize> {
        interrupt::free(|cs| {
            let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);

            let i = self.index as usize;
            // hprintln!("reading endpoint {}", i).unwrap();

            // sometimes, when we're lucky, we get:
            // [128, 6, 0, 1, 0, 0, 64, 0]
            // this is: GET_DESCRIPTOR for DEVICE

            // dbg!(usb0.devcmdstat.read().setup().bit_is_set());
            if i == 0 {
                // out_buf.read(&mut buf[0..8]);
                // hprintln!("received a setup packet: {:?}", &buf[..8]).unwrap();
                // hprintln!("EP0OUT NBYTES is {}",
                //         read_endpoint!(endpoint_list, epl, EP0OUT, NBYTES),
                //         ).unwrap();

                //if usb0.devcmdstat.read().setup().bit_is_set() {
                //    // THIS BIT IS CLEARED SOMEHOW
                //    // ANYWAY: we wouldn't know the size
                //    // hence we modify ADDROFF
                //    //
                //    // out_buf.read(&mut buf[0..8]);
                //    // hprintln!("received a setup packet: {:?}", &buf[..8]).unwrap();
                //    // usb0.devcmdstat.modify(|_, w| w.setup().clear_bit());
                //} else {

                // hprintln!("gosh were we too slow for the setup packet?").unwrap();
                // let nbytes =
                // hprintln!("read not implemented for non-setup endpoint 0").unwrap();

                let nbytes = read_endpoint!(endpoint_list, epl, EP0OUT, NBYTES) as usize;
                let count = (out_buf.len() - nbytes) as usize;
                // hprintln!("there are 0x{:x} bytes to read", count).unwrap();
                out_buf.read(&mut buf[..count]);
                // hprintln!("read = {:?}", &buf[..count]).unwrap();
                self.reset_out_buf(cs, epl);
                return Ok(count)
                // }

            } else {
                hprintln!("reading endpoints > 0 not implemented!").unwrap();
                return Ok(0)
            }

//             let reg_v = self.reg().read();

//             let status: EndpointStatus = reg_v.stat_rx().bits().into();

//             if status == EndpointStatus::Disabled || !reg_v.ctr_rx().bit_is_set() {
//                 return Err(UsbError::WouldBlock);
//             }

//             self.clear_ctr_rx(cs);

//             let count = (self.descr().count_rx.get() & 0x3ff) as usize;
//             if count > buf.len() {
//                 return Err(UsbError::BufferOverflow);
//             }

//             out_buf.read(&mut buf[0..count]);

//             self.set_stat_rx(cs, EndpointStatus::Valid);

//             Ok(count)
        })
        // Ok(0)
    }

//     pub fn read_reg(&self) -> usb::epr::R {
//         self.reg().read()
//     }

//     /// The endpoint register fields may be modified by hardware as well as software. To avoid race
//     /// conditions, there are invariant values for the fields that may be modified by the hardware
//     /// that can be written to avoid modifying other fields while modifying a single field. This
//     /// method sets all the volatile fields to their invariant values.
//     fn set_invariant_values(w: &mut usb::epr::W) -> &mut usb::epr::W {
//         w
//             .ctr_rx().set_bit()
//             .dtog_rx().clear_bit()
//             .stat_rx().bits(0)
//             .ctr_tx().set_bit()
//             .dtog_tx().clear_bit()
//             .stat_tx().bits(0)
//     }

//     pub fn clear_ctr_rx(&self, _cs: &CriticalSection) {
//         self.reg().modify(|_, w|
//             Self::set_invariant_values(w)
//                 .ctr_rx().clear_bit());
//     }

//     pub fn clear_ctr_tx(&self, _cs: &CriticalSection) {
//         self.reg().modify(|_, w|
//             Self::set_invariant_values(w)
//                 .ctr_tx().clear_bit());
//     }

//     pub fn set_stat_rx(&self, _cs: &CriticalSection, status: EndpointStatus) {
//         self.reg().modify(|r, w| {
//             Self::set_invariant_values(w)
//                 .stat_rx().bits(r.stat_rx().bits() ^ (status as u8))
//         });
//     }

//     pub fn set_stat_tx(&self, _cs: &CriticalSection, status: EndpointStatus) {
//         self.reg().modify(|r, w| {
//             Self::set_invariant_values(w)
//                 .stat_tx().bits(r.stat_tx().bits() ^ (status as u8))
//         });
//     }
}

trait EndpointTypeExt {
    fn bits(self) -> u8;
}

impl EndpointTypeExt for EndpointType {
    fn bits(self) -> u8 {
        // recall, EndpointType is enum(Control, Isochronous, Bulk, Interrupt)
        const BITS: [u8; 4] = [0b01, 0b10, 0b00, 0b11];
        return BITS[self as usize];
    }
}

#[repr(u8)]
#[derive(PartialEq, Eq, Debug)]
#[allow(unused)]
pub enum EndpointStatus {
    Disabled = 0b00,
    Stall = 0b01,
    Nak = 0b10,
    Valid = 0b11,
}

impl From<u8> for EndpointStatus {
    fn from(v: u8) -> EndpointStatus {
        if v <= 0b11 {
            unsafe { mem::transmute(v) }
        } else {
            EndpointStatus::Disabled
        }
    }
}
