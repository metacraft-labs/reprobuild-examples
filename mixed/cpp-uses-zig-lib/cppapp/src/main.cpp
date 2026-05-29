// cppapp/src/main.cpp — M44 reverse-direction cross-language pilot:
// a C++ executable that calls into a Zig static archive built from
// the sibling ``zigaddlib`` package in the same workspace.
//
// The cross-language wiring the zig-direct convention performs:
//
//   1. The Zig ``zigaddlib`` library is compiled with
//      ``zig build-lib`` so ``libzigaddlib.a`` exports ``zig_add``
//      with the C ABI (Zig's ``export`` keyword) and lands at the
//      canonical archive path
//      ``.repro/build/zigaddlib/libzigaddlib.a``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is
//      ``g++ -o cppapp.exe <objs>
//      .repro/build/zigaddlib/libzigaddlib.a`` — the Zig archive
//      lands as a trailing positional so gcc/ld resolves
//      ``zig_add`` against it. Zig static archives bundle compiler-rt
//      INTO the archive itself, so no explicit runtime ``-l`` flags
//      are needed (unlike Rust no_std which needs -lpthread/-ldl or
//      Fortran which needs -lgfortran).
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Zig ``zig_add`` -> back to C++.

#include <cstdio>

#include "cppapp/zig_addlib.h"

int main(void) {
  int result = zig_add(2, 3);
  std::printf("cpp says: zig added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-zig-lib\n");
  return 0;
}
