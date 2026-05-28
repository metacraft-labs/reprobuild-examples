/* mathlib/src/add.c — single source file for the C static library
   consumed by the Nim binary above. Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Nim entrypoint's link picks up libmathlib.a as a trailing
   positional and the resolved `add` symbol satisfies the Nim
   `{.importc.}` reference. */

#include "mathlib/add.h"

int add(int a, int b) {
    return a + b;
}
