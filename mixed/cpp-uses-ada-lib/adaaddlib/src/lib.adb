--  adaaddlib/src/lib.adb — M58 reverse-direction cross-language pilot.
--  Implementation body for ``lib.ads``. Pure function — no Ada
--  runtime / no elaboration required, so the C++ consumer can link
--  the archive directly without ``-lgnat`` or ``adainit()``/``adafinal()``
--  bracket calls.
--
--  The ada-direct convention compiles this body via::
--
--      gcc -c -O2 -gnatp -I adaaddlib/src \
--          -o .repro/build/adaaddlib/obj/lib.o \
--          adaaddlib/src/lib.adb
--
--  And bundles the .o into ``libadaaddlib.a`` via ``ar rcs``.

package body Lib is
   function Ada_Add (A : Integer; B : Integer) return Integer is
   begin
      return A + B;
   end Ada_Add;
end Lib;
