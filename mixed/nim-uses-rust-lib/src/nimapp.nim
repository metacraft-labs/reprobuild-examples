## M35 forward-direction cross-language pilot — a Nim binary that calls
## into a Rust static archive built from the sibling ``addlib`` package
## in the same workspace.
##
## The cross-language wiring the convention performs:
##
##   1. The Rust ``addlib`` library is compiled with
##      ``--crate-type=staticlib`` ``-C panic=abort`` so ``libaddlib.a``
##      exports ``rust_add`` with the C ABI (no Rust name mangling) and
##      lands at the canonical archive path
##      ``.repro/build/addlib/libaddlib.a``.
##   2. The Nim three-phase pipeline runs as usual; no special flags on
##      Phase 1 (the Nim source doesn't include a C header — the
##      ``{.importc, cdecl.}`` pragma declares the ABI inline).
##   3. The terminal link action is ``gcc -o nimapp.exe <objs>
##      .repro/build/addlib/libaddlib.a <rust-runtime-libs>`` — the Rust
##      archive lands as a trailing positional so gcc/ld resolves
##      ``rust_add`` against it, followed by the platform-specific Rust
##      runtime libs (Windows MinGW: ``-lws2_32 -luserenv -ladvapi32
##      -lbcrypt -lntdll``; POSIX: ``-lpthread -ldl -lm``).
##
## The first echo line proves the cross-language round-trip succeeded:
## Nim -> Rust ``rust_add`` -> back to Nim.
##
## NOTE: the user does NOT need to write ``{.passL.}`` pragmas by hand
## — the convention threads ``libaddlib.a`` + the runtime libs based on
## the ``depends_on`` edge. The single ``{.importc, cdecl.}`` declaration
## is the only Nim-side ceremony the cross-language pattern needs.

proc rustAdd(a, b: cint): cint {.importc: "rust_add", cdecl.}

echo "nim says: rust added 2+3 = ", rustAdd(2.cint, 3.cint)
echo "hello from nim-uses-rust-lib"
