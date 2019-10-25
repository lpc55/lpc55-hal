#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;
use cortex_m_semihosting::dbg;

use lpc55s6x_hal as hal;
use hal::{
    prelude::*,
    gpio::Level,
    pins,
    states,
};

#[rtfm::app(device = crate::hal::raw, peripherals = true)]
const APP: () = {
    struct Resources {
        led: pins::Pin<pins::PIO1_6, states::pin_state::Gpio<states::gpio::direction::Output>>,
        // delay: hal::clock::Ticks<'static, hal::syscon::Fro1MhzUtickClock<states::init_state::Enabled>>,
        // sleep: hal::sleep::Busy<'static, 'static>,
    }

    #[init]
    fn init(c: init::Context) -> init::LateResources {
        // dbg!("init");
        let _cp = c.core;
        let dp = c.device;

        // setup red LED
        let mut syscon = hal::Syscon::from(dp.SYSCON);
        let mut gpio = hal::gpio::Gpio::from(dp.GPIO).enabled(&mut syscon);
        // let iocon = hal::Iocon::from(dp.IOCON);

        let pins = hal::pins::Pins::take().unwrap();
        let red_led = pins.pio1_6
            .into_gpio_pin(&mut gpio)
            .into_output(Level::High);

        // let clock = hal::syscon::Fro1MhzUtickClock::take()
        //     .unwrap()
        //     .enable(&mut syscon);
        // // let clock = syscon.fro_1mhz_utick_clock.enable(&mut syscon.handle);
        // let delay = hal::clock::Ticks {
        //     value: 500_000,
        //     clock: &clock,
        // }; // 500 ms = 0.5 s

        // // let mut utick = dp.UTICK.enable(&mut syscon.handle);
        // let mut utick = hal::utick::wrap(dp.UTICK).enabled(&mut syscon, &clock);
        // // let mut sleep = hal::sleep::Busy::prepare(&mut utick);
        // let mut sleep = hal::sleep::Busy::wrap(&mut utick);

        init::LateResources {
            led: red_led,
            // delay,
            // sleep,
        }
    }

    // #[idle(resources = [led, delay, sleep])]
    #[idle(resources = [led])]
    fn idle(c: idle::Context) -> ! {
        let led = c.resources.led;
        loop {
            dbg!("low");
            led.set_low().unwrap();
            // c.resources.sleep.sleep(c.resources.delay);

            dbg!("high");
            led.set_high().unwrap();
            // c.resources.sleep.sleep(c.resources.delay);
        }
    }
};
