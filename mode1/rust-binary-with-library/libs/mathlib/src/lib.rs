// Mode 1 Rust fixture — libs/mathlib/src/lib.rs.
//
// The rust-direct convention compiles this crate at Mode 1 emit time
// into ``.repro/build/mathlib/libmathlib.rlib`` and threads it onto
// the downstream calc binary's rustc link line via
// ``--extern mathlib=<rlib>``. M48 reuses the rust-direct M30 plumbing
// unchanged — the only Mode 1-specific step is synthesising the
// repro.nim + repro.scanned-deps.nim under
// ``.repro/mode1-synth/`` so the standard provider sees a real
// project file at dispatch time.

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
