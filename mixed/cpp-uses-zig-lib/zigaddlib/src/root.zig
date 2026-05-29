// zigaddlib/src/root.zig — M44 reverse-direction cross-language
// pilot: a Zig library exposing a single C-callable function to a
// sibling C++ executable in the same workspace.
//
// The ``export`` keyword tells Zig to emit a C-ABI symbol named
// exactly ``zig_add`` (no Zig name mangling), so the resulting
// ``libzigaddlib.a`` static archive carries a directly-linkable
// symbol that a hand-written C/C++ extern decl resolves to.
//
// The zig-direct convention compiles this module with::
//
//     zig build-lib -O ReleaseSafe --name zigaddlib \
//         -femit-bin=<root>/.repro/build/zigaddlib/libzigaddlib.a \
//         zigaddlib/src/root.zig
//
// Unlike Rust ``no_std`` staticlibs which require explicit panic
// handling, Zig static archives bundle the minimal compiler-rt
// routines they need into the archive itself; the C++ link line
// doesn't need any extra runtime ``-l`` flags.

export fn zig_add(a: i32, b: i32) i32 {
    return a + b;
}
