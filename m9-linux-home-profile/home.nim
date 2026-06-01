## M9 reference home profile — Linux subset.
##
## This profile is the Linux/WSL counterpart of the M71 reference
## profile (``reprobuild-examples/m71-home-profile-walkthrough/home.nim``).
## It lists the glibc-agnostic subset of M71's tools — the Phase-2
## partials whose upstream tarballs do not make distro-specific
## glibc-2.31+ assumptions (ghc + cabal + crystal target glibc 2.17
## per their upstream Linux release notes) — plus the cross-language
## baseline tooling.
##
## This profile is consumed by two callers:
##
##   1. ``scripts/verify-m9-linux-home-profile-fixtures.sh`` — the M9
##      WSL validation harness. Copies this file into a sandboxed
##      ``REPRO_HOME_PROFILE_DIR`` inside a throwaway WSL distro, runs
##      ``repro home apply``, then runs every Linux validate script
##      against the activated PATH. Gated behind ``REPRO_LIVE=1`` per
##      the spec's verification table.
##
##   2. The hermetic resolver gate
##      ``tests/e2e/m9/t_e2e_m9_linux_phase2_partials_resolve.nim`` —
##      asserts the chain walks the M65
##      ``LinuxDefaultChain = @[cakNix, cakBuiltin, cakPath]`` order
##      and classifies each package by its terminating outcome.
##
## **Linux catalog reality (per the M9 outstanding-task list):** as of
## the M9 landing, NO ``packages/<tool>.nim`` carries a ``poLinux``
## platform slice — every M67/M68 harvest pulled from Scoop, which is
## Windows-only. So on Linux ``cakBuiltin`` returns
## ``csoSchemaError (brePlatformNotSupported)`` for every tool listed
## here; the chain falls through to ``cakPath``.
##
## The end-to-end LIVE flow that the harness's PASS-criteria require
## (cabal v2-build produces ``hello`` on Linux; crystal build produces
## ``hello`` on Linux) needs ONE of the following to happen first:
##
##   * A Linux harvester pass adds ``poLinux`` slices to each tool's
##     catalog (e.g. downloads.haskell.org publishes Linux ghc tarballs
##     and crystal-lang/crystal ships a ``linux-x86_64.tar.gz`` asset).
##     The M67/M68 harvester machinery already supports multiple
##     platform slices per ``VersionedProvisioning``; the work is
##     mechanical-but-deferred. Tracked as a follow-up campaign.
##
##   * OR cakNix becomes the realize path on Linux (the M65 chain
##     places cakNix FIRST on Linux; the resolver-side stub returns
##     ``csoAdapterUnavailable`` today, but the M21 realize-side branch
##     exists and can be wired through. That is parallel-agent
##     M83-territory and OUT OF SCOPE for M9.
##
## Until one of the above lands, the M9 LIVE harness on a vanilla WSL
## host SKIPs every fixture cleanly (no realize path → tool not on PATH
## → validate-*.sh exits with the SKIP marker). M9 ships the harness +
## the resolver-level gate; the PASS criteria graduate when the Linux
## catalog half lands.
##
## DEFERRED tools (catalog entry present, no Linux URL in the slice
## set — pending the Linux harvester pass): ghc / cabal / crystal +
## every other M67/M68 entry.

# nim-check: skip
#
# Built via the M83 Phase A `repro/profile` macro library so
# `repro home apply` takes the compile-then-apply path end-to-end.
# This is the M9 reference profile — see the file-level comment above.

import repro_profile

profile "m9-linux-reference":
  activity dev:
    # Baseline cross-language toolchain — covers C/Make/CMake/Ninja
    # fixtures, the Nim self-build, and the gh/just operator tooling.
    # Every entry here resolves via cakBuiltin's catalog registry but
    # picks up brePlatformNotSupported on Linux until the Linux
    # harvester pass lands. The chain falls through to cakPath; if the
    # operator has the tool on PATH (e.g. via apt/yum/pacman, Nix, or
    # the WSL distro's bootstrap layer) the resolver records a cakPath
    # hit and the LIVE harness picks up the existing PATH binary.
    package(cmake, "4.3.3")
    package(ninja, "1.13.2")
    package(git, "2.54.0")
    package(gh, "2.93.0")
    package(just, "1.51.0")
    package(nim, "2.2.10")

  activity functional:
    # M55 haskell-cabal graduation. ghc + cabal are CLEAN in the M67
    # catalog for Windows; awaiting the Linux harvest pass for poLinux
    # slices. The fixture itself is portable — only the catalog slice
    # set needs the Linux URLs.
    package(ghc, "9.12.1")
    package(cabal, "3.16.1.0")

  activity polyglot:
    # M60 crystal. Crystal ships a generic Linux tarball
    # (``crystal-<ver>-linux-x86_64.tar.gz``) targeting glibc 2.17 per
    # the upstream release notes — a future Linux harvester pass will
    # add the poLinux slice to packages/crystal.nim. shards ships
    # bundled with the Crystal tarball on Linux as on Windows.
    package(crystal, "1.20.2")

  hosts:
    # The M9 harness sets ``REPRO_HOST=m9-test-host`` before invoking
    # ``repro home apply`` so the activation lifts every activity. End
    # users replace this with their actual hostname (or add an entry
    # per host) once they're tracking the realized footprint.
    "m9-test-host": [dev, functional, polyglot]
