## Mode 3 cross-language pilot — Nim library exposing a single C-callable
## function to a sibling C++ executable in the same workspace.
##
## The ``{.exportc, cdecl.}`` pragma pair tells Nim to emit:
##   * a C symbol named exactly ``nimAdd`` (no Nim name mangling), with
##   * cdecl calling convention so a hand-written C/C++ extern decl
##     resolves to the same ABI.
##
## The convention compiles this module with::
##
##     nim c --compileOnly --noLinking --noMain --app:staticlib \
##         --mm:orc -d:release --nimcache:<scratch>/addlib/nimcache \
##         <this-file>
##
## ``--noMain`` is the load-bearing flag for the cross-language case: a
## default Nim compile emits ``int main(int argc, ...)`` which would
## collide with the C++ binary's own ``main()`` at link time.
## ``--noMain`` suppresses Nim's ``main()`` while preserving ``NimMain()``
## (the runtime-init entry point that the C++ binary calls before any
## Nim function).
##
## The resulting ``.o`` files are then archived via ``ar rcs
## libaddlib.a`` and threaded onto the C++ binary's link line as a
## trailing positional.
##
## Avoid the Nim ``string`` / ``seq`` runtime in cross-language exports —
## those types require Nim-side memory management. Plain ``cint`` /
## ``cstring`` parameters round-trip safely through the C ABI.

proc nimAdd*(a, b: cint): cint {.exportc: "nimAdd", cdecl.} =
  ## Add two C ints and return the sum. The leading ``*`` exports the
  ## symbol at the Nim level (so other Nim modules could also use it);
  ## the ``{.exportc.}`` annotation is what makes it visible to C/C++
  ## callers. The two are orthogonal — the C ABI export survives even
  ## if the Nim-level export is dropped.
  a + b
