#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M34 cross-language pilot fixture.
   The Rust binary's ``extern "C" { fn add(a: i32, b: i32) -> i32; }``
   block names this symbol. The rust-direct convention threads
   ``-L native=<mathlib-archive-dir>`` ``-l static=mathlib`` onto the
   Rust binary's rustc argv so the archive's ``add`` symbol resolves
   at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
