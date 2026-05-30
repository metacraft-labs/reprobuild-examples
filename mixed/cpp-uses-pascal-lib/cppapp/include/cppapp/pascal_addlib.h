/* cppapp/include/cppapp/pascal_addlib.h — hand-written C header
   bridging the Pascal ``pascaladdlib`` static archive into the cppapp
   C++ executable.

   The pascal-direct convention compiles ``pascaladdlib/src/lib.pas``
   via::

       fpc -O2 -CX ...

   which produces ``lib.o`` and then ``ar rcs libpascaladdlib.a lib.o``.
   The archive contains ``pascal_add`` — the user-exported function
   (Pascal source carries ``exports PascalAdd name 'pascal_add';``
   plus the ``cdecl`` calling-convention directive on the
   implementation).

   This header is hand-authored — auto-generating C headers from
   Pascal sources is a future-milestone scope. Keep the extern decl
   below in sync with ``pascaladdlib/src/lib.pas``'s ``exports``
   clause. */

#ifndef CPPAPP_PASCAL_ADDLIB_H
#define CPPAPP_PASCAL_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Pascal function. Plain int parameters round-trip
   safely through the C ABI. */
extern int pascal_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_PASCAL_ADDLIB_H */
