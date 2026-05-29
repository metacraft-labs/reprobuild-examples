// zigcalc/src/main.zig — M44 Mode 3 cross-language Zig executable
// that calls into a sibling C static library declared in the same
// workspace ``repro.nim``.
//
// The cross-language wiring the convention performs:
//
//   1. The C ``mathlib`` library is compiled with ``gcc -c`` per-source
//      and archived via ``ar rcs`` into
//      ``.repro/build/mathlib/libmathlib.a``.
//   2. This Zig file is compiled + linked by a single ``zig build-exe``
//      invocation with the archive threaded as a trailing positional
//      and the archive's parent dir threaded as ``-L <dir>`` so Zig's
//      underlying linker resolves the cross-language symbol.
//   3. The link sequencing pulls the C archive build strictly before
//      the Zig link so the ``c_add`` symbol resolves at link time.
//
// The stdout proves the cross-language round-trip: Zig -> C c_add ->
// back to Zig.

const std = @import("std");

extern fn c_add(a: i32, b: i32) i32;

pub fn main() !void {
    const result = c_add(2, 3);
    const stdout = std.io.getStdOut().writer();
    try stdout.print("zig says: mathlib added 2+3 = {d}\n", .{result});
    try stdout.print("hello from zig-uses-cpp-lib\n", .{});
}
