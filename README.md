
Hardware Abstraction Layer (HAL) for [NXP LPC55S6x][nxp-lpc55s6x] [Cortex-M33][cortex-m33] microcontrollers,
written in Rust.

LPC55S6x HAL provides a high-level interface to the features of these LPC55S6x MCUs, which is safe,
convenient and efficient. It leverages Rust's type system to prevent common mistakes, such as attempting
to use an uninitialized peripheral; these will be caught by compile-time errors.

This library implements the [embedded-hal][embedded-hal], a collection of traits intended to abstract
over platform-dependencies, allowing firmware and drivers to be quite portable.

Moreover, this library is compatible with the Cortex-M implementation of [RTFM][cortex-m-rtfm],
a concurrency framework supporting preemptive multitasking with minimal footprint, which it does by
delegating the scheduling to hardware.

[![crates.io][crates-image]][crates-link]
[![Documentation][docs-image]][docs-link]
![LICENSE][license-image]
[![Build Status][build-image]][build-link]

## Status

Very much work-in-progress!

See also the low-level companion library [LPC55S6x PAC][lpc55s6x-pac].

This HAL is intended to work with `cortex-m-rtfm` v0.5.

## Documentation

The API documentation is located at <https://docs.rs/lpc55s6x-hal>.

In addition, `make fetch-docs` downloads various vendor-supplied documentation:

- [LPC55S6x Data Sheet][datasheet]
- [LPC55S6x User Manual][usermanual]
- [LPC55S6x Errata][errata]
- [Cortex-M33 Generic User Guide][genericuserguide] (requires an NXP account)
- [LPCXpresso55S69 Development Board User Manual][evkusermanual] (requires an NXP account)

## Examples

The intention of the [`examples/`][examples] is to showcase the functionality of this library.

They run on the [LPCXpresso55S69][lpcxpresso55s69] development board.

After flashing [J-Link firmware][jlink-fw] on the on-board LPCXpresso V2 debugger:

```bash
# in one terminal
make jlink

# in another terminal
make run-example EXAMPLE=rtfm_led  # or any other example
```

## License

[Apache-2.0][apache2-link] or [MIT][mit-link].

Parts of the code are directly lifted from the [LPC8xx HALs][lpc8xx-hal].

[//]: # (links)

[nxp-lpc55s6x]: https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/lpc5500-cortex-m33:LPC5500_SERIES
[cortex-m33]: https://developer.arm.com/ip-products/processors/cortex-m/cortex-m33
[embedded-hal]: https://lib.rs/embedded-hal
[cortex-m-rtfm]: https://lib.rs/cortex-m-rtfm
[lpc55s6x-pac]: https://lib.rs/lpc55s6x-pac
[lpc8xx-hal]: https://github.com/lpc-rs/lpc8xx-hal
[examples]: https://github.com/nickray/lpc55s6x-hal/tree/master/examples
[lpcxpresso55s69]: https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/lpc5500-cortex-m33/lpcxpresso55s69-development-board:LPC55S69-EVK
[jlink-fw]: https://www.segger.com/products/debug-probes/j-link/models/other-j-links/lpcxpresso-on-board/

[crates-image]: https://img.shields.io/crates/v/lpc55s6x-hal.svg?style=flat-square
[crates-link]: https://crates.io/crates/lpc55s6x-hal
[build-image]: https://img.shields.io/circleci/build/github/nickray/lpc55s6x-hal/master.svg?style=flat-square
[build-link]: https://circleci.com/gh/nickray/lpc55s6x-hal/tree/master
[docs-image]: https://docs.rs/lpc55s6x-hal/badge.svg?style=flat-square
[docs-link]: https://docs.rs/lpc55s6x-hal

[license-image]: https://img.shields.io/badge/license-Apache2.0%2FMIT-blue.svg??style=flat-square
[apache2-link]: https://spdx.org/licenses/Apache-2.0.html
[mit-link]: https://spdx.org/licenses/MIT.html

[datasheet]: https://www.nxp.com/docs/en/data-sheet/LPC55S6x.pdf
[usermanual]: https://www.nxp.com/webapp/Download?colCode=UM11126
[errata]: https://www.nxp.com/docs/en/errata/ES_LPC55S6x.pdf
[genericuserguide]: https://static.docs.arm.com/100235/0004/arm_cortex_m33_dgug_100235_0004_00_en.pdf
[evkusermanual]: https://www.nxp.com/webapp/Download?colCode=UM11158
