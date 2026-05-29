#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M45 cross-language pilot fixture (D → C).
   The D binary's ``extern (C) c_add(...)`` declares this symbol.
   The d-direct convention threads the archive onto the ``ldmd2``
   argv as ``-L=<archive>`` (linker pass-through) so D's underlying
   linker resolves the archive's ``c_add`` symbol at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int c_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
