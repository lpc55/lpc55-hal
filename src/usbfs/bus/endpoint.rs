use core::cmp::min;
use cortex_m::interrupt::{Mutex, CriticalSection};
use usb_device::{Result, UsbError};
use usb_device::endpoint::EndpointType;
// use crate::usbfs::bus::constants::{
//     UsbAccessType,
// };
// use crate::target::{UsbRegisters, usb, UsbAccessType};
use crate::usbfs::bus::endpoint_memory::{EndpointBuffer, /*BufferDescriptor, EndpointMemoryAllocator*/};
use super::endpoint_list;
use super::endpoint_list::Instance as EndpointListInstance;
use crate::{
    read_endpoint, /*write_endpoint,*/ modify_endpoint,
    read_endpoint_i, /*write_endpoint_i,*/ modify_endpoint_i,
    read_out_endpoint_i,
    read_in_endpoint_i,
};
use crate::raw::USB0;
// use cortex_m_semihosting::{dbg, hprintln};
// use vcell::VolatileCell;
//
use core::sync::atomic::{compiler_fence, Ordering};


// macro_rules! dbgx {
//     () => {
//         hprintln!("[{}:{}]", file!(), line!()).unwrap();
//     };
//     ($val:expr) => {
//         // Use of `match` here is intentional because it affects the lifetimes
//         // of temporaries - https://stackoverflow.com/a/48732525/1063961
//         match $val {
//             tmp => {
//                 hprintln!("[{}:{}] {} = {:#x?}",
//                     file!(), line!(), stringify!($val), &tmp).unwrap();
//                 tmp
//             }
//         }
//     };
//     // Trailing comma with single argument is ignored
//     ($val:expr,) => { dbgx!($val) };
//     ($($val:expr),+ $(,)?) => {
//         ($(dbgx!($val)),+,)
//     };
// }

/// Arbitrates access to the endpoint-specific registers and packet buffer memory.
#[derive(Default)]
pub struct Endpoint {
    out_buf: Option<Mutex<EndpointBuffer>>,
    setup_buf: Option<Mutex<EndpointBuffer>>,
    in_buf: Option<Mutex<EndpointBuffer>>,
    ep_type: Option<EndpointType>,
    index: u8,
}
unsafe impl Send for Endpoint {}

impl Endpoint {
    pub fn new(index: u8) -> Endpoint {
        Endpoint {
            out_buf: None,
            setup_buf: None,
            in_buf: None,
            ep_type: None,
            index,
        }
    }

    pub fn index(&self) -> u8 {self.index }

    pub fn ep_type(&self) -> Option<EndpointType> { self.ep_type }

    pub fn set_ep_type(&mut self, ep_type: EndpointType) { self.ep_type = Some(ep_type); }

    pub fn buf_addroff(&self, buf: &EndpointBuffer) -> u32 {
        // need to be 64 byte aligned
        assert!(buf.addr() & ((1 << 6) - 1) == 0);
        // the bits above 21:6 are stored in databufstart
        ((buf.addr() >> 6) & ((1 << 16) - 1)) as u32
    }

    // OUT
    pub fn is_out_buf_set(&self) -> bool { self.out_buf.is_some() }

    pub fn set_out_buf(&mut self, buffer: EndpointBuffer) {
        self.out_buf = Some(Mutex::new(buffer));
        // self.reset_out_buf();
    }

    pub fn reset_out_buf(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // hardware modifies the NBytes and Offset entries, need to change them back periodically

        if !self.is_out_buf_set() { return; };
        let buf = self.out_buf.as_ref().unwrap().borrow(cs);
        let addroff = self.buf_addroff(buf);
        let len = buf.len() as u32;
        let i = self.index as usize;

        if i == 0 {
            modify_endpoint!(endpoint_list, epl, EP0OUT,
                NBYTES: len,
                ADDROFF: addroff,
                A: Active,
                // D: Enabled,  // marked as R (i assume for reserved) for EP0
                S: NotStalled
            );
        } else {
            modify_endpoint_i!(endpoint_list, epl, i, 0, 0,
                NBYTES: len,
                ADDROFF: addroff,
                A: Active,
                D: Enabled,
                S: NotStalled
            );
        }
    }

    // SETUP
    pub fn is_setup_buf_set(&self) -> bool { self.setup_buf.is_some() }

    pub fn set_setup_buf(&mut self, buffer: EndpointBuffer) {
        self.setup_buf = Some(Mutex::new(buffer));
    }

