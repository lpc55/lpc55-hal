use crate::{
    raw::gpio::{CLR, DIRSET, PIN, SET},
    peripherals::{
        gpio::Gpio,
        iocon::Iocon,
    },
    states::{
        init_state,
        pin_state,
        pin_function,
    },
};

pub use crate::states::gpio_state::{
    direction,
    Level,
};

pub mod types;

pub mod gpio;
// pub mod special;

pub use types::{
    PinId,
    Pin,
    PinType,
};

impl<T> Pin<T, pin_state::Unused>
where
    T: PinId,
{
    /// Transition pin to GPIO state
    pub fn into_gpio_pin(
        self,
        _: &mut Gpio<init_state::Enabled>,
    ) -> Pin<T, pin_state::Gpio<direction::Unknown>> {
        // TODO: need to set FUNC to 0 at minimum
        // (possibly later than here)
        Pin {
            id: self.id,
            state: pin_state::Gpio {
                dirset: crate::reg_proxy::RegClusterProxy::new(),
                pin: crate::reg_proxy::RegClusterProxy::new(),
                set: crate::reg_proxy::RegClusterProxy::new(),
                clr: crate::reg_proxy::RegClusterProxy::new(),

                _direction: direction::Unknown,
            },
        }
    }

    // pub fn into_special_pin(
    //     self,
    // ): -> Pin<T, pin_state::Special> {
    //     Pin {
    //         id: self.id,
    //         state
    // }
}

impl Pin<Pio0_22, pin_state::Unused> {
    pub fn into_usb0_vbus_pin(
        self,
        iocon: &mut Iocon<init_state::Enabled>,
    ) -> Pin<Pio0_22, pin_state::Special<pin_function::USB0_VBUS>> {
        iocon.raw.pio0_22.modify(|_, w|
            w
            .func().alt7() // FUNC7, pin configured as USB0_VBUS
            .mode().inactive() // MODE_INACT, no additional pin function
            .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
            .invert().disabled() // INV_DI, input function is not inverted
            .digimode().digital() // DIGITAL_EN, enable digital fucntion
            .od().normal() // OPENDRAIN_DI, open drain is disabled
        );

        Pin {
            id: self.id,
            state: pin_state::Special {
                _function: pin_function::USB0_VBUS,
            },
        }
    }

}

