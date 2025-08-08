//! examples/late.rs

// something something about:
//
// error: use of deprecated item
// 'cortex_m::peripheral::nvic::<impl cortex_m::peripheral::NVIC>::enable':
// Use `NVIC::unmask`
//
// #![deny(warnings)]
#![no_main]
#![no_std]

use panic_semihosting as _;

#[rtic::app(device = lpc55_hal::raw)]
mod app {
    use core::ptr::addr_of_mut;

    use cortex_m_semihosting::hprintln;
    use hal::raw::Interrupt;
    use heapless::spsc::{Consumer, Producer, Queue};
    use lpc55_hal as hal;

    #[shared]
    struct SharedResources {}

    #[local]
    struct LocalResources {
        p: Producer<'static, u32, 4>,
        c: Consumer<'static, u32, 4>,
    }

    #[init]
    fn init(_ctx: init::Context) -> (SharedResources, LocalResources, init::Monotonics) {
        static mut Q: Queue<u32, 4> = Queue::new();

        let (p, c) = unsafe { (*addr_of_mut!(Q)).split() };

        // Initialization of late resources
        (
            SharedResources {},
            LocalResources { p, c },
            init::Monotonics(),
        )
    }

    #[idle(local = [c])]
    fn idle(ctx: idle::Context) -> ! {
        loop {
            if let Some(byte) = ctx.local.c.dequeue() {
                hprintln!("received message: {}", byte);
            // cortex_m::asm::wfi();
            } else {
                rtic::pend(Interrupt::ADC0);
            }
        }
    }

    #[task(binds = ADC0, local = [p])]
    fn adc0(ctx: adc0::Context) {
        ctx.local.p.enqueue(42).unwrap();
    }
}
