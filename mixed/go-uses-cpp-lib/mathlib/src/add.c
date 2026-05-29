/* mathlib/src/add.c — single source file for the C static library
   consumed by the Go binary in this M36 forward-direction fixture
   (cgo path).

   The convention compiles this file with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archives it into .repro/build/mathlib/libmathlib.a via
   `ar rcs`. The Go binary's `go build` (cgo path) picks up the
   archive via `-ldflags=-extldflags=-L<archive-dir> -lmathlib`; the
   resolved `add` symbol satisfies the cgo-generated wrapper for
   `C.add(...)` calls in the Go source. */

#include "mathlib/add.h"

int add(int a, int b) {
    return a + b;
}
