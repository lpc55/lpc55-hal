// TODO: is this renaming confusing?
// Using the name as is is not so nice
// `wg` is for "Rust Embedded Working Group (WG)"
// TODO: this pulls in the not-very-well-organised
// entire library, in particular not just traits and types.
// Would be worth being more explicit.
pub use embedded_hal as wg;

// TODO: Add more as needed,
// - internal
// - specific (CASPER, PUF, etc.)
// - experiments
// - etc.
//
// Idea is to try and have (peripheral) drivers implement
// a well-designed trait.
