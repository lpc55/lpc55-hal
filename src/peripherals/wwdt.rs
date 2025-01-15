use core::fmt;

use raw::WWDT;

mod sealed {
    pub trait WwdtMode {}
}

#[non_exhaustive]
pub struct Inactive;

#[non_exhaustive]
pub struct Active;

impl sealed::WwdtMode for Inactive {}
impl sealed::WwdtMode for Active {}

/// Windowed watchdog
///
/// Only when `Enabled` is [`Active`] the watchdog is active
/// Only when `Resetting` is [`Active`] will the watchdog reset the device when its counter reaches zero
/// Only when `Protecting` is [`Active`] will the watchdog reset the device when its counter reaches zero
pub struct Wwdt<
    Enabled: sealed::WwdtMode,
    Resetting: sealed::WwdtMode,
    Protecting: sealed::WwdtMode,
> {
    wwdt: WWDT,
    _state: (Enabled, Resetting, Protecting),
}

#[derive(Debug)]
/// Returned if [`Wwdt::set_timer`][] is given an invalid count
///
/// The count must fit within 24 bits
pub struct InvalidInterval;

impl fmt::Display for InvalidInterval {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("The count must fit within 24 bits")
    }
}

#[derive(Debug)]
/// Returned if [`Wwdt::set_warning`][] is given an invalid count
///
/// The count must fit within 10 bits
pub struct InvalidWarnInterval;

impl fmt::Display for InvalidWarnInterval {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("The count must fit within 10 bits")
    }
}

#[derive(Debug)]
pub enum TryNewWatchdogError {
    InvalidState,
    /// Returned if [`Wwdt::try_new`][] is given an invalid divider
    ///
    /// The divider must fit within 10 bits
    InvalidClkDiv,
}

impl fmt::Display for TryNewWatchdogError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::InvalidState => f.write_str("Watchdog must be fully inactive for try_new"),
            Self::InvalidClkDiv => f.write_str("The clock divider must fit within 6 bits"),
        }
    }
}

impl Wwdt<Inactive, Inactive, Inactive> {
    pub fn try_new(
        wwdt: WWDT,
        syscon: &crate::Syscon,
        clock_divider: u8,
    ) -> Result<Self, (WWDT, TryNewWatchdogError)> {
        if wwdt.mod_.read().wden().bit_is_set()
            || wwdt.mod_.read().wdprotect().bit_is_set()
            || wwdt.mod_.read().wdreset().bit_is_set()
        {
            return Err((wwdt, TryNewWatchdogError::InvalidState));
        }

        if (clock_divider & 0b11000000) != 0 {
            return Err((wwdt, TryNewWatchdogError::InvalidClkDiv));
        }

        // Safety: divider fits in 5 bits
        syscon.raw.wdtclkdiv.modify(|_, w| unsafe {
            w.reset()
                .released()
                .halt()
                .clear_bit()
                .div()
                .bits(clock_divider)
        });

        syscon.raw.ahbclkctrl0.modify(|_, w| w.wwdt().set_bit());

        Ok(Self {
            wwdt,
            _state: (Inactive, Inactive, Inactive),
        })
    }
}

impl<Resetting, Protecting> Wwdt<Inactive, Resetting, Protecting>
where
    Resetting: sealed::WwdtMode,
    Protecting: sealed::WwdtMode,
{
    /// Set the timer to TWDCLK * count * 4
    ///
    /// `count` must fit within 24 bits
    pub fn set_timer(&mut self, count: u32) -> Result<(), InvalidInterval> {
        if (count & 0xFF000000) != 0 {
            return Err(InvalidInterval);
        }
        // Safety: The count fits in 24 bits and the watchdog is disabled
        self.wwdt.tc.write(|w| unsafe { w.count().bits(count) });
        Ok(())
    }

    /// Set the counter value
    ///
    /// `at_counter` must fit within 10 bits
    pub fn set_warning(&mut self, at_counter: u16) -> Result<(), InvalidWarnInterval> {
        if (at_counter & 0b1111110000000000) != 0 {
            return Err(InvalidWarnInterval);
        }
        // Safety: counter fits in 10 bits
        self.wwdt
            .warnint
            .modify(|_, w| unsafe { w.warnint().bits(at_counter) });
        Ok(())
    }

    /// Sets the count for the window of the counter value from which the watchdog can be fed
    ///
    /// The watchdog can only be fed if the counter value is below `count`
    pub fn set_window(&mut self, count: u32) -> Result<(), InvalidInterval> {
        if (count & 0xFF000000) != 0 {
            return Err(InvalidInterval);
        }

        // Safety: count fits in 24 bits
        self.wwdt.window.modify(|_, w| unsafe { w.bits(count) });
        Ok(())
    }

    /// Get the current count of the watchdog
    pub fn current_count(&mut self) -> u32 {
        self.wwdt.tv.read().bits()
    }
}

impl<Resetting, Protecting> Wwdt<Inactive, Resetting, Protecting>
where
    Resetting: sealed::WwdtMode,
    Protecting: sealed::WwdtMode,
{
    /// Enable the watchdog
    ///
    /// Cannot be reversed without a reset
    pub fn set_enabled(self) -> Wwdt<Active, Resetting, Protecting> {
        self.wwdt.mod_.modify(|_, w| w.wden().bit(true));
        let this = Wwdt {
            wwdt: self.wwdt,
            _state: (Active, self._state.1, self._state.2),
        };
        this.feed();
        this
    }
}

impl<Enabled, Protecting> Wwdt<Enabled, Inactive, Protecting>
where
    Enabled: sealed::WwdtMode,
    Protecting: sealed::WwdtMode,
{
    /// Trigger a reset when the watchdog counter reaches zero
    ///
    /// Cannot be reversed without a reset
    pub fn set_resetting(self) -> Wwdt<Enabled, Active, Protecting> {
        self.wwdt.mod_.modify(|_, w| w.wdreset().bit(true));
        Wwdt {
            wwdt: self.wwdt,
            _state: (self._state.0, Active, self._state.2),
        }
    }
}

impl<Enabled, Resetting> Wwdt<Enabled, Resetting, Inactive>
where
    Enabled: sealed::WwdtMode,
    Resetting: sealed::WwdtMode,
{
    /// When set, the watchdog can only be fed when the counter is below bothe the values passed
    /// to set_window and set_warning
    pub fn set_protecting(self) -> Wwdt<Enabled, Resetting, Active> {
        self.wwdt.mod_.modify(|_, w| w.wdprotect().bit(true));
        Wwdt {
            wwdt: self.wwdt,
            _state: (self._state.0, self._state.1, Active),
        }
    }
}

impl<Resetting, Protecting> Wwdt<Active, Resetting, Protecting>
where
    Resetting: sealed::WwdtMode,
    Protecting: sealed::WwdtMode,
{
    pub fn feed(&self) {
        // Safety: The watchdog is enabled
        self.wwdt.feed.write(|w| unsafe { w.feed().bits(0xAA) });
        self.wwdt.feed.write(|w| unsafe { w.feed().bits(0x55) });
    }

    pub fn timer(&self) -> u32 {
        self.wwdt.tv.read().bits()
    }
}