    pub fn reset_setup_buf(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // I think this only has to be called once, as hardware never
        // changes ADDROFF
        if !self.is_setup_buf_set() { return; };
        let buf = self.setup_buf.as_ref().unwrap().borrow(cs);
        let addroff = self.buf_addroff(buf);
        modify_endpoint!(endpoint_list, epl, SETUP, ADDROFF: addroff);
    }

    // IN
    pub fn is_in_buf_set(&self) -> bool { self.in_buf.is_some() }

    pub fn set_in_buf(&mut self, buffer: EndpointBuffer) {
        self.in_buf = Some(Mutex::new(buffer));
        // self.reset_in_buf();
    }

    pub fn reset_in_buf(&self, cs: &CriticalSection, epl: &EndpointListInstance) {
        // hardware modifies the NBytes and Offset entries, need to change them back periodically

        if !self.is_in_buf_set() { return; };

        // hprintln!("attempting reset in buf {}", self.index).ok();
        let buf = self.in_buf.as_ref().unwrap().borrow(cs);
        let addroff = self.buf_addroff(buf);
        // let len = buf.len() as u32;

        let i = self.index as usize;
        if i == 0 {
            modify_endpoint!(endpoint_list, epl, EP0IN,
                NBYTES: 0u32,
                ADDROFF: addroff,
                A: NotActive,
                D: Enabled,  // marked as R (i assume for reserved) for EP0
                S: NotStalled
            );
        } else {
            // assert!(read_endpoint_i!(endpoint_list, epl, i, 1, 0, A == NotActive));
            modify_endpoint_i!(endpoint_list, epl, i, 1, 0,
                NBYTES: 0u32,
                ADDROFF: addroff,
                // A: NotActive,  // can't set NotActive for EP > 0
                D: Enabled,
                S: NotStalled
            );
        }
    }

    pub fn configure(&self, cs: &CriticalSection, usb: &USB0, epl: &EndpointListInstance) {
        let ep_type = match self.ep_type {
            Some(t) => t,
            None => { return },
        };

        // no support for Isochronous endpoints
        assert!(ep_type != EndpointType::Isochronous);

        usb.intstat.write(|w| w.ep0out().set_bit());
        assert!(usb.intstat.read().ep0out().bit_is_clear());
        usb.intstat.write(|w| w.ep0in().set_bit());
        assert!(usb.intstat.read().ep0in().bit_is_clear());

        self.reset_out_buf(cs, epl);
        if self.index == 0 {
            self.reset_setup_buf(cs, epl);
        }
        self.reset_in_buf(cs, epl);
    }

    pub fn write(&self, buf: &[u8], cs: &CriticalSection, usb: &USB0, epl: &EndpointListInstance) -> Result<usize> {
        let i = self.index as usize;

        if !self.is_in_buf_set() { return Err(UsbError::WouldBlock); }
        let in_buf = self.in_buf.as_ref().unwrap().borrow(cs);

        if buf.len() > in_buf.capacity() {
            cortex_m_semihosting::hprintln!("buffer overflow!").ok();
            return Err(UsbError::BufferOverflow);
        }

        // if usb.devcmdstat.read().setup().bit_is_set() {
        //     // hprintln!("woops, want to write but setup bit is set").ok();
        // }

        if i > 0 && read_endpoint_i!(endpoint_list, epl, i, 1, 0, A == Active) {
            // NB: With this test in place, `bench_bulk_read` from TestClass fails.
            // cortex_m_semihosting::hprintln!("can't write yet, EP {} IN still active", i).ok();
            return Err(UsbError::WouldBlock);
        }

        // now done below
        // self.reset_in_buf(cs, epl);
        in_buf.write(buf);

        compiler_fence(Ordering::SeqCst);

        if i == 0 {
            self.reset_in_buf(cs, epl);
            modify_endpoint!(endpoint_list, epl, EP0IN,
                NBYTES: buf.len() as u32,
                A: Active
            );
        } else {
            modify_endpoint_i!(endpoint_list, epl, i, 1, 0,
                NBYTES: buf.len() as u32,
                ADDROFF: self.buf_addroff(in_buf),
                // A: Active,
                D: Enabled,
                S: NotStalled
            );
            compiler_fence(Ordering::SeqCst);
            modify_endpoint_i!(endpoint_list, epl, i, 1, 0,
                A: Active
            );
            // modify_endpoint_i!(endpoint_list, epl, i, 1, 0,
            //     NBYTES: buf.len() as u32,
            //     A: Active
            // );
        }

        // hprintln!("wrote {:#x?}", buf).ok();
        // cortex_m_semihosting::hprintln!("wrote {}B", buf.len()).unwrap();
        Ok(buf.len())
    }

