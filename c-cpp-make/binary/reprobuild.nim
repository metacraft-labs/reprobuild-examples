## Minimal C executable built via a hand-written Makefile.
##
## No `build:` block. NOTE: the C/C++-make convention's Mode A is not
## yet implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The
## conventional source tree + Makefile are in place ready for the
## convention to land. See
## ../../../reprobuild-specs/Language-Conventions/C-Cpp-Make.md.

import repro_project_dsl

package c_cpp_make_binary_example:
  uses:
    "gcc >=11"
    "make >=4"

  executable hello:
    discard
