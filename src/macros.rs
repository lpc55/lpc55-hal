// TODO: generate docs as well...
// https://amanjeev.com/blog/rust-document-macro-invocations/
//
// TODO: is the trait thing maybe better after all? boilerplate is bad...

#[macro_export]
macro_rules! wrap_always_on_peripheral {
    ($hal_name:ident, $pac_name:ident) => {
        use crate::raw;
        // /// Entry point to the $hal_name API
        pub struct $hal_name {
            pub(crate) raw: raw::$pac_name,
        }

        pub fn wrap(raw: raw::$pac_name) -> $hal_name {
            $hal_name::new(raw)
        }

        impl core::convert::From<raw::$pac_name> for $hal_name {
            fn from(raw: raw::$pac_name) -> Self {
                $hal_name::new(raw)
            }
        }

        impl $hal_name {
            pub fn new(raw: raw::$pac_name) -> Self {
                $hal_name { raw }
            }

            pub fn release(self) -> raw::$pac_name {
                self.raw
            }
        }
    };
}

#[macro_export]
macro_rules! wrap_stateful_peripheral {
    ($hal_name:ident, $pac_name:ident) => {
        pub struct $hal_name<State = init_state::Unknown> {
            pub(crate) raw: raw::$pac_name,
            pub _state: State,
        }

        impl core::convert::From<raw::$pac_name> for $hal_name {
            fn from(raw: raw::$pac_name) -> Self {
                $hal_name::new(raw)
            }
        }


        impl $hal_name {
            pub fn new(raw: raw::$pac_name) -> Self {
                $hal_name {
                    raw,
                    _state: init_state::Unknown,
                }
            }
        }

        impl $hal_name {
            pub fn release(self) -> raw::$pac_name {
                self.raw
            }
        }
    };
}

// #[macro_export]
// macro_rules! reg_write {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()).$register.write(|w| w.$field().bits($value)) }
//     };
// }

// #[macro_export]
// macro_rules! reg_modify {
//     ($hal:ident, $peripheral:ident, $register:ident, $field:ident, $what:ident) => {
//         unsafe { &(*$hal::raw::$peripheral::ptr()) }.$register.modify(|_, w| w.$field().$what())
//     };
//     // want to keep this macro use "unsafe" so code does not use the `bits`
//     // version unaware, particularly when a `what` version would be available
//     ($hal:ident, $peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         // unsafe { &(*hal::raw::$peripheral::ptr()).$register.modify(|_, w| w.$field().bits($value)) }
//         unsafe { &(*$hal::raw::$peripheral::ptr()) }.$register.modify(|_, w| w.$field().bits($value))
//     };
// }

// #[macro_export]
// macro_rules! reg_modify_bits {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()).$register.modify(|_, w| w.$field().bits($value)) }
//     };
// }

#[macro_export]
macro_rules! reg_read {
    ($peripheral:ident, $register:ident, $field:ident, $what:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().$what()
    };
    ($peripheral:ident, $register:ident, $field:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bits()
    };
    ($peripheral:ident, $register:ident) => {
        unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().bits()
    };
}

// #[macro_export]
// macro_rules! reg_read_bits {
//     ($peripheral:ident, $register:ident, $field:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bits()
//     };
// }

// Uhh... I guess this cannot be subsumed like `reg_read_bits`?
// #[macro_export]
// macro_rules! reg_read_bit {
//     ($peripheral:ident, $register:ident, $field:ident) => {
//         unsafe { &(*hal::raw::$peripheral::ptr()) }.$register.read().$field().bit()
//     };
// }

// #[macro_export]
// macro_rules! dbg_reg_modify {
//     ($peripheral:ident, $register:ident, $field:ident, $what:ident, $is_what:ident) => {
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//         reg_modify!($peripheral, $register, $field, $what);
//         dbg!(reg_read!($peripheral, $register, $field, $is_what));
//     };
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {{
//         dbg!(reg_read!($peripheral, $register, $field));
//         reg_modify!($peripheral, $register, $field, $value);
//         dbg!(reg_read!($peripheral, $register, $field));
//     }};
// }

// #[macro_export]
// macro_rules! dbg_reg_modify_bits {
//     ($peripheral:ident, $register:ident, $field:ident, $value:expr) => {
//         dbg!(reg_read_bits!($peripheral, $register, $field));
//         reg_modify_bits!($peripheral, $register, $field, $value);
//         dbg!(reg_read_bits!($peripheral, $register, $field));
//     };
// }
