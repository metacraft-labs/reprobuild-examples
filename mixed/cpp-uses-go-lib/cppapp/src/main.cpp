// cppapp/src/main.cpp — M36 reverse-direction cross-language pilot:
// a C++ executable that calls into a Go static archive built from
// the sibling ``goaddlib`` package in the same workspace.
//
// The cross-language wiring the go-direct convention performs:
//
//   1. The Go ``goaddlib`` library is compiled with
//      ``go build -buildmode=c-archive`` so ``libgoaddlib.a`` exports
//      ``GoAdd`` with the C ABI (no Go name mangling) and lands at
//      the canonical archive path
//      ``.repro/build/goaddlib/libgoaddlib.a``. A sibling
//      ``libgoaddlib.h`` is also auto-emitted alongside.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is ``g++ -o cppapp.exe <objs>
//      .repro/build/goaddlib/libgoaddlib.a <go-runtime-libs>`` — the
//      Go archive lands as a trailing positional so gcc/ld resolves
//      ``GoAdd`` against it, followed by the platform-specific Go
//      runtime libs (Windows MinGW: ``-lws2_32 -lwinmm -lbcrypt
//      -lntdll -luserenv -ladvapi32``; POSIX: ``-lpthread -ldl -lm``).
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Go ``GoAdd`` -> back to C++.

#include <cstdio>

#include "cppapp/goaddlib_wrapper.h"

int main(void) {
  int result = GoAdd(2, 3);
  std::printf("cpp says: GoAdd 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-go-lib\n");
  return 0;
}
