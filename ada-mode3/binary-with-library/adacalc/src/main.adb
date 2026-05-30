--  adacalc/src/main.adb — M58 Mode 3 Ada executable that calls into
--  the sibling Ada static library declared in the same workspace
--  ``repro.nim``.
--
--  The cross-package wiring the ada-direct convention performs:
--
--    1. The Ada ``adalib`` library is compiled via ``gcc -c -gnatp``
--       per-source and archived via ``ar rcs`` into
--       ``.repro/build/adalib/libadalib.a``.
--    2. This file is compiled + bound + linked by a single
--       ``gnatmake`` invocation. The upstream archive lands on the
--       link line after the ``-largs`` separator (gnatmake's linker
--       pass-through) so the ``ada_add`` C-ABI symbol resolves at
--       link time.
--    3. The link sequencing pulls the library build strictly before
--       the executable link.
--
--  The stdout proves the cross-package round-trip:
--      adacalc -> adalib Ada_Add() -> back to adacalc.

with Ada.Text_IO;
with Lib;

procedure Main is
   Result : Integer;
   --  Image_Trim strips the leading space that Integer'Image always
   --  emits for non-negative values so the harness greeting comparison
   --  matches the exact spec string "adalib added 2+3 = 5".
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
   Result := Lib.Ada_Add (2, 3);
   Ada.Text_IO.Put_Line
     ("hello from ada-mode3-binary-with-library, adalib added 2+3 = " &
      Image_Trim (Result));
end Main;
