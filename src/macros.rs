// TODO: generate docs as well...
// https://amanjeev.com/blog/rust-document-macro-invocations/
//
// TODO: is the trait thing maybe better after all? boilerplate is bad...

#[macro_export]
macro_rules! wrap_peripheral {
    ($hal_name:ident, $pac_name:ident, $arg_name:ident) => {
        // /// Entry point to the $hal_name API
        pub struct $hal_name {
            raw: raw::$pac_name,
        }

        pub fn wrap($arg_name: raw::$pac_name) -> $hal_name {
            $hal_name::new($arg_name)
        }

        impl $hal_name {
            pub fn new($arg_name: raw::$pac_name) -> Self {
                $hal_name { raw: $arg_name }
            }

            pub fn release(self) -> raw::$pac_name {
                self.raw
            }
        }
    };
}

#[macro_export]
macro_rules! wrap_peripheral_with_state {
    ($hal_name:ident, $pac_name:ident, $arg_name:ident) => {
        // /// Entry point to the $hal_name API
        pub struct $hal_name<State = init_state::Disabled> {
            raw: raw::$pac_name,
            pub _state: State,
        }

        pub fn wrap($arg_name: raw::$pac_name) -> $hal_name<init_state::Disabled> {
            $hal_name::new($arg_name)
        }

        impl $hal_name<init_state::Disabled> {
            pub fn new($arg_name: raw::$pac_name) -> Self {
                $hal_name {
                    raw: $arg_name,
                    _state: init_state::Disabled,
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
