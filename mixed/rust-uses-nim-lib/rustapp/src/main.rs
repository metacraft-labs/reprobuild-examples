// rustapp/src/main.rs — M35 reverse-direction cross-language pilot:
// a Rust executable that calls into a Nim static archive built from
// the sibling ``nimaddlib`` package in the same workspace.
//
// The cross-language wiring the convention performs:
//
//   1. The Nim ``nimaddlib`` library is compiled with ``--noMain`` so
//      ``libnimaddlib.a`` exports ``nimAdd`` AND ``NimMain`` (the
//      runtime initializer) WITHOUT colliding with this binary's
//      entry point.
//   2. This file is compiled via ``rustc --crate-type=bin
//      --crate-name rustapp --edition 2021 -C opt-level=2
//      -L native=<.repro/build/nimaddlib> -l static=nimaddlib
//      -l m  /* POSIX only */
//      -o <.repro/build/rustapp/rustapp[.exe]> <this-file>``.
//   3. rustc's default link line picks up the C runtime on Windows
//      MinGW (msvcrt implicit); on POSIX, the explicit ``-l m`` covers
//      Nim's libm references for float formatting.
//
// The first println line proves the cross-language round-trip:
// Rust -> Nim ``nimAdd`` -> back to Rust.

extern "C" {
    // User-exported Nim function. ``cdecl`` ABI (Rust's default for
    // extern "C") matches the ``{.cdecl.}`` annotation on the Nim side.
    fn nimAdd(a: i32, b: i32) -> i32;

    // Nim runtime initializer. MUST be called exactly once before
    // invoking any other Nim function — including nimAdd above.
    // Calling Nim code without NimMain() first leaves the GC + Nim
    // system module uninitialised; behaviour is undefined.
    fn NimMain();
}

fn main() {
    unsafe {
        // MUST be called before any other Nim function — initialises
        // Nim's runtime (GC roots, exception table, module init code).
        // Skipping this would crash the moment nimAdd touches any GC'd
        // memory.
        NimMain();

        let result = nimAdd(2, 3);
        println!("rust says: nim added 2+3 = {}", result);
    }
    println!("hello from rust-uses-nim-lib");
}
