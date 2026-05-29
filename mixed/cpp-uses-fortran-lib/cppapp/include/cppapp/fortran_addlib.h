/* cppapp/include/cppapp/fortran_addlib.h — hand-written C header
   bridging the Fortran ``fortaddlib`` static archive into the cppapp
   C++ executable.

   The fortran-direct convention compiles ``fortaddlib/src/lib.f90``
   with gfortran's ``bind(C, name="fortran_add")`` attribute applied
   so the archive carries the symbol ``fortran_add`` with C ABI. This
   header is hand-authored — auto-generating C headers from Fortran
   sources is a future-milestone scope. Keep the extern decl below in
   sync with ``fortaddlib/src/lib.f90``'s exported function set. */

#ifndef CPPAPP_FORTRAN_ADDLIB_H
#define CPPAPP_FORTRAN_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Fortran function. Plain int parameters round-trip
   safely through the C ABI; gfortran's ``integer(c_int)`` maps to
   C's ``int``. */
extern int fortran_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_FORTRAN_ADDLIB_H */
