#![no_main]
#![no_std]

extern crate panic_semihosting;
// extern crate panic_halt;

use lpc55_hal as hal;

#[rtic::app(device = crate::hal::raw, peripherals = true)]
mod app {
    use super::hal;
    use hal::{
        prelude::*,
        // traits::wg::digital::OutputPin,
        drivers::pins::Level,
        drivers::pins,
        typestates::pin,
    };
    use cortex_m_semihosting::dbg;

    type RedLed = hal::Pin<pins::Pio1_6, pin::state::Gpio<pin::gpio::direction::Output>>;

    #[resources]
    struct Resources {
        led: RedLed,
    }

    #[init]
    fn init(c: init::Context) -> init::LateResources {
        // dbg!("init");
        let _cp = c.core;
        let dp = c.device;

        // setup red LED
        let mut syscon = hal::Syscon::from(dp.SYSCON);
        let mut gpio = hal::Gpio::from(dp.GPIO).enabled(&mut syscon);
        let mut iocon = hal::Iocon::from(dp.IOCON).enabled(&mut syscon);

        let pins = hal::Pins::take().unwrap();
        let red_led = pins.pio1_6
            .into_gpio_pin(&mut iocon, &mut gpio)
            .into_output(Level::High);

        init::LateResources {
            led: red_led,
            // delay,
            // sleep,
        }
    }

    #[idle(resources = [led])]
    fn idle(mut c: idle::Context) -> ! {
        c.resources.led.lock(|led| {
            loop {
                dbg!("low");
                led.set_low().unwrap();
                // c.resources.sleep.sleep(c.resources.delay);

                dbg!("high");
                led.set_high().unwrap();
                // c.resources.sleep.sleep(c.resources.delay);
            }
        })
    }
}
