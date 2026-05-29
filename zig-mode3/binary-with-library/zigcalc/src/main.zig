// zigcalc/src/main.zig — M44 Mode 3 Zig executable that calls into
// a sibling Zig static library declared in the same workspace
// ``repro.nim``.
//
// The cross-package wiring the convention performs:
//
//   1. The Zig ``ziglib`` library is compiled with ``zig build-lib``
//      into ``.repro/build/ziglib/libziglib.a``.
//   2. This Zig file is compiled + linked by a single
//      ``zig build-exe`` invocation with the upstream archive
//      threaded as a trailing positional on the argv.
//   3. The link sequencing pulls the library build strictly before
//      the executable link so the ``zig_add`` symbol resolves at
//      link time.
//
// The stdout proves the cross-package round-trip: zigcalc -> ziglib
// zig_add() -> back to zigcalc.

const std = @import("std");

extern fn zig_add(a: i32, b: i32) i32;

pub fn main() !void {
    const result = zig_add(2, 3);
    const stdout = std.io.getStdOut().writer();
    try stdout.print("hello from zig-mode3-binary-with-library, ziglib added 2+3 = {d}\n", .{result});
}
