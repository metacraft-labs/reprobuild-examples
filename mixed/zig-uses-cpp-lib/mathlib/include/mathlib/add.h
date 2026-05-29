#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M44 cross-language pilot fixture (Zig → C).
   The Zig binary's ``extern fn c_add(...) i32`` declares this symbol.
   The zig-direct convention threads the archive onto the
   ``zig build-exe`` argv as a trailing positional plus the archive's
   parent dir as ``-L <dir>`` so Zig's underlying linker resolves the
   archive's ``c_add`` symbol at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int c_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
