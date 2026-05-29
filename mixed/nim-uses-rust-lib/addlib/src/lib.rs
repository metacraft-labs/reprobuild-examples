// addlib/src/lib.rs — M35 forward-direction cross-language pilot:
// a Rust ``no_std`` library exposing a single C-callable function to a
// sibling Nim executable in the same workspace. Mirror of the M34
// ``mixed/cpp-uses-rust-lib`` fixture's ``addlib/src/lib.rs``; the only
// difference is the language of the consumer (Nim here vs C++ there).
//
// **Why no_std?** A default Rust staticlib carries the full ``std``
// crate's compiled object code. On the current Reprobuild host
// (MSVC-built rustc + MinGW gcc/g++) the std archive references MSVC
// runtime symbols (``__chkstk``, MSVC C++ type-info entries, etc.) that
// the MinGW linker cannot resolve. ``no_std`` + ``panic=abort`` strips
// the std + panic_unwind crates entirely so the archive carries ONLY
// the user's exported function + a minimal panic handler. This is the
// realistic FFI pattern for cross-language Rust archives — most
// production FFI crates ship as no_std for exactly this reason.
//
// The ``#[no_mangle]`` attribute + ``pub extern "C"`` declaration pair
// tells rustc to emit:
//   * a C symbol named exactly ``rust_add`` (no Rust name mangling)
//   * with the C calling convention (so Nim's ``{.importc, cdecl.}``
//     decl resolves to the same ABI).
//
// The Nim convention compiles this module with::
//
//     rustc --crate-name addlib --edition 2021 \
//         --crate-type staticlib \
//         --emit=link -C opt-level=2 -C metadata=<hash> \
//         -C panic=abort \
//         -o <root>/.repro/build/addlib/libaddlib.a \
//         addlib/src/lib.rs
//
// The resulting ``libaddlib.a`` is then threaded onto the Nim binary's
// Phase 3 gcc link line as a trailing positional, plus the
// platform-specific Rust runtime libs (``-lws2_32 -luserenv -ladvapi32
// -lbcrypt -lntdll`` on Windows MinGW; ``-lpthread -ldl -lm`` on
// POSIX). Most of those runtime libs are inert under no_std but the
// convention threads them unconditionally to keep the link line shape
// uniform; the linker silently drops the references when nothing in
// the archive uses them.

#![no_std]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    // The fixture's ``rust_add`` never panics, so this handler is
    // unreachable from the user's call sites. We loop forever
    // defensively — a panic from inside ``rust_add`` would otherwise
    // be UB.
    loop {}
}

#[no_mangle]
pub extern "C" fn rust_add(a: i32, b: i32) -> i32 {
    a + b
}
