#ifndef MATHLIB_C_ADD_H
#define MATHLIB_C_ADD_H

/* Public header for the M37 forward-direction cross-language pilot.
   The Fortran binary's ``interface ... bind(C, name="c_add")`` block
   names this symbol. The fortran-direct convention threads the
   archive's full path onto the gfortran link argv as a trailing
   positional so the symbol resolves at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int c_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_C_ADD_H */
