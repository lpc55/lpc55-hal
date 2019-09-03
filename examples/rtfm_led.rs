#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_semihosting::dbg;

use lpc55s6x_hal as hal;
use hal::{gpio, iocon};
use rtfm::app;

use embedded_hal::digital::v2::OutputPin;

#[app(device = crate::hal::raw)]
const APP: () = {
    // Late resources
    static mut LED: iocon::Pin<iocon::PIO1_6, iocon::pin_state::Gpio<gpio::direction::Output>> = ();

    #[init]
    fn init(c: init::Context) -> init::LateResources {
        dbg!("init");
        // let cp = c.core;
        let dp = c.device;

        let mut syscon = hal::syscon::SYSCON::new(dp.SYSCON).split();
        let gpio = hal::gpio::GPIO::new(dp.GPIO).enable(&mut syscon.handle);
        let iocon = hal::iocon::IOCON::new(dp.IOCON).split();

        let red_led = iocon.pins.pio1_6
            .into_gpio_pin(&gpio)
            .into_output(hal::gpio::Level::High);

        init::LateResources {
            LED: red_led,
        }
    }

    #[idle(resources = [LED])]
    fn idle(c: idle::Context) -> ! {
        let led = c.resources.LED;
        loop {
            dbg!("low");
            led.set_low().unwrap();

            dbg!("high");
            led.set_high().unwrap();
        }
    }
};
