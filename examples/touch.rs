#![no_main]
#![no_std]

extern crate panic_semihosting;  // 4004 bytes
// extern crate panic_halt; // 672 bytes

#[macro_use(block)]
extern crate nb;

use cortex_m_rt::entry;
use cortex_m_semihosting::dbg;
use cortex_m_semihosting::heprintln;

use lpc55_hal as hal;
use hal::prelude::*;
use hal::{
    drivers::{
        Pins,
        Timer,
    }
};

fn delay(count: u32){
    for i in 0 .. (1_000 * count) {

    }
}

// Reads normal sample (CMDL2 + trigger 2)
fn read_sample(adc: & hal::raw::ADC0) -> u16{
    adc.swtrig.write(|w| unsafe {w.bits(1<<2)});
    while adc.fctrl[0].read().fcount().bits() == 0 {
    }
    let result = adc.resfifo[0].read().bits();
    assert!( (result & 0x80000000) != 0 );
    let sample = (result & 0xffff) as u16;
    sample
}

fn autocal (adc: & hal::raw::ADC0) {
    // Calibration + offset trimming
    adc.ofstrim.write(|w| unsafe {
        w.ofstrim_a().bits(10)
        .ofstrim_b().bits(10)
    });

    // Request calibration
    adc.ctrl.modify(|_,w| {w.cal_req().set_bit()});

    // wait for auto-cal to be ready.
    while (!adc.gcc[0].read().rdy().bits()) || (!adc.gcc[1].read().rdy().bits()) {
    }

    let gain_a = adc.gcc[0].read().gain_cal().bits();
    let gain_b = adc.gcc[1].read().gain_cal().bits();

    let gcr_a = (((gain_a as u32) << 16) / (0x1FFFFu32 - gain_a as u32 )) as u16;
    let gcr_b = (((gain_b as u32) << 16) / (0x1FFFFu32 - gain_b as u32 )) as u16;

    adc.gcr[0].write(|w| unsafe {w.gcalr().bits(gcr_a)});
    adc.gcr[1].write(|w| unsafe {w.gcalr().bits(gcr_b)});

    adc.gcr[0].write(|w| {w.rdy().set_bit()});
    adc.gcr[1].write(|w| {w.rdy().set_bit()});

    while !adc.stat.read().cal_rdy().bits() {
    }
}

