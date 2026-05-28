//! Minimal Rust cdylib exposing a single C-ABI ``add`` function.
//!
//! ``crate-type = ["cdylib"]`` in ``Cargo.toml`` makes cargo emit a
//! dynamic library with the C ABI (``<name>.dll`` on Windows,
//! ``lib<name>.so/.dylib`` on POSIX). The function is marked
//! ``#[no_mangle]`` + ``extern "C"`` so the resulting symbol matches
//! the source name and obeys the platform's C calling convention.

/// Add two ``i32``s. Used by the M23 cdylib E2E to confirm the
/// produced dynamic library exports a callable C function. The
/// ``unsafe(no_mangle)`` form is required by Rust 2024 edition; the
/// older bare ``#[no_mangle]`` raises an "unsafe attribute" error.
#[unsafe(no_mangle)]
pub extern "C" fn rust_cdylib_example_add(a: i32, b: i32) -> i32 {
    a + b
}
