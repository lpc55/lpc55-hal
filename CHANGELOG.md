# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

-

## [v0.4.1](https://github.com/lpc55/lpc55-hal/releases/tag/0.4.1) - 2025-02-28

- Add support for the watchdog peripheral (`wwdt`)

## [v0.4.0](https://github.com/lpc55/lpc55-hal/releases/tag/0.4.0) - 2024-10-25

- Update `littlefs2` to 0.5

[All Changes](https://github.com/lpc55/lpc55-hal/compare/0.3.1...0.4.0)

## [v0.3.1](https://github.com/lpc55/lpc55-hal/releases/tag/0.3.1) - 2024-10-09

- Update `littlefs2` to 0.4 ([#60](https://github.com/lpc55/lpc55-hal/pull/60))
- Fix PUF peripheral:
  - Add PUF to peripherals ([#61](https://github.com/lpc55/lpc55-hal/pull/61))
  - Check state after enabling PUF ([#63](https://github.com/lpc55/lpc55-hal/issues/63))
  - Support started PUF peripherals ([#64](https://github.com/lpc55/lpc55-hal/issues/64))
- Remove unnecessary `as_ref` call to fix compilation ([#66](https://github.com/lpc55/lpc55-hal/pull/66))

[All Changes](https://github.com/lpc55/lpc55-hal/compare/0.3.0...0.3.1)

## [v0.3.0](https://github.com/lpc55/lpc55-hal/releases/tag/0.3.0) - 2021-06-10

- Update dependencies:
  - Update `embedded-time` to 0.12
  - Update `littlefs2` to 0.3.1
  
[All Changes](https://github.com/lpc55/lpc55-hal/compare/0.2.1...0.3.0)

## [v0.2.1] - 2021-05-02
Fix the "lap" naming

## [v0.2.0] - 2021-05-02
Bump lpc55-pac and cipher
Replace homegrown "time" with embedded-time

## [v0.1.1] - 2021-04-23
USB fix

## [v0.1.0] - 2021-02-26
Stabilize things somewhat

## [v0.0.4] - 2021-02-01
Quick release to use littlefs2-0.1.0

## [v0.0.3] - 2019-11-09
Rename to `lpc55-hal`.

Some work towards Flash.

## [v0.0.2] - 2019-11-09

Several serial peripheral drivers:
- USB device (!!)
- I2C, SPI, USART (not all properly tested)
- All pins for these Flexcomm interfaces exposed

We do not pass one of the `usb_test_class` tests (unclear
if we should), the others pass. See also `test_serial.py`,
and NEVER use `moserial` for testing `(－‸ლ)`

Architectural changes:
- move from "single file per peripheral" to split between
  HAL wrappers for peripherals, and actual drivers
- get rid of a lot of references/lifetimes which don't
  cooperate with RTIC

The clock tree will definitely need some more work.
It's a conundrum between compile-time vs runtime checks,
and keeping things centralized vs distributed among peripherals.


## [v0.0.1] - 2019-09-04

- Initial release

## [v0.0.0] - 2019-08-17

- Squatting release