/*
/// A fixed or movable function that can be assigned to a pin
///
/// T identifies function.
/// State tracks whether it's assigned, and to which pin
pub struct Function<T, State> {
    ty: T,
    _state: State,
}

impl<T> Function<T, state::Unassigned> {
    /// Assign this function to a pin
    ///
    /// This method is only available if a number of requirements are met:
    /// - `Function` must be in the [`Unassigned`] state, as a function can only
    ///   be assigned to one pin.
    /// - The [`Pin`] must be in the SWM state ([`pin_state::Swm`]). See
    ///   documentation on [`Pin`] for information on pin state management.
    /// - The function must be assignable to the pin. Movable functions can be
    ///   assigned to any pin, but fixed functions can be assigned to only one
    ///   pin.
    /// - The state of the pin must allow another function of this type to be
    ///   assigned. Input functions can always be assigned, but only one output
    ///   or bidirectional function can be assigned to a given pin at any time.
    ///
    /// Code attempting to call this method while these requirement are not met,
    /// will not compile.
    ///
    /// Consumes this instance of `Function`, as well as the provided [`Pin`],
    /// and returns new instances. The returned `Function` instance will have its
    /// state set to indicate that it has been assigned to the pin. The returned
    /// [`Pin`] will have its state updated to indicate that a function of this
    /// `Function`'s type has been assigned.
    ///
    /// # Examples
    ///
    /// Assign one output and one input function to the same pin:
    ///
    /// ``` no_run
    /// use lpc82x_hal::Peripherals;
    ///
    /// let p = Peripherals::take().unwrap();
    ///
    /// let mut swm = p.SWM.split();
    ///
    /// // Assign output function to a pin
    /// let (u0_txd, pio0_0) = swm.movable_functions.u0_txd.assign(
    ///     swm.pins.pio0_0.into_swm_pin(),
    ///     &mut swm.handle,
    /// );
    ///
    j/// // Assign input function to the same pin
    /// let (u1_rxd, pio0_0) = swm.movable_functions.u1_rxd.assign(
    ///     pio0_0,
    ///     &mut swm.handle,
    /// );
    /// ```
    ///
    /// [`Unassigned`]: state/struct.Unassigned.html
    pub fn assign<P, S>(
        mut self,
        mut pin: Pin<P, S>,
        swm: &mut Handle,
    ) -> (
        Function<T, state::Assigned<P>>,
        <Pin<P, S> as AssignFunction<T, T::Kind>>::Assigned,
    )
    where
        T: FunctionTrait<P>,
        P: PinTrait,
        S: PinState,
        Pin<P, S>: AssignFunction<T, T::Kind>,
    {
        self.ty.assign(&mut pin.ty, swm);

        let function = Function {
            ty: self.ty,
            _state: state::Assigned(PhantomData),
        };

        (function, pin.assign())
    }
}

impl<T, P> Function<T, state::Assigned<P>> {
    /// Unassign this function from a pin
    ///
    /// This method is only available if a number of requirements are met:
    /// - The function must be assigned to the provided pin. This means
    ///   `Function` must be in the [`Assigned`] state, and the type parameter
    ///   of [`Assigned`] must indicate that the function is assigned to the
    ///   same pin that is provided as an argument.
    /// - The [`Pin`] must be in the SWM state ([`pin_state::Swm`]), and the
    ///   state must indicate that a function of this `Function`'s type is
    ///   currently assigned. This should always be the case, if the previous
    ///   condition is met, as it should be impossible to create inconsistent
    ///   states between `Function`s and [`Pin`]s without using `unsafe`.
    ///
    /// Code attempting to call this method while these requirement are not met,
    /// will not compile.
    ///
    /// Consumes this instance of `Function`, as well as the provided [`Pin`],
    /// and returns new instances. The returned `Function` instance will have
    /// its state set to indicate that it is no longer assigned to a pin. The
    /// returned [`Pin`] will have its state updated to indicate that one fewer
    /// function of this type is now assigned.
    ///
    /// # Examples
    ///
    /// Unassign a function that has been previously assigned to a pin:
    ///
    /// ``` no_run
    /// # use lpc82x_hal::Peripherals;
    /// #
    /// # let p = Peripherals::take().unwrap();
    /// #
    /// # let mut swm = p.SWM.split();
    /// #
    /// # // Assign output function to a pin
    /// # let (u0_txd, pio0_0) = swm.movable_functions.u0_txd.assign(
    /// #     swm.pins.pio0_0.into_swm_pin(),
    /// #     &mut swm.handle,
    /// # );
    /// #
    /// // U0_TXD must have been previously assigned to the pin, or the
    /// // following code will not compile. See documentation of
    /// // `Function::assign`.
    /// let (u0_txd, pio0_0) = u0_txd.unassign(pio0_0, &mut swm.handle);
    /// ```
    ///
    /// [`Assigned`]: state/struct.Assigned.html
    pub fn unassign<S>(
        mut self,
        mut pin: Pin<P, S>,
        swm: &mut Handle,
    ) -> (
        Function<T, state::Unassigned>,
        <Pin<P, S> as UnassignFunction<T, T::Kind>>::Unassigned,
    )
    where
        T: FunctionTrait<P>,
        P: PinTrait,
        S: PinState,
        Pin<P, S>: UnassignFunction<T, T::Kind>,
    {
        self.ty.unassign(&mut pin.ty, swm);

        let function = Function {
            ty: self.ty,
            _state: state::Unassigned,
        };

        (function, pin.unassign())
    }
}
*/

// seems a bit inefficient, but want to be able to safely
// take individual pins instead of the whole bunch
static mut PIN_TAKEN: [[bool; 32]; 2] = [[false; 32]; 2];

macro_rules! pins {
    ($(
        $field:ident,
        $pin:ident,
        $port:expr,
        $number:expr,
        $type:expr,
        $default_state_ty:ty,
        $default_state_val:expr;
    )*) => {
        /// Provides access to all pins
        #[allow(missing_docs)]
        pub struct Pins {
            $(pub $field: Pin<$pin, $default_state_ty>,)*
        }

        impl Pins {

            fn any_taken() -> bool {
                unsafe {
                    let any_port_0 = PIN_TAKEN[0].iter().any(|x| *x);
                    let any_port_1 = PIN_TAKEN[1].iter().any(|x| *x);
                    any_port_0 || any_port_1
                }
            }

            fn set_all_taken() {
                unsafe {
                    for entry in PIN_TAKEN[0].iter_mut() { *entry = true; }
                    for entry in PIN_TAKEN[1].iter_mut() { *entry = true; }
                }
            }

            fn set_all_released() {
                unsafe {
                    for entry in PIN_TAKEN[0].iter_mut() { *entry = false; }
                    for entry in PIN_TAKEN[1].iter_mut() { *entry = false; }
                }
            }

            pub fn take() -> Option<Self> {
                if Self::any_taken() {
                    None
                } else {
                    Some(unsafe {
                        Self::set_all_taken();
                        Self::steal()
                    } )
                }
            }

            pub fn release(self) {
                Self::set_all_released();
            }

            pub unsafe fn steal() -> Self {
                Self {
                    $(
                        $field: $pin::steal(),
                    )*
                }
            }
        }


        $(
            /// Identifies a specific pin
            ///
            /// Pins can be `take`n individually, or en bloc via `Pins`.
            #[allow(non_camel_case_types)]
            pub struct $pin(());

            impl $pin {
                pub fn take() -> Option<Pin<Self, $default_state_ty>> {
                    if unsafe { PIN_TAKEN[$port][$number] } {
                        None
                    } else {
                        Some(unsafe {
                            Self::steal()
                        } )
                    }
                }

                pub fn release(self) {
                    unsafe { PIN_TAKEN[$port][$number] = false; }
                }

                pub unsafe fn steal() -> Pin<Self, $default_state_ty> {
                    PIN_TAKEN[$port][$number] = true;
                    Pin {
                        id: Self(()),
                        state: $default_state_val,
                    }
                }
            }

            impl PinId for $pin {
                const PORT: usize = $port;
                const NUMBER: u8    = $number;
                const MASK: u32   = 0x1 << $number;
                const TYPE: PinType = $type;
            }
        )*
    }
}

