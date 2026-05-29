#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the M36 cross-language pilot fixture (cgo
   forward direction). The Go binary's cgo ``import "C"`` block
   carries ``#include "mathlib/add.h"`` to pull in the ``add``
   declaration; the cgo preprocessor wires the call into a
   C-compatible thunk. The go-direct convention threads
   ``-ldflags=-extldflags=-L<archive-dir> -lmathlib`` onto the
   ``go build`` argv so the archive's ``add`` symbol resolves at
   link time. */

#ifdef __cplusplus
extern "C" {
#endif

int add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* MATHLIB_ADD_H */