#[entry]
fn main() -> ! {

    heprintln!("Hello ADC").unwrap();

    let CThreshold = 12_000;

    // Get pointer to all device peripherals.
    let mut hal = hal::new();

    let _clocks = hal::ClockRequirements::default()
        .system_frequency(12.mhz())
        .configure(&mut hal.anactrl, &mut hal.pmc, &mut hal.syscon)
        .unwrap();

    let mut gpio = hal.gpio.enabled(&mut hal.syscon);

    let adc = hal::Adc::from(hal.ADC0).enabled(&mut hal.pmc, &mut hal.syscon);

    let ctimer = hal.ctimer.1.enabled(&mut hal.syscon);
    let mut cdriver = Timer::new(ctimer);

    let mut iocon = hal.iocon.enabled(&mut hal.syscon);
    let pins = Pins::take().unwrap();
    let _but1 = pins.pio1_9.into_analog_input(&mut iocon, &mut gpio);
    let _but2 = pins.pio0_31.into_analog_input(&mut iocon, &mut gpio);
    let _but3 = pins.pio0_15.into_analog_input(&mut iocon, &mut gpio);

    let mut charge_pin = pins.pio1_16.into_gpio_pin(&mut iocon, &mut gpio).into_output_high();
    charge_pin.set_low().unwrap();

    let adc = adc.release();

    adc.ctrl.write(|w| {
        w.dozen().set_bit()
        .cal_avgs().cal_avgs_7()
    });

    adc.cfg.write(|w| unsafe {
        w.pwren().set_bit()
        .pudly().bits(0x80)
        .refsel().refsel_1()
        .pwrsel().pwrsel_3()
        .tprictrl().bits(0)
        .tres().clear_bit() // Do not resume interrupted captures
    });


    // No pause for now, but could be interesting
    adc.pause.write(|w| unsafe {w.bits(0)});

    // Set 0 for watermark
    adc.fctrl[0].write(|w| unsafe{w.fwmark().bits(0)});
    adc.fctrl[1].write(|w| unsafe{w.fwmark().bits(0)});


    // turn on!
    adc.ctrl.modify(|_, w| {w.adcen().set_bit()});

    heprintln!("Auto calibrating..").unwrap();
    autocal(& adc);

    //// CMDL1 used for threshold measurement.
    adc.cmdl1.write(|w| unsafe {  w.adch().bits(3)
                                .ctype().ctype_0()  
                                .mode().mode_0()
                                } );
    adc.cmdh1.write(|w| unsafe { w.avgs().avgs_3()      // average 2^3 samples
                                .cmpen().bits(0b11)        // compare repeatedly until true
                                // .cmpen().bits(0b00)        // No compare function
                                .loop_().bits(0)         // no loop
                                .next().bits(0)         // no next command
                            } );
    ////
    //// CMDL2 used for normal measurement
    adc.cmdl2.write(|w| unsafe {  w.adch().bits(3)
                                .ctype().ctype_0()  
                                .mode().mode_0()
                                } );
    adc.cmdh2.write(|w| unsafe { w.avgs().avgs_3()
                                .cmpen().bits(0b00)        // no compare
                                .loop_().bits(0)
                                .next().bits(0)
                            } );
    ////


    // Configure compare operation to (result > CThreshold ? true : false)
    adc.cv1.write(|w| unsafe {
        w.cvl().bits(0)
        .cvh().bits(CThreshold)
    });

    // Main trigger
    adc.tctrl[0].write(|w| unsafe {
        w.hten().set_bit()
        .fifo_sel_a().fifo_sel_a_0()
        .fifo_sel_b().fifo_sel_b_0()
        .tcmd().bits(1)
        .tpri().bits(3)
    });

    // Cancel/resync trigger to main trigger
    adc.tctrl[1].write(|w| unsafe {
        w.hten().set_bit()
        .fifo_sel_a().fifo_sel_a_0()
        .fifo_sel_b().fifo_sel_b_0()
        .tcmd().bits(0)
        .rsync().set_bit()
        .tpri().bits(0) //highest priority
    });

    // Normal measurement trigger
    adc.tctrl[2].write(|w| unsafe {
        w.hten().set_bit()
        .fifo_sel_a().fifo_sel_a_0()
        .fifo_sel_b().fifo_sel_b_0()
        .tcmd().bits(2)
        .tpri().bits(2)
    });


    heprintln!("looping").unwrap();
    let mut samples = [0u16; 32];
    let mut timeout = 0;
    heprintln!("adc status: {:02X}", adc.stat.read().bits());
    loop {

        // Discharge for 100ms
        charge_pin.set_low().unwrap();

        cdriver.start(1.ms());
        block!(cdriver.wait()).unwrap();



        cdriver.start(1.ms());


        //get sample + start charge
        adc.swtrig.write(|w| unsafe {w.bits(1)});
        charge_pin.set_high().unwrap();
        while adc.fctrl[0].read().fcount().bits() == 0 {
            if cdriver.lap().0 > 900 {
                heprintln!("timeout status: {:02X}, {:02X}", adc.stat.read().bits(), adc.cmdh1.read().bits());
                adc.swtrig.write(|w| unsafe {w.bits(2)});
                adc.ctrl.modify(|_,w| { w.rstfifo0().set_bit().rstfifo1().set_bit() });
                block!(cdriver.wait()).unwrap();
                timeout = 1;
                break
            }
        }
        if timeout == 1 {
            timeout = 0;
            continue;
        }
        let result = adc.resfifo[0].read().bits();
        assert!( (result & 0x80000000) != 0 );
        let sample = (result & 0xffff) as u16;
        //

        let t = cdriver.lap();

        block!(cdriver.wait()).unwrap();
        let mut max = 1;
        max = read_sample(&adc);

        // dbg!(t.0);
        // dbg!(sample);

        heprintln!("{} - {}/{}  {:02X}", t.0, sample,max, adc.stat.read().bits()).unwrap();
    }
}