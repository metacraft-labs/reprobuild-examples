## Minimal Haskell executable built via stock ``cabal v2-build`` (M55
## Tier 2b ``haskell-cabal`` standard-provider convention).
##
## **First Phase 2 fixture** — opens the new-language-ecosystem sequence
## after the Phase 1 cluster (M40 Java/Maven, M41 Kotlin/Gradle, M42
## C#/.NET, M43 Swift/SwiftPM, M46 OCaml/Dune). This fixture routes
## through the lightweight standard-provider convention added in M55,
## which shells out to a stock ``cabal`` driver for a single
## ``cabal v2-build --offline -j1 --enable-relocatable`` invocation.
## No introspection lift; the action graph is intentionally coarse
## (one ``cabal v2-build`` action that produces
## ``dist-newstyle/build/<platform-tuple>/ghc-<ver>/hello-1.0/x/hello/
## build/hello/hello[.exe]``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``ghc`` on PATH (the Glasgow Haskell Compiler — ``ghc.exe`` on
##     Windows). M55 pins GHC 9.10.1.
##   * ``cabal`` on PATH (cabal-install — separate binary from GHC,
##     installed alongside it by GHCup). M55 pins cabal-install
##     3.12.1.0.
##
## **No external Hackage dependencies.** The ``hello.cabal`` manifest is
## self-contained: it depends only on ``base`` (the always-installed
## GHC standard library). M55's offline-mode contract is trivially
## satisfied since no dependency resolution is needed — ``cabal
## v2-build --offline`` succeeds even without a populated Hackage cache.
##
## **Provisioning note**: on a development host that doesn't ship GHC +
## cabal (the M55 default on Windows — the dev shell doesn't currently
## bundle Haskell), the canonical install path is GHCup
## (``https://www.haskell.org/ghcup/``). On Windows the documented
## bootstrap is the GHCup PowerShell script:
##
##     Set-ExecutionPolicy Bypass -Scope Process -Force
##     [System.Net.ServicePointManager]::SecurityProtocol = \
##       [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
##     & ([ScriptBlock]::Create(( \
##       Invoke-WebRequest \
##         https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 \
##         -UseBasicParsing).Content)) -Interactive $false -DisableCurl
##
## Then prepend ``%LOCALAPPDATA%\Programs\ghcup\bin\`` to PATH so
## ``ghc`` and ``cabal`` resolve via PATH. Total dev-shell footprint
## ~1.2 GB (GHC is the heaviest single toolchain in the catalog). A
## follow-up provisioning milestone covers the full catalog work.
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M55.

import repro_project_dsl

package haskell_cabal_hello_binary_example:
  uses:
    "haskell >=9.10"
    "cabal >=3.12"

  executable hello:
    discard
