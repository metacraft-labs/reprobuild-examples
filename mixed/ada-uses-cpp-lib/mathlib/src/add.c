/* mathlib/src/add.c — single source file for the C static library
   consumed by the Ada binary in this M58 forward-direction fixture.
   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Ada binary's gnatmake link picks up the archive after the
   ``-largs`` separator; the resolved `c_add` symbol satisfies the
   Ada ``pragma Import (C, C_Add, "c_add")`` declaration. */

#include "mathlib/add.h"

int c_add(int a, int b) {
    return a + b;
}
