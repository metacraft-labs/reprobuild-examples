// cppapp/src/main.cpp — M59 reverse-direction cross-language pilot:
// a C++ executable that calls into a Pascal static archive built from
// the sibling ``pascaladdlib`` package in the same workspace.
//
// The cross-language wiring the pascal-direct convention performs:
//
//   1. The Pascal ``pascaladdlib`` library is compiled with
//      ``fpc -O2 -CX`` so ``libpascaladdlib.a`` exports
//      ``pascal_add`` with the C ABI (Pascal's
//      ``exports PascalAdd name 'pascal_add';`` + ``cdecl`` linkage)
//      and lands at the canonical archive path
//      ``.repro/build/pascaladdlib/libpascaladdlib.a``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is
//      ``g++ -o cppapp.exe <objs>
//      .repro/build/pascaladdlib/libpascaladdlib.a`` — the Pascal
//      archive lands as a trailing positional so gcc/ld resolves
//      ``pascal_add`` against it. The M59 honest-scope cut keeps
//      pascaladdlib pure (no Pascal I/O, no exception raising) so no
//      explicit runtime ``-l`` flags are needed and no RTL bootstrap
//      bracket calls are required.
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Pascal ``pascal_add`` -> back to C++.

#include <cstdio>

#include "cppapp/pascal_addlib.h"

int main(void) {
  int result = pascal_add(2, 3);
  std::printf("cpp says: pascal added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-pascal-lib\n");
  return 0;
}
