## Minimal C executable built via stock CMake (M38 Tier 2b
## ``c-cpp-cmake`` standard-provider convention).
##
## **Distinct from Tier 2c ``reprobuild-cmake``** (the forked CMake with
## the embedded ``cmGlobalReprobuildGenerator``). This fixture routes
## through the lightweight standard-provider convention added in M38,
## which shells out to a stock ``cmake`` binary for configure +
## per-member build. No try_compile probes; the action graph is coarse
## (one ``cmake -S ... -B ... -G ...`` configure action + one ``cmake
## --build ... --target hello`` per declared member). Users who need
## try_compile lifting select the Tier 2c provider explicitly.
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## all of these — the M9 harness SKIPs cleanly otherwise):
##   * ``cmake`` on PATH.
##   * a C compiler (``gcc`` or ``clang``) on PATH.
##   * EITHER ``ninja`` on PATH (Ninja generator — convention's first
##     preference), OR the platform's single-config make:
##     ``mingw32-make`` on Windows (MinGW Makefiles), ``make`` on POSIX
##     (Unix Makefiles).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M38.

import repro_project_dsl

package c_cpp_cmake_hello_binary_example:
  uses:
    "gcc >=11"
    "cmake >=3.20"

  executable hello:
    discard
