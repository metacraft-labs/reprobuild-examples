// cppapp/src/main.cpp — M45 reverse-direction cross-language pilot:
// a C++ executable that calls into a D static archive built from
// the sibling ``daddlib`` package in the same workspace.
//
// The cross-language wiring the d-direct convention performs:
//
//   1. The D ``daddlib`` library is compiled with ``ldmd2 -lib`` so
//      ``libdaddlib.a`` exports ``d_add`` with the C ABI (D's
//      ``extern (C)`` linkage) and lands at the canonical archive
//      path ``.repro/build/daddlib/libdaddlib.a``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is
//      ``g++ -o cppapp.exe <objs>
//      .repro/build/daddlib/libdaddlib.a`` — the D archive lands as
//      a trailing positional so gcc/ld resolves ``d_add`` against
//      it. The M45 honest-scope cut keeps daddlib's deps to
//      ``core.stdc.*`` so no explicit runtime ``-l`` flags are
//      needed.
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> D ``d_add`` -> back to C++.

#include <cstdio>

#include "cppapp/d_addlib.h"

int main(void) {
  int result = d_add(2, 3);
  std::printf("cpp says: d added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-d-lib\n");
  return 0;
}
