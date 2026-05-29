// mathlib/src/lib.rs — Mode 3 Rust library crate.
//
// The rust-direct convention compiles this crate with:
//
//   rustc --crate-name mathlib --edition 2021 \
//         --crate-type rlib --emit=link \
//         -C opt-level=2 -C metadata=<fnv1a-hash> \
//         -o .repro/build/mathlib/libmathlib.rlib \
//         mathlib/src/lib.rs
//
// The resulting libmathlib.rlib is then threaded onto the downstream
// `calc` binary's rustc link line via `--extern mathlib=...`. M30
// emits rlib (not staticlib) because Rust-to-Rust `use upstream::...`
// requires the metadata only rlib carries. The cross-language
// staticlib for C/C++ consumption is deferred to M34.

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
