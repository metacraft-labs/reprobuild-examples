// calc/src/main.rs — Mode 3 cross-language Rust executable that calls
// into a sibling C static library declared in the same workspace
// ``repro.nim``.
//
// The cross-language wiring the convention performs:
//
//   1. The C ``mathlib`` library is compiled with ``gcc -c`` per-source
//      and archived via ``ar rcs`` into ``.repro/build/mathlib/libmathlib.a``.
//   2. This Rust file is compiled + linked by a single ``rustc`` invocation
//      with ``-L native=<.repro/build/mathlib>`` ``-l static=mathlib`` flags
//      threaded onto the argv by the convention.
//   3. The link sequencing pulls the C archive build strictly before the
//      Rust link so the ``add`` symbol resolves at link time.
//
// The stdout proves the cross-language round-trip: Rust -> C add -> back
// to Rust println!.

extern "C" {
    fn add(a: i32, b: i32) -> i32;
}

fn main() {
    let result = unsafe { add(2, 3) };
    println!("rust says: mathlib added 2+3 = {}", result);
    println!("hello from rust-uses-cpp-lib");
}
