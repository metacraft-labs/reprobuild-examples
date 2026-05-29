/* cppapp/include/cppapp/zig_addlib.h — hand-written C header bridging
   the Zig ``zigaddlib`` static archive into the cppapp C++ executable.

   The zig-direct convention compiles ``zigaddlib/src/root.zig`` with::

       zig build-lib -O ReleaseSafe --name zigaddlib ...

   which produces ``libzigaddlib.a`` containing ``zig_add`` — the
   user-exported function (Zig source carries the ``export`` keyword).

   This header is hand-authored — auto-generating C headers from Zig
   sources is a future-milestone scope. Keep the extern decl below in
   sync with ``zigaddlib/src/root.zig``'s exported function set. */

#ifndef CPPAPP_ZIG_ADDLIB_H
#define CPPAPP_ZIG_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Zig function. Plain int parameters round-trip safely
   through the C ABI. */
extern int zig_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_ZIG_ADDLIB_H */
