// dcalc/src/main.d — M45 Mode 3 D executable that calls into a
// sibling D static library declared in the same workspace
// ``repro.nim``.
//
// The cross-package wiring the convention performs:
//
//   1. The D ``dlib`` library is compiled with ``ldmd2 -lib`` into
//      ``.repro/build/dlib/libdlib.a``.
//   2. This D file is compiled + linked by a single ``ldmd2``
//      invocation with the upstream archive threaded via ``-L=``
//      (linker pass-through).
//   3. The link sequencing pulls the library build strictly before
//      the executable link so the ``d_add`` symbol resolves at link
//      time.
//
// The stdout proves the cross-package round-trip: dcalc -> dlib
// d_add() -> back to dcalc.

import std.stdio;

extern (C) int d_add(int a, int b);

void main() {
    int result = d_add(2, 3);
    writeln("hello from d-mode3-binary-with-library, dlib added 2+3 = ", result);
}
