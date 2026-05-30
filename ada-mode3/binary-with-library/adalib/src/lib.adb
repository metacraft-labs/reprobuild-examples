--  adalib/src/lib.adb — M58 Mode 3 Ada library body for
--  ``binary-with-library``.
--
--  Implements the pure ``Ada_Add`` routine declared in ``lib.ads``.
--  The ada-direct convention compiles this body with:
--
--      gcc -c -O2 -gnatp -I adalib/src \
--          -o <root>/.repro/build/adalib/obj/lib.o \
--          adalib/src/lib.adb
--
--  The resulting ``.o`` is then packaged via ``ar rcs`` into
--  ``.repro/build/adalib/libadalib.a`` — the canonical archive schema
--  shared with c-cpp-direct, Rust's staticlib path, Fortran's archive
--  path, Nim's archive output, Zig's archive, D's archive.

package body Lib is
   function Ada_Add (A : Integer; B : Integer) return Integer is
   begin
      return A + B;
   end Ada_Add;
end Lib;
