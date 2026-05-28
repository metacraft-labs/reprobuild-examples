/* calc/src/calc.c — Mode 3 C/C++ executable that depends on the
   mathlib package's public header. The `#include "mathlib/add.h"`
   line is what the scanner picks up to emit the
   `depends_on calcPkg: mathlibPkg` edge in repro.scanned-deps.nim. */

#include <stdio.h>
#include "mathlib/add.h"

int main(void) {
    int result = add(2, 3);
    printf("hello from c-cpp-mode3-binary-with-library, 2 + 3 = %d\n", result);
    return 0;
}
