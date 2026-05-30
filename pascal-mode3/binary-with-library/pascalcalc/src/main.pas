{ pascalcalc/src/main.pas — M59 Mode 3 Pascal executable that calls
  into the sibling Pascal static library declared in the same workspace
  ``repro.nim``.

  The cross-package wiring the pascal-direct convention performs:

    1. The Pascal ``pascallib`` library is compiled via ``fpc -O2 -CX``
       per-source and archived via ``ar rcs`` into
       ``.repro/build/pascallib/libpascallib.a``.
    2. This file is compiled + linked by a single ``fpc`` invocation.
       The upstream archive lands on the link line via ``-Fl<dir>``
       (linker search path) plus a trailing ``-k<archive>`` (fpc
       linker pass-through) so the ``pascal_add`` C-ABI symbol
       resolves at link time.
    3. The link sequencing pulls the library build strictly before
       the executable link.

  The stdout proves the cross-package round-trip:
      pascalcalc -> pascallib PascalAdd() -> back to pascalcalc. }

program Main;

{$mode objfpc}

function PascalAdd(A, B: LongInt): LongInt; cdecl;
  external name 'pascal_add';

var
  Result: LongInt;
begin
  Result := PascalAdd(2, 3);
  Writeln('hello from pascal-mode3-binary-with-library, ',
          'pascallib added 2+3 = ', Result);
end.
