/* cppapp/include/cppapp/d_addlib.h — hand-written C header bridging
   the D ``daddlib`` static archive into the cppapp C++ executable.

   The d-direct convention compiles ``daddlib/src/lib.d`` with::

       ldmd2 -lib -release -O ...

   which produces ``libdaddlib.a`` containing ``d_add`` — the
   user-exported function (D source carries ``extern (C)`` linkage).

   This header is hand-authored — auto-generating C headers from D
   sources is a future-milestone scope. Keep the extern decl below
   in sync with ``daddlib/src/lib.d``'s exported function set. */

#ifndef CPPAPP_D_ADDLIB_H
#define CPPAPP_D_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported D function. Plain int parameters round-trip safely
   through the C ABI. */
extern int d_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_D_ADDLIB_H */
