// daddlib/src/lib.d — M45 reverse-direction cross-language pilot: a
// D library exposing a single C-callable function to a sibling C++
// executable in the same workspace.
//
// The ``extern (C)`` linkage tells D to emit a C-ABI symbol named
// exactly ``d_add`` (no D name mangling), so the resulting
// ``libdaddlib.a`` static archive carries a directly-linkable
// symbol that a hand-written C/C++ extern decl resolves to.
//
// The d-direct convention compiles this module with::
//
//     ldmd2 -lib -release -O \
//         -of=<root>/.repro/build/daddlib/libdaddlib.a \
//         daddlib/src/lib.d
//
// The M45 honest-scope cut keeps the library's dependencies to
// ``core.stdc.*`` (the C header bindings; no druntime / phobos
// required) so the C++ link line stays minimal — no
// ``-lphobos2-ldc`` / ``-ldruntime-ldc`` / GC bracket calls. Full
// ``import std.*`` support is deferred to a future milestone.

extern (C) int d_add(int a, int b) {
    return a + b;
}