pins!(
    pio0_0 , Pio0_0 , 0,  0, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_1 , Pio0_1 , 0,  1, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_2 , Pio0_2 , 0,  2, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_3 , Pio0_3 , 0,  3, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_4 , Pio0_4 , 0,  4, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_5 , Pio0_5 , 0,  5, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_6 , Pio0_6 , 0,  6, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_7 , Pio0_7 , 0,  7, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_8 , Pio0_8 , 0,  8, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_9 , Pio0_9 , 0,  9, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_10, Pio0_10, 0, 10, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_11, Pio0_11, 0, 11, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_12, Pio0_12, 0, 12, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_13, Pio0_13, 0, 13, PinType::I, pin_state::Unused, pin_state::Unused;
    pio0_14, Pio0_14, 0, 14, PinType::I, pin_state::Unused, pin_state::Unused;
    pio0_15, Pio0_15, 0, 15, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_16, Pio0_16, 0, 16, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_17, Pio0_17, 0, 17, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_18, Pio0_18, 0, 18, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_19, Pio0_19, 0, 19, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_20, Pio0_20, 0, 20, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_21, Pio0_21, 0, 21, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_22, Pio0_22, 0, 22, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_23, Pio0_23, 0, 23, PinType::A, pin_state::Unused, pin_state::Unused;
    pio0_24, Pio0_24, 0, 24, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_25, Pio0_25, 0, 25, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_26, Pio0_26, 0, 26, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_27, Pio0_27, 0, 27, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_28, Pio0_28, 0, 28, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_29, Pio0_29, 0, 29, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_30, Pio0_30, 0, 30, PinType::D, pin_state::Unused, pin_state::Unused;
    pio0_31, Pio0_31, 0, 31, PinType::A, pin_state::Unused, pin_state::Unused;

    pio1_0 , Pio1_0 , 1,  0, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_1 , Pio1_1 , 1,  1, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_2 , Pio1_2 , 1,  2, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_3 , Pio1_3 , 1,  3, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_4 , Pio1_4 , 1,  4, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_5 , Pio1_5 , 1,  5, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_6 , Pio1_6 , 1,  6, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_7 , Pio1_7 , 1,  7, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_8 , Pio1_8 , 1,  8, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_9 , Pio1_9 , 1,  9, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_10, Pio1_10, 1, 10, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_11, Pio1_11, 1, 11, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_12, Pio1_12, 1, 12, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_13, Pio1_13, 1, 13, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_14, Pio1_14, 1, 14, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_15, Pio1_15, 1, 15, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_16, Pio1_16, 1, 16, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_17, Pio1_17, 1, 17, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_18, Pio1_18, 1, 18, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_19, Pio1_19, 1, 19, PinType::A, pin_state::Unused, pin_state::Unused;
    pio1_20, Pio1_20, 1, 20, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_21, Pio1_21, 1, 21, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_22, Pio1_22, 1, 22, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_23, Pio1_23, 1, 23, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_24, Pio1_24, 1, 24, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_25, Pio1_25, 1, 25, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_26, Pio1_26, 1, 26, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_27, Pio1_27, 1, 27, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_28, Pio1_28, 1, 28, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_29, Pio1_29, 1, 29, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_30, Pio1_30, 1, 30, PinType::D, pin_state::Unused, pin_state::Unused;
    pio1_31, Pio1_31, 1, 31, PinType::D, pin_state::Unused, pin_state::Unused;
);

use crate::reg_cluster;
reg_cluster!(DIRSET, DIRSET, raw::GPIO, dirset);
reg_cluster!(PIN, PIN, raw::GPIO, pin);
reg_cluster!(SET, SET, raw::GPIO, set);
reg_cluster!(CLR, CLR, raw::GPIO, clr);

