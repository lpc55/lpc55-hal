use void::Void;
use nb;

/// Which button is pressed
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Button {
    ButtonTop,
    ButtonBot,
    ButtonSides,
    ButtonMid,
    ButtonAny,
    ButtonNone,
}

pub struct Buttons {
    pub top: bool,
    pub bot: bool,
    pub mid: bool,
}

pub use Button::*;

/// A type alias for the result of waiting for a Button operation.
pub type Result = nb::Result<Button, Void>;

pub trait ButtonPress {

    /// Is the specific button currently activated
    fn is_pressed(&self, but: Button) -> bool;

    /// Is the specific button currently released
    fn is_released(&self, but: Button) -> bool;

    /// Return the current state (pressed / released) of the three buttons.
    fn get_status(&self) -> Buttons;

}

pub trait ButtonEdge{
    /// Non-blockingly wait for the button to be pressed.
    /// This is edge sensitive, meaning it will not complete successfully more than once
    /// per actual button press.
    /// Use block!(...) macro to actually block.
    fn wait_for_press(&self, but: Button) -> Result;

    /// Same as for wait_for_press, but waits for the release of the button.
    fn wait_for_release(&self, but: Button) -> Result;

    /// See wait_for_press
    fn wait_for_any_press(&self, ) -> Result;

    /// See wait_for_release
    fn wait_for_any_release(&self, ) -> Result;
}