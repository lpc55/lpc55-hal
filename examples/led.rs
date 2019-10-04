#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m::iprintln;
use cortex_m_rt::entry;
use cortex_m_semihosting::{dbg, hprintln};

use hal::prelude::*;
use lpc55s6x_hal as hal;
// use lpc55s6x_ral as ral;

use hal::{reg_read, reg_modify, dbg_reg_modify, reg_write};

use core::pin::Pin;

// const MEM_SIZE: usize = 0x4000;
const MEM_SIZE: usize = 0x1;
struct Mem(pub [u8; MEM_SIZE]);

struct Struct {
    // mem: [u8; MEM_SIZE],
    mem: Mem,
}

impl Struct {
    pub fn new(mut mem: Mem) -> Struct {
        Struct {
            mem: mem,
        }
    }
}

// fn test_pin(mut mem: Pin<&mut [u8; MEM_SIZE]>) {
//     hprintln!("addr: {:p}", mem).unwrap();
//     dbg!(mem[0]);
//     mem[0] = 3;
//     dbg!(mem[0]);
// }

fn test_it(mut mem: Mem, mut mem2: [u8; MEM_SIZE]) {
    let mut mem2 = Mem([0u8; MEM_SIZE]);
    dbg!(mem.0[0]);
    hprintln!("addr: mem = {:p}, mem2 = {:p}", &mem.0, &mem2).unwrap();
    mem.0[0] = 3;
    dbg!(mem.0[0]);
}

#[entry]
fn main() -> ! {
    dbg!("test");
    dbg!(cortex_m_rt::heap_start());
    let mut mem = Mem([0u8; MEM_SIZE]);
    // let mut mem2 = [0u8; MEM_SIZE];
    // hprintln!("addr: {:p}", &mem.0).unwrap();
    // hprintln!("addr: mem = {:p}, mem2 = {:p}", &mem.0, &mem2).unwrap();
    // // let mem_pin: Pin<&mut [u8; MEM_SIZE]> = unsafe { Pin::new_unchecked(&mut mem) };
    // // hprintln!("addr: {:p}", mem_pin).unwrap();
    // test_it(mem, mem2);
    // // hprintln!("addr: {:p}", &mem).unwrap();
    // // test_nonpin(&mut mem);
    //
    hprintln!("addr: {:p}, {:p}", &mem, &mem.0).unwrap();
    let s = Struct::new(mem);
    hprintln!("addr: {:p}, {:p}", &s.mem, &s.mem.0).unwrap();

    let dp = hal::raw::Peripherals::take().unwrap();
    let mut syscon = hal::syscon::wrap(dp.SYSCON);
    dbg!(syscon.get_num_wait_states());
    let mut gpio = hal::gpio::wrap(dp.GPIO).enabled(&mut syscon);
    let iocon = hal::iocon::wrap(dp.IOCON);

    // hprintln!("traceclkdiv = {:x}", reg_read!(SYSCON, traceclkdiv)).unwrap();
    dbg!(reg_read!(SYSCON, traceclkdiv, halt));
    dbg!(reg_modify!(SYSCON, traceclkdiv, halt, run));
    // dbg!(reg_write!(SYSCON, traceclkdiv, 0));
    dbg!(reg_read!(SYSCON, traceclkdiv, halt));
    // hprintln!("traceclkdiv = {:x}", reg_read!(SYSCON, traceclkdiv)).unwrap();

    dbg!(reg_read!(SYSCON, traceclksel, sel));
    dbg!(reg_modify!(SYSCON, traceclksel, sel, enum_0x0));
    dbg!(reg_read!(SYSCON, traceclksel, sel));

    // dbg!(iocon.get_pio_0_8_func());
    // dbg!(iocon.set_pio_0_8_swo_func()); // alt4
    // dbg!(iocon.get_pio_0_8_func());
    dbg!(iocon.get_pio_0_10_func());
    dbg!(iocon.set_pio_0_10_swo_func()); // alt6
    dbg!(iocon.get_pio_0_10_func());

    let mut cp = hal::raw::CorePeripherals::take().unwrap();
    let stim = &mut cp.ITM.stim[0];

    // dbg!(unsafe { &(*hal::raw::TPIU::ptr()) }.sppr.read() );
    // unsafe {      &(*hal::raw::TPIU::ptr())  .sppr.write(2) };
    // dbg!(unsafe { &(*hal::raw::TPIU::ptr()) }.sppr.read() );

    // UM kind of says it's not enabled, but it actually is
    // let iocon = iocon.enabled(&mut syscon);

    // R = pio1_6
    // G = pio1_7
    // B = pio1_4
    //
    // on = low, off = high

    let pins = hal::pins::Pins::take().unwrap();
    let mut red = pins
        .pio1_6
        .into_gpio_pin(&mut gpio)
        .into_output(hal::gpio::Level::High); // start turned off

    // let iocon = iocon.disabled(&mut syscon);
    // iocon.release();

    let clock = hal::syscon::Fro1MhzUtickClock::take()
        .unwrap()
        .enable(&mut syscon);

    let mut utick = hal::utick::wrap(dp.UTICK0).enabled(&mut syscon, &clock);

    let delay = hal::clock::Ticks {
        value: 500_000,
        clock: &clock,
    }; // 500 ms = 0.5 s

    let mut sleep = hal::sleep::Busy::wrap(&mut utick);

    loop {
        sleep.sleep(delay);
        red.set_low().unwrap();
        iprintln!(stim, "led on");

        sleep.sleep(delay);
        red.set_high().unwrap();
        iprintln!(stim, "led off");
    }
}
