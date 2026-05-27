//! Minimal Rust library exposing a single `greet` function.

/// Return a friendly greeting for `name`.
pub fn greet(name: &str) -> String {
    format!("hello, {}", name)
}
