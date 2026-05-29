## Minimal C executable built via stock Meson (M39 Tier 2b
## ``c-cpp-meson`` standard-provider convention).
##
## **Sibling of the M38 ``c-cpp-cmake`` Tier 2b fixture.** This
## fixture routes through the lightweight standard-provider convention
## added in M39, which shells out to a stock ``meson`` binary for
## ``setup`` + per-member ``compile``. No introspection lift; the
## action graph is coarse (one ``meson setup ...`` configure action +
## one ``meson compile -C ... <target>`` per declared member).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## all of these — the M9 harness SKIPs cleanly otherwise):
##   * ``meson`` on PATH.
##   * ``ninja`` on PATH (Meson's default backend).
##   * a C compiler (``gcc`` or ``clang``) on PATH.
##
## **Provisioning note**: on a development host that doesn't ship
## meson, ``pip install meson`` provides a single-file Python entry
## point at ``<python>\Scripts\meson.exe`` (Windows) /
## ``<python>/bin/meson`` (POSIX). This was the M39 review-host
## provisioning path (Python 3.12 was already managed under
## ``D:/metacraft-dev-deps/python/3.12.10/``).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M39.

import repro_project_dsl

package c_cpp_meson_hello_binary_example:
  uses:
    "gcc >=11"
    "meson >=1.3"
    "ninja >=1.10"

  executable hello:
    discard
