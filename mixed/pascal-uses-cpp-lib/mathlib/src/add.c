/* mathlib/src/add.c — single source file for the C static library
   consumed by the Pascal binary in this M59 forward-direction fixture.
   Compiled with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And archived into .repro/build/mathlib/libmathlib.a via `ar rcs`.
   The Pascal binary's fpc link picks up the archive via ``-Fl<dir>``
   (linker search path) plus a trailing ``-k<archive>`` (linker
   pass-through); the resolved `c_add` symbol satisfies the Pascal
   ``external name 'c_add'`` declaration. */

#include "mathlib/add.h"

int c_add(int a, int b) {
    return a + b;
}
