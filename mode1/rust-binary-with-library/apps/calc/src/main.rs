// Mode 1 Rust fixture — calc/src/main.rs.
//
// Demonstrates the zero-ceremony Mode 1 surface (M48 of the Mode 3
// Language Expansion campaign):
//
//   * NO repro.nim / reprobuild.nim
//   * NO Cargo.toml / repro.scanned-deps.nim
//   * Just sources under apps/<name>/ and libs/<name>/
//
// The Mode 1 loader walks the workspace, finds apps/calc + libs/mathlib,
// censuses extensions (both are Rust), synthesises an in-memory
// repro.nim + repro.scanned-deps.nim, and dispatches to the
// rust-direct convention which compiles this binary against the
// upstream mathlib rlib.
//
// The ``use mathlib::add;`` line is what the Mode 1 import scanner
// picks up to emit the calc -> mathlib edge in the synthesised
// scanned-deps file.

use mathlib::add;

fn main() {
    let result = add(2, 3);
    println!(
        "hello from mode1-rust-binary-with-library, mathlib added 2+3 = {}",
        result
    );
}
