//! Mid-chain library that wraps ``crate_a::greet`` with a banner.

use crate_a::greet;

/// Decorate ``crate_a::greet`` with a banner. ``crate_c`` calls this
/// to print the workspace's greeting.
pub fn banner(name: &str) -> String {
    format!("[chain] {}", greet(name))
}
