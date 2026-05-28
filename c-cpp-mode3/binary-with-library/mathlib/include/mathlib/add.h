#ifndef MATHLIB_ADD_H
#define MATHLIB_ADD_H

/* Public header for the mathlib package's Mode 3 C pilot fixture.
   Calls into add() are linked at the executable's link step against
   libmathlib.a via the depends_on edge declared in the workspace's
   repro.nim. */

int add(int a, int b);

#endif /* MATHLIB_ADD_H */
