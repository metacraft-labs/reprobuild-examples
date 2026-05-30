/* cppapp/include/cppapp/ada_addlib.h — hand-written C header bridging
   the Ada ``adaaddlib`` static archive into the cppapp C++ executable.

   The ada-direct convention compiles ``adaaddlib/src/lib.adb`` with::

       gcc -c -O2 -gnatp ...

   which produces ``lib.o`` and then ``ar rcs libadaaddlib.a lib.o``.
   The archive contains ``ada_add`` — the user-exported function (Ada
   source carries ``pragma Export (C, Ada_Add, "ada_add")``).

   This header is hand-authored — auto-generating C headers from Ada
   sources is a future-milestone scope. Keep the extern decl below
   in sync with ``adaaddlib/src/lib.ads``'s ``pragma Export`` set. */

#ifndef CPPAPP_ADA_ADDLIB_H
#define CPPAPP_ADA_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Ada function. Plain int parameters round-trip safely
   through the C ABI. */
extern int ada_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_ADA_ADDLIB_H */
