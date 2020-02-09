use crate::{
    raw,
    peripherals::{
        syscon::Syscon,
    },
    typestates::{
        init_state,
    }
};

#[repr(align(16))]
struct Descriptor{
    transfer_config: u32,
    source_end_addr: u32,
    dest_end_addr: u32,
    next: u32,
}

#[repr(align(512))]
struct Align512(
    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,

    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,
    Descriptor,Descriptor,Descriptor,Descriptor,
);

macro_rules! Empty {
    () => {
        Descriptor{transfer_config:0, source_end_addr:0, dest_end_addr:0, next:0}
    }
}

static mut DESCRIPTORS: Align512 = Align512(
    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),

    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),
    Empty!(),Empty!(),Empty!(),Empty!(),
);

crate::wrap_stateful_peripheral!(Dma, DMA0);

impl<State> Dma<State> {
    pub fn enabled(mut self, syscon: &mut Syscon) -> Dma<init_state::Enabled> {
        syscon.enable_clock(&mut self.raw);
        syscon.raw.presetctrl0.modify(|_,w| { w.dma0_rst().clear_bit() });

        self.raw.ctrl.write(|w| {w.enable().set_bit()});

        let descriptor_addr = unsafe {
            ((&DESCRIPTORS) as *const Align512) as u32
        };

        self.raw.srambase.write(|w|unsafe{w.bits(descriptor_addr)});

        Dma {
            raw: self.raw,
            _state: init_state::Enabled(()),
        }
    }

    pub fn disabled(mut self, syscon: &mut Syscon) -> Dma<init_state::Disabled> {
        syscon.disable_clock(&mut self.raw);
        Dma {
            raw: self.raw,
            _state: init_state::Disabled,
        }
    }

    pub fn configure_adc(&mut self, adc: &mut raw::ADC0, recv_buf: &mut [u32]) {
        assert!(recv_buf.len() < 0x3FF);

        self.raw.channel21.cfg.write(|w| unsafe{
            w
            .periphreqen().set_bit()        // Wait when ADC is ready
            .hwtrigen().clear_bit()         // Will run infinitely
            .trigpol().clear_bit()          // falling edge
            .trigtype().clear_bit()         // edge sensitive
            .trigburst().clear_bit()
            // .trigburst().set_bit()
            // .burstpower().bits(3)           // Move 2^3 = 8 chunks at a time
            .chpriority().bits(1)           // 0 highest, 7 lowest
        });

        self.raw.channel21.xfercfg.write(|w| unsafe{
            w
            .cfgvalid().set_bit()
            .reload().set_bit()
            .swtrig().clear_bit()
            .width().bit_32()
            .srcinc().no_increment()
            .dstinc().width_x_1()
            .xfercount().bits( (recv_buf.len() - 1) as u16)
        });

        unsafe {
            // Plan to reload same config
            DESCRIPTORS.21.transfer_config = self.raw.channel21.xfercfg.read().bits();
            DESCRIPTORS.21.source_end_addr = (raw::ADC0::ptr() as u32) + 0x300;     // FIFOA offset
            DESCRIPTORS.21.dest_end_addr = (recv_buf.as_mut_ptr() as u32) + (recv_buf.len() * 4 - 4) as u32;
            // Point back to itself to loop & use circular buffer.
            DESCRIPTORS.21.next = ((&DESCRIPTORS.21) as *const Descriptor) as u32;      
        }

        adc.de.write(|w| { 
            w.fwmde0().set_bit() // Enable FIFO A dma
        });  


        adc.fctrl[0].modify(|_,w| unsafe {
            w.fwmark().bits(2)  // when >2 samples in FIFO, dma request is issued.
        });

        // enable channel
        self.raw.enableset0.write(|w| unsafe { w.bits(1<<21) });

        // trigger
        self.raw.channel21.xfercfg.modify(|_,w| { w.swtrig().set_bit() });
    }
}