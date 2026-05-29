// calc/src/main.rs — Mode 3 Rust executable that depends on the
// mathlib package's public crate.
//
// The `use mathlib::add;` line is what the scanner picks up to emit
// the `depends_on calcPkg: mathlibPkg` edge in repro.scanned-deps.nim.

use mathlib::add;

fn main() {
    let result = add(2, 3);
    println!(
        "hello from rust-mode3-binary-with-library, mathlib added 2+3 = {}",
        result
    );
}
