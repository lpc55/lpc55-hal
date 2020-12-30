//! examples/late.rs

#![deny(unsafe_code)]
// something something about:
//
// error: use of deprecated item
// 'cortex_m::peripheral::nvic::<impl cortex_m::peripheral::NVIC>::enable':
// Use `NVIC::unmask`
//
// #![deny(warnings)]
#![no_main]
#![no_std]

use lpc55_hal as hal;
use panic_semihosting as _;

#[rtic::app(device = hal::raw)]
mod app {
    use super::hal;
    use cortex_m_semihosting::hprintln;
    use hal::raw::Interrupt;
    use heapless::{
        consts::*,
        i,
        spsc::{Consumer, Producer, Queue},
    };

    #[resources]
    struct Resources {
        p: Producer<'static, u32, U4>,
        c: Consumer<'static, u32, U4>,
    }

    #[init]
    fn init(_: init::Context) -> init::LateResources {
        static mut Q: Queue<u32, U4> = Queue(i::Queue::new());

        let (p, c) = Q.split();

        // Initialization of late resources
        init::LateResources { p, c }
    }

    #[idle(resources = [c])]
    fn idle(mut cx: idle::Context) -> ! {
        loop {
            if let Some(byte) = cx.resources.c.lock(|c| c.dequeue()) {
                hprintln!("received message: {}", byte).unwrap();
            } else {
                rtic::pend(Interrupt::ADC0);
            }
        }
    }

    #[task(binds = ADC0, resources = [p])]
    fn adc0(mut cx: adc0::Context) {
        cx.resources.p.lock(|p| p.enqueue(42).unwrap());
    }
}
