## M60 Mode 2 Crystal fixture — shards-managed ``hello-binary``.
##
## Demonstrates the Three-Mode-Convention-System §"Mode 2" shape for
## Crystal per the M60 section of
## ``reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org``
## (the minimal subset the M60 ``crystal`` convention implements in
## shards-managed mode):
##
##   * ``shard.yml`` at the workspace root declares the shards
##     manifest (name, version, target).
##   * ``shard.lock`` (HARD precondition) freezes the dependency
##     resolution for the offline-mode build guarantee — mirrors M42
##     csharp-dotnet's ``packages.lock.json``, M55 haskell-cabal's
##     ``cabal.project.freeze``, M56 ruby-bundler's ``Gemfile.lock``,
##     M57 php-composer's ``composer.lock`` strict-precondition pattern.
##   * Single executable ``hello`` whose entry source lives at
##     ``src/hello.cr`` (the canonical Crystal layout produced by
##     ``shards init`` / ``crystal init``).
##   * No external Shards dependencies — the fixture depends only on
##     Crystal's stdlib, which is always available. Mode 2's
##     ``shards install`` step is a no-op for this fixture but the
##     convention still emits the chained install → build action
##     graph because the real-world Mode 2 case routes external
##     dependencies through ``shards install`` before the
##     ``crystal build``.
##
## Build via::
##
##     repro build <this-dir>#default --tool-provisioning=path
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``crystal`` on PATH (Crystal compiler — install via
##     ``scoop install crystal`` on Windows; ``brew install crystal``
##     on macOS; ``apt install crystal`` on Debian / Ubuntu).
##   * ``shards`` on PATH (shards is bundled with the Crystal
##     distribution so no separate install step is needed).
##
## **Honest-scope note** (M60): the Crystal Windows port is preview-
## quality (signal handling / fork broken upstream) and env.ps1 doesn't
## yet provision Crystal — the dev-shell hosts without Crystal SKIP
## this fixture cleanly via the M9 harness's per-language probe. A
## follow-up provisioning milestone covers ``windows/ensure-crystal.ps1``.
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M60.

import repro_project_dsl

package crystal_shards_hello_binary_example:
  uses:
    "crystal >=1.0"
    "shards"

  executable hello:
    discard
