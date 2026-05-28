/* cppapp/include/cppapp/nim_addlib.h — hand-written C header bridging
   the Nim ``addlib`` static archive into the cppapp C++ executable.

   The Nim convention compiles ``addlib/src/addlib.nim`` with::

       nim c --noMain --app:staticlib --mm:orc -d:release

   which produces ``libaddlib.a`` containing:

     * ``nimAdd``  — the user-exported function (Nim source carries
                     ``{.exportc, cdecl.}``)
     * ``NimMain`` — Nim runtime initializer; MUST be called once at
                     program startup before any other Nim function.

   This header is hand-authored — auto-generating C headers from Nim
   sources is a future-milestone scope. Keep the extern decls below in
   sync with ``addlib/src/addlib.nim``'s ``{.exportc.}`` set. */

#ifndef CPPAPP_NIM_ADDLIB_H
#define CPPAPP_NIM_ADDLIB_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Nim function. ``cdecl`` ABI matches the
   ``{.cdecl.}`` annotation on the Nim side. */
extern int nimAdd(int a, int b);

/* Nim runtime initializer. The C++ binary's main() MUST call this
   exactly once before invoking any other Nim function — including
   nimAdd above. Calling Nim code without NimMain() first leaves the
   GC + Nim system module uninitialised; behaviour is undefined. */
extern void NimMain(void);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_NIM_ADDLIB_H */
