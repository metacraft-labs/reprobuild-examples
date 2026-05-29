/* mathlib/src/c_add.c — single source file for the C static library
   consumed by the Fortran binary in this M37 forward-direction fixture.

   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../c_add.o mathlib/src/c_add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Fortran binary's gfortran link picks up the archive as a
   trailing positional; the resolved `c_add` symbol satisfies the
   Fortran `interface ... bind(C)` declaration. */

#include "mathlib/c_add.h"

int c_add(int a, int b) {
    return a + b;
}
