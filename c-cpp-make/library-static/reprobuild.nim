## Minimal C static library built via a hand-written Makefile.
##
## No `build:` block. The M17 C/C++-make convention recognises this
## layout and emits per-source ``gcc -c`` + ``ar rcs`` actions directly,
## producing ``.repro/build/greet/libgreet.a``. The Makefile sits
## alongside as a documentation artifact.
##
## The DSL currently has no ``library <n> kind: static`` syntax — the
## kind is documented in the convention spec
## (../../../reprobuild-specs/Language-Conventions/C-Cpp-Make.md
## §"Project member types") and the M17 convention defaults plain
## ``library greet`` to ``kind: static``; shared/both is a follow-up
## once the DSL threads ``kind:`` through to C library members.
##
## See Standard-Provider-Implementation.milestones.org §M17.

import repro_project_dsl

package c_cpp_make_library_static_example:
  uses:
    "gcc >=11"
    "make >=4"

  library greet
