/* cppapp/include/cppapp/goaddlib_wrapper.h — hand-written C wrapper
   header bridging the Go ``goaddlib`` static archive into the cppapp
   C++ executable.

   Go's ``-buildmode=c-archive`` AUTO-emits a sibling ``libgoaddlib.h``
   next to ``libgoaddlib.a`` carrying the exported function
   declarations. That generated header lives at
   ``<root>/.repro/build/goaddlib/libgoaddlib.h`` — a path that's not
   stable across project layouts. This wrapper header avoids leaking
   the build-tree path into the C++ source by providing the bare
   ``extern "C"`` declaration directly.

   Keep the extern decl below in sync with ``goaddlib/lib.go``'s
   ``//export``ed function set. */

#ifndef CPPAPP_GOADDLIB_WRAPPER_H
#define CPPAPP_GOADDLIB_WRAPPER_H

#ifdef __cplusplus
extern "C" {
#endif

/* User-exported Go function. Plain int parameters round-trip safely
   through the C ABI without touching the Go allocator. */
extern int GoAdd(int a, int b);

#ifdef __cplusplus
}
#endif

#endif /* CPPAPP_GOADDLIB_WRAPPER_H */
