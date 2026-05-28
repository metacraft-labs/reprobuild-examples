// cppapp/src/main.cpp — C++ executable that calls into a Nim static
// archive built from the sibling ``addlib`` package in the same
// workspace.
//
// The cross-language wiring the convention performs:
//
//   1. The Nim ``addlib`` library is compiled with ``--noMain
//      --app:staticlib`` so ``libaddlib.a`` exports ``nimAdd`` AND
//      ``NimMain`` (the runtime initializer) WITHOUT colliding with
//      this binary's ``main()``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is ``g++ -o cppapp.exe <objs>
//      .repro/build/addlib/libaddlib.a`` — the Nim archive lands as a
//      trailing positional so gcc/ld resolves ``nimAdd`` /
//      ``NimMain`` against it.
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Nim ``nimAdd`` -> back to C++.

#include <cstdio>

#include "cppapp/nim_addlib.h"

int main(void) {
  // MUST be called before any other Nim function — initialises Nim's
  // runtime (GC roots, exception table, module init code). Skipping
  // this would crash the moment nimAdd touches any GC'd memory.
  NimMain();

  int result = nimAdd(2, 3);
  std::printf("cpp says: nim added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-nim-lib\n");
  return 0;
}
