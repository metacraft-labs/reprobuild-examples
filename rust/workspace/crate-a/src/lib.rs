//! Library crate consumed by ``crate-b``.

/// Return a friendly greeting for `name`.
pub fn greet(name: &str) -> String {
    format!("hello, {}", name)
}
