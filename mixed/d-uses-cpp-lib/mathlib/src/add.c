/* mathlib/src/add.c — single source file for the C static library
   consumed by the D binary in this M45 forward-direction fixture.
   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The D binary's ldmd2 link picks up the archive via ``-L=<archive>``
   (linker pass-through); the resolved `c_add` symbol satisfies the
   D ``extern (C) c_add`` declaration. */

#include "mathlib/add.h"

int c_add(int a, int b) {
    return a + b;
}
