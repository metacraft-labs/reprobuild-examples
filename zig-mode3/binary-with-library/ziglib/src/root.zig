// ziglib/src/root.zig — M44 Mode 3 Zig library exposing a single
// C-callable function to a sibling executable in the same workspace.
//
// The ``export`` keyword tells Zig to emit a C-ABI symbol named
// exactly ``zig_add`` (no Zig name mangling), so the resulting
// ``libziglib.a`` static archive carries a directly-linkable symbol.
// The zig-direct convention compiles this module with:
//
//     zig build-lib -O ReleaseSafe --name ziglib \
//         -femit-bin=<root>/.repro/build/ziglib/libziglib.a \
//         ziglib/src/root.zig
//
// The resulting ``libziglib.a`` is then threaded onto the downstream
// ``zigcalc`` binary's ``zig build-exe`` link as a trailing positional;
// the linker resolves the cross-package ``zig_add`` reference at link
// time.

export fn zig_add(a: i32, b: i32) i32 {
    return a + b;
}
