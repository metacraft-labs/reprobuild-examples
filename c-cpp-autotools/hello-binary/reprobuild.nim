## Minimal C executable built via autoconf + automake (repo-checkout
## shape — no committed ``configure`` script; ``autoreconf -fi``
## generates it).
##
## The M17 autotools convention recognises this layout and emits two
## reprobuild actions:
##   1. A ``sh -c "set -e; autoreconf -fi; ./configure ..."`` action
##      that regenerates the GNU build machinery from ``configure.ac``
##      + ``Makefile.am`` and runs ``./configure --disable-dependency-
##      tracking --disable-maintainer-mode``. Produces ``Makefile`` +
##      ``config.h``.
##   2. A ``make`` action that delegates to the generated Makefile to
##      compile + link ``hello`` (or ``hello.exe`` on Windows).
##
## **Toolchain requirements**: ``autoreconf`` (autoconf + automake),
## ``sh``, ``make`` (or ``mingw32-make`` on Windows), and a C compiler.
## On Windows hosts without MSYS2 autoconf/automake installed, the M9
## harness SKIPs this fixture cleanly. The released-tarball shape (with
## ``configure`` committed) is supported by the convention but the
## current fixture exercises the repo-checkout path.
##
## See ../../../reprobuild-specs/Language-Conventions/C-Cpp-Autotools.md
## and Standard-Provider-Implementation.milestones.org §M17.

import repro_project_dsl

package c_cpp_autotools_hello_binary_example:
  uses:
    "gcc >=11"
    "autoconf >=2.71"
    "automake >=1.16"
    "make >=4"

  executable hello:
    discard
