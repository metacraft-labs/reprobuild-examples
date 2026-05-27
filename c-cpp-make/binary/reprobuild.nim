## Minimal C executable built via a hand-written Makefile.
##
## No `build:` block. The M17 C/C++-make convention recognises this
## layout and emits per-source ``gcc -c`` + ``gcc -o`` actions directly
## (Option B layout-based heuristic rather than ``make --print-data-base``
## rule lifting). The Makefile sits alongside as a documentation
## artifact — the convention's heuristic compiles ``src/main.c`` to
## ``.repro/build/hello/hello[.exe]`` matching what the Makefile would
## produce.
##
## See ../../../reprobuild-specs/Language-Conventions/C-Cpp-Make.md and
## Standard-Provider-Implementation.milestones.org §M17.

import repro_project_dsl

package c_cpp_make_binary_example:
  uses:
    "gcc >=11"
    "make >=4"

  executable hello:
    discard
