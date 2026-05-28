/* mathlib/src/add.c — single source file for the static library.
   The c-cpp-direct convention compiles it with:

     gcc -c -O2 -Wall -Wextra -std=c17 -MD -MF ... \
         -I mathlib/src -I mathlib/include \
         -o .../add.o mathlib/src/add.c

   And then archives the resulting .o into .repro/build/mathlib/
   libmathlib.a via `ar rcs`. */

#include "mathlib/add.h"

int add(int a, int b) {
    return a + b;
}
