#![no_main]
#![no_std]

// extern crate panic_semihosting;
extern crate panic_halt;
use cortex_m_rt::entry;
use core::fmt::Write;

use hal::prelude::*;
use lpc55s6x_hal as hal;

use hal::{
    drivers::{
        Pin,
        Pins,
        SpiMaster,
    },
    peripherals::{
        flexcomm::{
            // the high-speed SPI
            Spi8,
            NoSsel,
        },
    },
    traits::wg::spi::{
        // FullDuplex,
        Mode,
        Phase,
        Polarity,
    },
    states::pin_function::HS_SPI_SSEL1,
    states::pin_state::Special,
    drivers::pins::Pio1_1,
};

use ssd1306;
use ssd1306::prelude::*;


#[entry]
fn main() -> ! {

    let hal = hal::new();

    let mut anactrl = hal.anactrl;
    let mut syscon = hal.syscon;
    let mut gpio = hal.gpio.enabled(&mut syscon);
    let mut iocon = hal.iocon.enabled(&mut syscon);

    let clocks = hal::ClockRequirements::default()
        // .system_freq(96.mhz())
        .support_flexcomm()
        .configure(&mut anactrl, &mut syscon)
        .unwrap();

    let token = clocks.support_flexcomm_token().unwrap();

    let spi = hal.flexcomm.8.enabled_as_spi(&mut syscon, &token);

    let pins = Pins::take().unwrap();

    let sck = pins.pio1_2.into_spi8_sck_pin(&mut iocon);
    let mosi = pins.pio0_26.into_spi8_mosi_pin(&mut iocon);
    let miso = pins.pio1_3.into_spi8_miso_pin(&mut iocon);
    // let ssel = pins.pio1_1.into_spi8_ssel1_pin(&mut iocon);
    let no_ssel = NoSsel;//pins.pio1_1.into_spi8_ssel1_pin(&mut iocon);

    // let spi_pins = (sck, mosi, miso, ssel);
    let spi_pins = (sck, mosi, miso, no_ssel);

    let spi_mode = Mode { polarity: Polarity::IdleLow, phase: Phase::CaptureOnFirstTransition };

    // because Rust can't infer the type...
    // let spi = SpiMaster::<_, _, _, _, Spi8, _, Pin<Pio1_1, Special<HS_SPI_SSEL1>>>
    let spi = SpiMaster::<_, _, _, _, Spi8, _, NoSsel>
        ::new(spi, spi_pins, spi_mode, 100_000.hz());

    let dc = pins.pio1_5.into_gpio_pin2(&mut iocon, &mut gpio).into_output_high();

    // OLED
    let mut disp: TerminalMode<_> = ssd1306::Builder::new()
        .size(DisplaySize::Display128x32)
        // .size(DisplaySize::Display70x40)  // <-- TODO
        // .with_rotation(DisplayRotation::Rotate90)
        .connect_spi(spi, dc).into();

    disp.init().unwrap();
    disp.clear().ok();

    loop {
        for c in 97..123 {
            let _ = disp.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) });
        }
        for c in 65..91 {
            let _ = disp.write_str(unsafe { core::str::from_utf8_unchecked(&[c]) });
        }
    }
}
