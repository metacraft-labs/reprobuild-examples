## Minimal C static library built via a hand-written Makefile.
##
## No `build:` block. NOTE: the C/C++-make convention's Mode A is not
## yet implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The DSL
## currently has no ``library <n> kind: static`` syntax — the kind is
## documented in the convention spec
## (../../../reprobuild-specs/Language-Conventions/C-Cpp-Make.md
## §"Project member types") and will be modelled when the DSL grows
## the parameter. Until then the member is a plain ``library greet``.

import repro_project_dsl

package c_cpp_make_library_static_example:
  uses:
    "gcc >=11"
    "make >=4"

  library greet
