## Minimal Erlang app-style executable built via the stock ``rebar3``
## driver (M61 Tier 2b ``erlang-rebar3`` standard-provider convention).
##
## **Seventh Phase 2 fixture** — added in M61 immediately after M60
## crystal. Routes through the lightweight standard-provider
## convention added in M61, which shells out to a stock ``rebar3``
## driver for a single ``rebar3 escriptize`` invocation (which
## transitively runs ``rebar3 compile``). The build produces a
## self-contained escript binary at
## ``_build/default/bin/hello`` (plus the sibling
## ``_build/default/bin/hello.cmd`` launcher on Windows). The
## convention additionally emits an ``fs.writeText`` wrapper at
## ``<root>/.repro/build/hello/hello.cmd`` (Windows) that delegates to
## the rebar3-produced ``.cmd`` so callers see the canonical
## ``<root>/.repro/build/<name>/<name>[.cmd]`` launcher path shared
## with every other Phase 2 Tier 2b convention (M55-M57 / M60).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``erl`` on PATH (the Erlang runtime — ``erl.exe`` on Windows).
##     M61 honest-scope cut: env.ps1 doesn't yet provision Erlang
##     dedicatedly; the canonical Windows install is
##     ``scoop install erlang``.
##   * ``rebar3`` on PATH (the rebar3 build tool — distinct from
##     Erlang itself). The canonical Windows install is
##     ``scoop install rebar3``.
##
## **No external Hex dependencies.** The ``rebar.config`` declares
## an empty ``{deps, []}`` list and the ``rebar.lock`` is the minimal
## ``[].`` Erlang term (the canonical empty lockfile rebar3 writes for
## zero-deps projects). The build is fully offline-mode-compatible
## without any Hex-cache warm step — the M61 offline-mode contract is
## trivially satisfied because no dependency resolution is needed.
##
## **Provisioning note**: on a development host that doesn't ship
## Erlang+rebar3 (the M61 default on Windows — env.ps1 doesn't bundle
## either), the canonical install paths on Windows are:
##   * ``scoop install erlang`` (the ``main`` bucket carries
##     Erlang/OTP 27.x+ as of mid-2025).
##   * ``scoop install rebar3`` (the ``main`` bucket carries
##     rebar3 3.27.x+ as of the M61 milestone).
## Both shims land under ``%USERPROFILE%\scoop\shims\`` and resolve via
## PATH. A follow-up provisioning milestone covers the dedicated
## ``windows/ensure-erlang.ps1`` + ``windows/ensure-rebar3.ps1`` modules
## (deferred per the M61 honest-scope cut).
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M61.

import repro_project_dsl

package erlang_rebar3_hello_binary_example:
  uses:
    "erlang"
    "rebar3"

  executable hello:
    discard
