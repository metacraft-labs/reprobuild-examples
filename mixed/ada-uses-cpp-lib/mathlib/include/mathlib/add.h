#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M58 cross-language pilot fixture (Ada → C).
   The Ada binary's ``pragma Import (C, C_Add, "c_add")`` declares
   this symbol. The ada-direct convention threads the archive onto
   the gnatmake argv as a trailing positional after ``-largs``
   (linker pass-through) so gnatmake's underlying linker resolves
   the archive's ``c_add`` symbol at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int c_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
