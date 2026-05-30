--  adaaddlib/src/lib.ads — M58 reverse-direction cross-language pilot:
--  an Ada library exposing a single C-callable function to a sibling
--  C++ executable in the same workspace.
--
--  The ``pragma Export (C, ...)`` directive forces a C-ABI symbol
--  named exactly ``ada_add`` (no Ada name mangling), so the
--  resulting ``libadaaddlib.a`` static archive carries a directly-
--  linkable symbol that a hand-written C/C++ ``extern`` decl
--  resolves to.
--
--  The M58 honest-scope cut: this routine performs no I/O, no
--  exception raising, and no controlled-type / tagged-type ops — so
--  no GNAT runtime elaboration is required and no ``adainit()`` /
--  ``adafinal()`` bracket calls are needed at the C++ consumer side.

package Lib is
   function Ada_Add (A : Integer; B : Integer) return Integer;
   pragma Export (C, Ada_Add, "ada_add");
end Lib;
