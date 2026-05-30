--  adacalc/src/main.adb — M58 Mode 3 cross-language Ada executable
--  that calls into a sibling C static library declared in the same
--  workspace ``repro.nim``.
--
--  The cross-language wiring the convention performs:
--
--    1. The C ``mathlib`` library is compiled with ``gcc -c``
--       per-source and archived via ``ar rcs`` into
--       ``.repro/build/mathlib/libmathlib.a``.
--    2. This Ada file is compiled + bound + linked by a single
--       ``gnatmake`` invocation. The archive lands after the
--       ``-largs`` separator (linker pass-through) so gnatmake's
--       underlying linker resolves the cross-language symbol.
--    3. The link sequencing pulls the C archive build strictly before
--       the Ada link.
--
--  The stdout proves the cross-language round-trip:
--      Ada -> C c_add() -> back to Ada.

with Ada.Text_IO;

procedure Main is
   function C_Add (A : Integer; B : Integer) return Integer;
   pragma Import (C, C_Add, "c_add");

   Result : Integer;

   function Image_Trim (X : Integer) return String is
      Raw : constant String := Integer'Image (X);
   begin
      if Raw'Length > 0 and then Raw (Raw'First) = ' ' then
         return Raw (Raw'First + 1 .. Raw'Last);
      else
         return Raw;
      end if;
   end Image_Trim;
begin
   Result := C_Add (2, 3);
   Ada.Text_IO.Put_Line
     ("ada says: mathlib added 2+3 = " & Image_Trim (Result));
   Ada.Text_IO.Put_Line ("hello from ada-uses-cpp-lib");
end Main;
