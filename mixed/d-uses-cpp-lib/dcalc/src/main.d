// dcalc/src/main.d — M45 Mode 3 cross-language D executable that
// calls into a sibling C static library declared in the same
// workspace ``repro.nim``.
//
// The cross-language wiring the convention performs:
//
//   1. The C ``mathlib`` library is compiled with ``gcc -c``
//      per-source and archived via ``ar rcs`` into
//      ``.repro/build/mathlib/libmathlib.a``.
//   2. This D file is compiled + linked by a single ``ldmd2``
//      invocation with the archive threaded via ``-L=<archive>``
//      (linker pass-through) so D's underlying linker resolves the
//      cross-language symbol.
//   3. The link sequencing pulls the C archive build strictly before
//      the D link so the ``c_add`` symbol resolves at link time.
//
// The stdout proves the cross-language round-trip: D -> C c_add ->
// back to D.

import std.stdio;

extern (C) int c_add(int a, int b);

void main() {
    int result = c_add(2, 3);
    writeln("d says: mathlib added 2+3 = ", result);
    writeln("hello from d-uses-cpp-lib");
}
