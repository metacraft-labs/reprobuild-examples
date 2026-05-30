#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M59 cross-language pilot fixture (Pascal → C).
   The Pascal binary's ``external name 'c_add'`` declares this symbol.
   The pascal-direct convention threads the archive onto the fpc argv
   via ``-Fl<dir>`` (linker search path) plus ``-k<archive>`` (linker
   pass-through) so fpc's underlying linker resolves the archive's
   ``c_add`` symbol at link time. */

#ifdef __cplusplus
extern "C" {
#endif

int c_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
