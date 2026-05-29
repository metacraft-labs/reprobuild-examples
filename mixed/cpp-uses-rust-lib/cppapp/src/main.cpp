// cppapp/src/main.cpp — M34 reverse-direction cross-language pilot:
// a C++ executable that calls into a Rust static archive built from the
// sibling ``addlib`` package in the same workspace.
//
// The cross-language wiring the rust-direct convention performs:
//
//   1. The Rust ``addlib`` library is compiled with
//      ``--crate-type staticlib`` so ``libaddlib.a`` exports
//      ``rust_add`` with the C ABI (no Rust name mangling) and lands
//      at the canonical archive path ``.repro/build/addlib/libaddlib.a``.
//   2. This file is compiled via ``g++ -c -std=c++20 -I cppapp/include
//      -o <obj> <this-file>``.
//   3. The terminal link action is ``g++ -o cppapp.exe <objs>
//      .repro/build/addlib/libaddlib.a <rust-runtime-libs>`` — the Rust
//      archive lands as a trailing positional so gcc/ld resolves
//      ``rust_add`` against it, followed by the platform-specific Rust
//      runtime libs (Windows MinGW: ``-lws2_32 -luserenv -ladvapi32
//      -lbcrypt -lntdll``; POSIX: ``-lpthread -ldl -lm``).
//
// The first line of stdout proves the cross-language round-trip:
// C++ -> Rust ``rust_add`` -> back to C++.

#include <cstdio>

#include "cppapp/rust_addlib.h"

int main(void) {
  int result = rust_add(2, 3);
  std::printf("cpp says: rust added 2+3 = %d\n", result);
  std::printf("hello from cpp-uses-rust-lib\n");
  return 0;
}
