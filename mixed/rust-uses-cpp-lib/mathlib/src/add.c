/* mathlib/src/add.c — single source file for the C static library
   consumed by the Rust binary in this M34 forward-direction fixture.
   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Rust binary's rustc link picks up the archive via
   `-L native=<.repro/build/mathlib>` + `-l static=mathlib`; the
   resolved `add` symbol satisfies the Rust `extern "C"` declaration. */

#include "mathlib/add.h"

int add(int a, int b) {
    return a + b;
}
