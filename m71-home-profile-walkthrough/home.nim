## M71 reference home profile — the canonical "single home.nim that
## activates every M67/M68 catalog tool so every Mode 2 fixture passes
## end-to-end" example.
##
## This profile is consumed by two callers:
##
##   1. ``scripts/verify-m71-home-profile-fixtures.ps1`` — the M71
##      validation harness. Copies this file into a sandboxed
##      ``REPRO_HOME_PROFILE_DIR``, runs ``repro home apply``, then
##      runs every Mode 2 fixture against the activated PATH.
##
##   2. End users following ``docs/user-guide/home-profile-walkthrough.md``.
##      The file doubles as a reference example any operator can copy
##      into ``~/.config/repro/home/home.nim`` and trim to the activities
##      they care about.
##
## Activity layout follows the M69 / M70 convention:
##
##   * ``dev`` — every Phase-2 partial's toolchain (haskell, php, ada,
##     pascal, crystal) PLUS the cross-language baseline toolchains
##     (cmake / ninja / meson / git / gh / just / node / python3 / nim).
##   * ``jvm`` — JDK + Maven + Gradle (M40 / M41 fixtures + general JVM
##     work). Kept separate so a Python-only operator can enable just
##     ``dev`` without paying the 350 MB JDK footprint.
##   * ``functional`` — Haskell (ghc + cabal) and the BEAM ecosystem
##     (erlang + elixir). Separated because these are heavy and
##     specialized.
##   * ``polyglot`` — Swift + Zig + dotnet-sdk + Crystal — the
##     "language-of-the-week" cluster. Crystal sits here rather than
##     under ``dev`` because most operators don't need it.
##   * ``scripting`` — PHP + Composer + Ruby. The Phase-2 partials that
##     graduate via the catalog when their cakBuiltin realize paths land.
##
## Hosts: ``["*"]`` matches every host so the walkthrough works on any
## machine. Tighten to specific hostnames once you've audited the
## per-host disk footprint.
##
## DEFERRED tools (catalog entry present, realize-time gap per M69
## deferred-8 list): swift, gcc, git, meson, python3, composer, erlang,
## ruby. Including their package() lines is safe — ``repro home apply``
## resolves them via the catalog; the realize-time gap manifests as a
## structured "not yet implemented" error per package. Operators who
## need these tools today fall back to env.ps1's ensure-*.ps1 path
## until the cakBuiltin realize-time hooks land (separate milestone).
##
## NOT in the catalog (will not resolve): gnat / alire / fpc / dune /
## ocaml. Their Phase-2 fixtures continue to SKIP under M71's harness
## with a clear "no catalog entry" diagnostic. See M71's wrap-up table
## for the deferral chain.

# nim-check: skip
#
# Built via the M83 Phase A `repro/profile` macro library so
# `repro home apply` takes the compile-then-apply path end-to-end.
# This is the M71 reference profile — see the file-level comment above.

import repro_profile

profile "m71-reference":
  activity dev:
    # Baseline cross-language toolchain — covers C/C++/Make-CMake-Meson
    # fixtures, the Nim self-build, and the JS/TS fixtures that need a
    # Node runtime.
    package(cmake, "4.3.3")
    package(ninja, "1.13.2")
    package(meson, "1.11.0")
    package(git, "2.54.0")
    package(gh, "2.93.0")
    package(just, "1.51.0")
    package(node, "24.16.0")
    package(python3, "3.14.5")
    package(nim, "2.2.10")
    package(gcc, "15.2.0")

  activity jvm:
    # M40 java-maven + M41 kotlin-gradle. jdk@21.0.5 is the only env.ps1
    # pin that migrates cleanly per M70 (see M70's deviation note).
    package(jdk, "21.0.5")
    package(maven, "3.9.16")
    package(gradle, "9.5.1")

  activity functional:
    # M55 haskell-cabal graduation. ghc + cabal are CLEAN in the M67
    # catalog — both realize end-to-end via cakBuiltin.
    package(ghc, "9.12.1")
    package(cabal, "3.16.1.0")
    # BEAM: M61 erlang-rebar3 + M62 elixir-mix. erlang is in M69's
    # deferred-8 list (rebar3 bundling gap); elixir realizes cleanly
    # but bootstrapping it without erlang on PATH is a no-op.
    package(erlang, "28.5")
    package(elixir, "1.19.5")

  activity polyglot:
    # M43 swift-swiftpm (swift is M69-deferred — VS Build Tools env
    # gap), M44 zig-mode3, M42 csharp-dotnet, M60 crystal.
    package(swift, "6.3.1")
    package(zig, "0.16.0")
    package("dotnet-sdk", "10.0.300")
    package(crystal, "1.20.2")

  activity scripting:
    # M57 php-composer (composer is M69-deferred — .phar wrapping gap),
    # M56 ruby-bundler (ruby is M69-deferred — bundler bootstrap gap).
    # php + ruby + composer have catalog entries; the M71 harness
    # asserts the resolver picks the right slice; whether realize
    # succeeds depends on the cakBuiltin realize-time gap closure.
    package(php, "8.5.6")
    package(composer, "2.10.0")
    package(ruby, "4.0.5-1")

  hosts:
    # The M71 harness sets ``REPRO_HOST=m71-test-host`` before invoking
    # ``repro home apply`` so the activation lifts every activity. End
    # users replace this with their actual hostname (or add an entry
    # per host) once they're tracking the realized footprint.
    "m71-test-host": [dev, jvm, functional, polyglot, scripting]