    pub fn read(&self, buf: &mut [u8], cs: &CriticalSection, usb: &USB0, epl: &EndpointListInstance) -> Result<usize> {
        let devcmdstat_r = usb.devcmdstat.read();
        let intstat_r = usb.intstat.read();

        let i = self.index as usize;

        if !self.is_out_buf_set() { return Err(UsbError::WouldBlock); }

        if i == 0 {
            if !(intstat_r.ep0out().bit_is_set() || devcmdstat_r.setup().bit_is_set()) {
                return Err(UsbError::WouldBlock);
            }

            if devcmdstat_r.setup().bit_is_set() {
                if !self.is_setup_buf_set() { return Err(UsbError::WouldBlock); }

                let setup_buf = self.setup_buf.as_ref().unwrap().borrow(cs);
                if buf.len() < 8 {
                    panic!("reading very small SETUP");
                    return Err(UsbError::WouldBlock);
                }
                setup_buf.read(&mut buf[..8]);

                // if usb.intstat.read().ep0out().bit_is_set() {
                //     usb.intstat.write(|w| w.ep0out().set_bit());
                //     assert!(usb.intstat.read().ep0out().bit_is_clear());
                // }
                assert!(usb.intstat.read().ep0out().bit_is_set());
                usb.intstat.write(|w| w.ep0out().set_bit());

                // UM insists: clear all these bits *before* clearing DEVCMDSTAT.SETUP
                modify_endpoint!(endpoint_list, epl, EP0OUT,
                    A: NotActive, S: NotStalled
                );
                modify_endpoint!(endpoint_list, epl, EP0IN,
                    A: NotActive, S: NotStalled
                );

                usb.intstat.write(|w| w.ep0in().set_bit());
                assert!(usb.intstat.read().ep0in().bit_is_clear());

                usb.devcmdstat.modify(|_, w| w.setup().set_bit());
                assert!(usb.devcmdstat.read().setup().bit_is_clear());

                // prepare to receive more
                self.reset_out_buf(cs, epl);
                Ok(8)

            } else {
                let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
                let nbytes = read_endpoint!(endpoint_list, epl, EP0OUT, NBYTES) as usize;
                let count = min((out_buf.len() - nbytes) as usize, buf.len());

                out_buf.read(&mut buf[..count]);

                self.reset_out_buf(cs, epl);
                // usb.intstat.modify(|_, w| w.ep0out().set_bit());
                usb.intstat.write(|w| w.ep0out().set_bit());

                // maybe remove this again...
                // current issue: after (successful) "Get Device Descriptor",
                // the following "Set Address" fails.
                // if count == 0 {
                //     modify_endpoint!(endpoint_list, epl, EP0OUT, A: NotActive);
                // }

                // dbg!("endof read out, count {}", count);
                Ok(count)
            }
        } else {

            // need an ergonomic way to map i to register field
            let ep_out_offset = 2*i;
            let ep_out_int = ((intstat_r.bits() >> ep_out_offset) & 0x1) != 0;

            if !ep_out_int {
                // hprintln!("pseudo-unmotivated read").ok();
                return Err(UsbError::WouldBlock);
            }

            if read_out_endpoint_i!(endpoint_list, epl, i, A == Active) {
                // hprintln!("can't read yet, EP {} OUT still active", i).ok();
                return Err(UsbError::WouldBlock);
            }

            let out_buf = self.out_buf.as_ref().unwrap().borrow(cs);
            let nbytes = read_out_endpoint_i!(endpoint_list, epl, i, NBYTES) as usize;

            let count = min((out_buf.len() - nbytes) as usize, buf.len());
            // hprintln!("nbytes = {}, out_buf.len = {}, count = {}",
            //           nbytes, out_buf.len(), count).ok();

            out_buf.read(&mut buf[..count]);

            // unsafe { usb.intstat.write(|w| w.bits(intstat_r.bits() | (1u32 << ep_out_offset))) };
            unsafe { usb.intstat.write(|w| w.bits(1u32 << ep_out_offset)) };
            compiler_fence(Ordering::SeqCst);
            self.reset_out_buf(cs, epl);

            Ok(count)
        }
    }

}
