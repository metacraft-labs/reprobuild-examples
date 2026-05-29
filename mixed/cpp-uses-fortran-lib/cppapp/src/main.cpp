// cppapp/src/main.cpp — M37 reverse-direction cross-language pilot:
// a C++ executable that calls into a Fortran static archive built from
// the sibling ``fortaddlib`` package in the same workspace.
//
// The cross-language wiring the fortran-direct convention performs:
//
//   1. The Fortran ``fortaddlib`` library is compiled with ``gfortran
//      -c`` per-source, then archived via ``ar rcs`` into
//      ``libfortaddlib.a``. The ``bind(C, name="fortran_add")``
//      attribute in the Fortran source ensures the archive carries a
//      C-callable symbol named exactly ``fortran_add``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is ``g++ -o cppapp.exe <objs>
//      .repro/build/fortaddlib/libfortaddlib.a <fortran-runtime-libs>``
//      — the Fortran archive lands as a trailing positional so ld
//      resolves ``fortran_add`` against it, followed by the platform-
//      specific Fortran runtime libs (``-lgfortran -lquadmath -lm``;
//      ``-lpthread`` on POSIX).
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Fortran ``fortran_add`` -> back to C++.

#include <cstdio>

#include "cppapp/fortran_addlib.h"

int main(void) {
  int result = fortran_add(2, 3);
  std::printf("cpp says: fortran added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-fortran-lib\n");
  return 0;
}
