/* cppapp/include/cppapp/rust_addlib.h — hand-written C header bridging
   the Rust ``addlib`` static archive into the cppapp C++ executable.

   The rust-direct convention compiles ``addlib/src/lib.rs`` with::

       rustc --crate-type staticlib ...

   which produces ``libaddlib.a`` containing ``rust_add`` — the
   user-exported function (Rust source carries
   ``#[no_mangle] pub extern "C"``).

   This header is hand-authored — auto-generating C headers from Rust
   sources is a future-milestone scope. Keep the extern decl below in
   sync with ``addlib/src/lib.rs``'s exported function set. */

#ifndef CPPAPP_RUST_ADDLIB_H
#define CPPAPP_RUST_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Rust function. Plain int parameters round-trip safely
   through the C ABI without touching the Rust allocator. */
extern int rust_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_RUST_ADDLIB_H */
