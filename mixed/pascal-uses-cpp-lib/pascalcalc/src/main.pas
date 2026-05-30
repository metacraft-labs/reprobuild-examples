{ pascalcalc/src/main.pas — M59 Mode 3 cross-language Pascal executable
  that calls into a sibling C static library declared in the same
  workspace ``repro.nim``.

  The cross-language wiring the convention performs:

    1. The C ``mathlib`` library is compiled with ``gcc -c``
       per-source and archived via ``ar rcs`` into
       ``.repro/build/mathlib/libmathlib.a``.
    2. This Pascal file is compiled + linked by a single ``fpc``
       invocation. The archive lands via ``-Fl<dir>`` (linker search
       path) + ``-k<archive>`` (linker pass-through) so fpc's
       underlying linker resolves the cross-language symbol.
    3. The link sequencing pulls the C archive build strictly before
       the Pascal link.

  The stdout proves the cross-language round-trip:
      Pascal -> C c_add() -> back to Pascal. }

program Main;

{$mode objfpc}

function CAdd(A, B: LongInt): LongInt; cdecl;
  external name 'c_add';

var
  Result: LongInt;
begin
  Result := CAdd(2, 3);
  Writeln('pascal says: mathlib added 2+3 = ', Result);
  Writeln('hello from pascal-uses-cpp-lib');
end.
