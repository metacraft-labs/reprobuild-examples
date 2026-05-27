## Minimal C executable built via autoconf + automake (repo-checkout
## shape — no committed ``configure`` script; ``autoreconf -fi``
## generates it).
##
## No `build:` block. NOTE: the C/C++-autotools convention's Mode A is
## not yet implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The
## conventional source tree (configure.ac + Makefile.am + sources) is
## in place ready for the convention to land. See
## ../../../reprobuild-specs/Language-Conventions/C-Cpp-Autotools.md.

import repro_project_dsl

package c_cpp_autotools_hello_binary_example:
  uses:
    "gcc >=11"
    "autoconf >=2.71"
    "automake >=1.16"
    "make >=4"

  executable hello:
    discard
