// dlib/src/lib.d — M45 Mode 3 D library exposing a single C-callable
// function to a sibling executable in the same workspace.
//
// The ``extern (C)`` linkage tells D to emit a C-ABI symbol named
// exactly ``d_add`` (no D name mangling), so the resulting
// ``libdlib.a`` static archive carries a directly-linkable symbol.
// The d-direct convention compiles this module with:
//
//     ldmd2 -lib -release -O -of=<root>/.repro/build/dlib/libdlib.a \
//         dlib/src/lib.d
//
// The resulting ``libdlib.a`` is then threaded onto the downstream
// ``dcalc`` binary's ``ldmd2`` link via ``-L=<archive>`` (linker
// pass-through); the linker resolves the cross-package ``d_add``
// reference at link time.

extern (C) int d_add(int a, int b) {
    return a + b;
}
