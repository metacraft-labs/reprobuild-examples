## Mode 3 cross-language pilot binary — calls into a C library member
## belonging to a sibling package in the same workspace.
##
## The ``{.importc, header: "mathlib/add.h".}`` declaration tells Nim to
## emit ``#include "mathlib/add.h"`` in the generated ``.c`` files. The
## Nim convention's Phase 1 invocation receives a ``--passC:-I<path-to-
## mathlib/include>`` flag (auto-threaded from the
## ``depends_on nimapp: mathlib`` edge), so the C compiler resolves the
## include at compile time. The Nim link (Phase 3) gains the
## ``.repro/build/mathlib/libmathlib.a`` archive as a trailing positional
## so symbol resolution succeeds at link time.
##
## NOTE: the user does NOT need to write ``{.passC.}`` / ``{.passL.}``
## pragmas by hand — the convention threads both based on the
## ``depends_on`` edge. The single ``{.importc.}`` declaration is the
## only Nim-side ceremony the cross-language pattern needs.

proc cAdd(a, b: cint): cint {.importc: "add", header: "mathlib/add.h".}

echo "1 + 2 = ", cAdd(1.cint, 2.cint)
echo "hello from nim-uses-cpp-lib"
