## M35 reverse-direction cross-language pilot — Nim library exposing a
## single C-callable function to a sibling Rust executable in the same
## workspace. Mirror of the M34 ``mixed/cpp-uses-nim-lib`` fixture's
## ``addlib/src/addlib.nim``; the only difference is the language of
## the consumer (Rust here vs C++ there).
##
## The ``{.exportc, cdecl.}`` pragma pair tells Nim to emit:
##   * a C symbol named exactly ``nimAdd`` (no Nim name mangling), with
##   * cdecl calling convention so a hand-written Rust extern decl
##     resolves to the same ABI.
##
## The convention compiles this module with::
##
##     nim c --compileOnly --noLinking --noMain \
##         --mm:orc -d:release --nimcache:<scratch>/nimaddlib/nimcache \
##         <this-file>
##
## ``--noMain`` is the load-bearing flag for the cross-language case: a
## default Nim compile emits ``int main(int argc, ...)`` which would
## collide with the Rust binary's own entry point at link time.
## ``--noMain`` suppresses Nim's ``main()`` while preserving ``NimMain()``
## (the runtime-init entry point that the Rust binary calls before any
## Nim function).
##
## The resulting ``.o`` files are then archived via ``ar rcs
## libnimaddlib.a`` and threaded onto the Rust binary's rustc link via
## ``-L native=<dir>`` + ``-l static=nimaddlib``.
##
## Avoid the Nim ``string`` / ``seq`` runtime in cross-language exports —
## those types require Nim-side memory management. Plain ``cint`` /
## ``cstring`` parameters round-trip safely through the C ABI.

proc nimAdd*(a, b: cint): cint {.exportc: "nimAdd", cdecl.} =
  ## Add two C ints and return the sum. The leading ``*`` exports the
  ## symbol at the Nim level (so other Nim modules could also use it);
  ## the ``{.exportc.}`` annotation is what makes it visible to Rust /
  ## C callers. The two are orthogonal — the C ABI export survives even
  ## if the Nim-level export is dropped.
  a + b
