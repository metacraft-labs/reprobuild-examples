#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the mathlib package's cross-language pilot fixture.
   The Nim binary's {.importc, header: "mathlib/add.h".} declaration
   makes the Nim compiler emit `#include "mathlib/add.h"` in the
   generated .c files; the convention threads --passC:-I<this-dir>/..
   onto Nim's Phase 1 argv so the resulting `gcc -c` invocation
   resolves this header. The Nim link then picks up libmathlib.a as a
   trailing positional, completing the cross-language wiring. */

#ifdef __cplusplus
extern "C" {
#endif

int add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
