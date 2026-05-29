/* mathlib/src/add.c — single source file for the C static library
   consumed by the Zig binary in this M44 forward-direction fixture.
   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Zig binary's zig build-exe link picks up the archive as a
   trailing positional; the resolved `c_add` symbol satisfies the
   Zig `extern fn c_add` declaration. */

#include "mathlib/add.h"

int c_add(int a, int b) {
    return a + b;
}
