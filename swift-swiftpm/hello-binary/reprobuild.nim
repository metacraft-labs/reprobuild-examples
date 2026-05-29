## Minimal Swift executable built via stock ``swift build`` (M43
## Tier 2b ``swift-swiftpm`` standard-provider convention).
##
## **Fourth managed-ecosystem fixture** after the M40 Java/Maven, M41
## Kotlin/Gradle, and M42 C#/.NET siblings. This fixture routes through
## the lightweight standard-provider convention added in M43, which
## shells out to a stock ``swift`` driver for a single
## ``swift build -c release --quiet`` invocation. No introspection
## lift; the action graph is intentionally coarse (one ``swift build``
## action that produces ``.build/release/hello[.exe]``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## this — the M9 harness SKIPs cleanly otherwise):
##   * ``swift`` on PATH (the Swift toolchain ships ``swift`` as a single
##     driver binary that subcommands into ``swiftc`` for compilation
##     and into ``swift build`` for SwiftPM operations).
##
## **No external SwiftPM dependencies.** The Package.swift is
## self-contained: it declares only a single ``executableTarget`` that
## links against the Swift stdlib (always available). M43's offline-mode
## contract is trivially satisfied since no dependency resolution is
## needed.
##
## **Provisioning note**: on a development host that doesn't ship the
## Swift toolchain (the M43 default on Windows — Swift Windows isn't in
## the standard dev shell), the supported install paths are:
##   * swift.org Windows installer (``Swift-5.10-RELEASE-windows10.exe``)
##     unpacked into ``D:/metacraft-dev-deps/swift/5.10/``.
##   * Or: ``winget install Swift.Toolchain`` (uses the Microsoft Store
##     Swift install).
## env.ps1 should then prepend the Swift toolchain's ``usr\bin\`` to
## PATH (M47 covers the full provisioning catalog work).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M43.

import repro_project_dsl

package swift_swiftpm_hello_binary_example:
  uses:
    "swift >=5.5"

  executable hello:
    discard
