#![no_main]
#![no_std]

extern crate panic_semihosting;
use cortex_m_semihosting::dbg;

use lpc55s6x_hal as hal;
use hal::{gpio, iocon};
use rtfm::app;

#[allow(deprecated)]
use embedded_hal::digital::v1::OutputPin;

#[app(device = crate::hal::raw)]
const APP: () = {
    // Late resources
    static mut LED: iocon::Pin<iocon::PIO1_6, iocon::pin_state::Gpio<'_, gpio::direction::Output>> = ();

    #[init]
    fn init(c: init::Context) -> init::LateResources {
        dbg!("init");
        let peripherals = hal::Peripherals::take().unwrap();

        let mut syscon = peripherals.SYSCON.split();
        let gpio = peripherals.GPIO.enable(&mut syscon.handle);
        let iocon = peripherals.IOCON.split();

        let red_led = iocon.pins.pio1_6
            .into_gpio_pin(&gpio)
            .into_output_high();

        init::LateResources {
            LED: red_led,
        }
    }

    #[idle(resources = [LED])]
    fn idle(c: idle::Context) -> ! {
        let led = c.resources.LED;
        loop {
            dbg!("low");
            #[allow(deprecated)]
            led.set_low();
            dbg!("high");
            #[allow(deprecated)]
            led.set_high();
        }
    }
};
