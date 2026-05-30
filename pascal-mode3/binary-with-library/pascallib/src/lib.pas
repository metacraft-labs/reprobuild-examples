{ pascallib/src/lib.pas — M59 Mode 3 Pascal library unit for
  ``binary-with-library``.

  Implements the pure ``pascal_add`` routine. The ``public name``
  directive forces a C-ABI symbol named exactly ``pascal_add`` so the
  consumer (a sibling Pascal executable AND, in the reverse-direction
  cross-language fixture, a C++ binary) resolves the symbol via a
  plain extern declaration without Pascal name mangling.

  The pascal-direct convention compiles this body with::

      fpc -O2 -CX -Fu pascallib/src \
          -FU <root>/.repro/build/pascallib/obj \
          -FE <root>/.repro/build/pascallib/obj \
          pascallib/src/lib.pas

  The resulting ``lib.o`` is then packaged via ``ar rcs`` into
  ``.repro/build/pascallib/libpascallib.a`` — the canonical archive
  schema shared with c-cpp-direct, Rust's staticlib path, Fortran's
  archive path, Nim's archive output, Zig's archive, D's archive,
  Ada's archive.

  M59 honest-scope cut: this routine performs no I/O, no exception
  raising, and no Pascal RTL bootstrap calls — so no FPC runtime
  linking (``-lfprt -lc``) is required at the consumer side. }

unit Lib;

interface

function PascalAdd(A, B: LongInt): LongInt; cdecl;

implementation

function PascalAdd(A, B: LongInt): LongInt; cdecl;
begin
  PascalAdd := A + B;
end;

exports
  PascalAdd name 'pascal_add';

end.
