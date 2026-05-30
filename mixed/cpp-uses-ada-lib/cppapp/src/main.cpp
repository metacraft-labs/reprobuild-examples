// cppapp/src/main.cpp — M58 reverse-direction cross-language pilot:
// a C++ executable that calls into an Ada static archive built from
// the sibling ``adaaddlib`` package in the same workspace.
//
// The cross-language wiring the ada-direct convention performs:
//
//   1. The Ada ``adaaddlib`` library is compiled with ``gcc -c -gnatp``
//      so ``libadaaddlib.a`` exports ``ada_add`` with the C ABI (Ada's
//      ``pragma Export (C, ...)`` linkage) and lands at the canonical
//      archive path ``.repro/build/adaaddlib/libadaaddlib.a``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is
//      ``g++ -o cppapp.exe <objs>
//      .repro/build/adaaddlib/libadaaddlib.a`` — the Ada archive lands
//      as a trailing positional so gcc/ld resolves ``ada_add`` against
//      it. The M58 honest-scope cut keeps adaaddlib pure (no Ada
//      I/O, no exception raising) so no explicit runtime ``-l`` flags
//      are needed and no ``adainit()`` / ``adafinal()`` bracket calls
//      are required.
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Ada ``ada_add`` -> back to C++.

#include <cstdio>

#include "cppapp/ada_addlib.h"

int main(void) {
  int result = ada_add(2, 3);
  std::printf("cpp says: ada added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-ada-lib\n");
  return 0;
}
