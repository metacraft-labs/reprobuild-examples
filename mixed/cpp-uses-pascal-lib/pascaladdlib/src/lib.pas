{ pascaladdlib/src/lib.pas — M59 reverse-direction cross-language
  pilot. Implementation body for a single C-callable function exposed
  to a sibling C++ executable. Pure function — no Pascal RTL bootstrap
  required, so the C++ consumer can link the archive directly without
  ``-lfprt -lc`` or explicit RTL init bracket calls.

  The pascal-direct convention compiles this body via::

      fpc -O2 -CX -Fu pascaladdlib/src \
          -FU .repro/build/pascaladdlib/obj \
          -FE .repro/build/pascaladdlib/obj \
          pascaladdlib/src/lib.pas

  And bundles the .o into ``libpascaladdlib.a`` via ``ar rcs``.

  The ``public name`` (``exports`` clause) directive forces a C-ABI
  symbol named exactly ``pascal_add`` so a hand-written C ``extern``
  declaration resolves directly against the archive.

  M59 honest-scope cut: this routine performs no I/O, no exception
  raising, and no managed-type ops — so no FPC RTL bootstrap is
  required at the C++ consumer side. }

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
