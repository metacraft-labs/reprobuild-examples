## Minimal Elixir mix-style executable built via the stock ``mix``
## driver (M62 Tier 2b ``elixir-mix`` standard-provider convention).
##
## **Campaign-closing fixture (M49-M62)** — added in M62 immediately
## after M61 erlang-rebar3. Routes through the lightweight standard-
## provider convention added in M62, which shells out to a stock
## ``mix`` driver for a single ``mix escript.build`` invocation
## (which transitively runs ``mix deps.get`` + ``mix compile``). The
## build produces a self-contained escript binary at
## ``<projectRoot>/hello``. The convention additionally emits an
## ``fs.writeText`` wrapper at
## ``<root>/.repro/build/hello/hello.cmd`` (Windows) that invokes
## ``escript`` against the mix-produced escript so callers see the
## canonical ``<root>/.repro/build/<name>/<name>[.cmd]`` launcher
## path shared with every other Phase 2 Tier 2b convention (M55-M57
## / M60 / M61).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``elixir`` on PATH (the Elixir compiler — ``elixir.bat`` on
##     Windows). M62 honest-scope cut: env.ps1 doesn't yet provision
##     Elixir dedicatedly; the canonical Windows install is
##     ``scoop install elixir``.
##   * ``mix`` on PATH (the Elixir build tool — bundled with the
##     Elixir distribution; ``mix.bat`` on Windows).
##
## **No external Hex dependencies.** The ``mix.exs`` declares an
## empty ``deps: []`` list and the ``mix.lock`` is the minimal
## ``%{}`` Elixir map (the canonical empty lockfile mix writes for
## zero-deps projects). The build is fully offline-mode-compatible
## without any Hex-cache warm step — the M62 offline-mode contract
## is trivially satisfied because no dependency resolution is needed.
##
## **Provisioning note**: on a development host that doesn't ship
## Elixir+mix (the M62 default on Windows — env.ps1 doesn't bundle
## either), the canonical install paths on Windows are:
##   * ``scoop install elixir`` (the ``main`` bucket carries Elixir
##     1.17.x+ as of mid-2025; pulls in Erlang/OTP transitively).
##     ``elixir.bat`` + ``mix.bat`` land under
##     ``%USERPROFILE%\scoop\shims\`` and resolve via PATH.
## A follow-up provisioning milestone covers the dedicated
## ``windows/ensure-elixir.ps1`` module (deferred per the M62
## honest-scope cut).
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M62.

import repro_project_dsl

package elixir_mix_hello_binary_example:
  uses:
    "elixir"
    "mix"

  executable hello:
    discard
