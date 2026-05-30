## M60 Mode 3 Crystal fixture — pure-source ``hello-binary``.
##
## Demonstrates the Three-Mode-Convention-System §"Mode 3" shape for
## Crystal per the M60 section of
## ``reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org``
## (the minimal subset the M60 ``crystal`` convention implements in
## pure-source mode):
##
##   * NO ``shard.yml`` at the workspace root (the Mode 2 shards
##     dispatch path's territory).
##   * Single executable ``hello`` whose entry source lives at
##     ``src/hello.cr`` (Crystal's canonical executable layout).
##   * No dependency-manager step — the convention emits a single
##     ``crystal build src/hello.cr -o <out> --release --no-debug``
##     action directly.
##
## **Honest-scope cut** (M60): Mode 3 emits ONE ``crystal build``
## action per executable. Per-source DAG (``-c``-style compile +
## link) is NOT possible because Crystal performs whole-program
## analysis for type inference — the compiler requires the entire
## compilation unit at once. Track as a future milestone if Crystal
## grows a ``-c``-equivalent flag.
##
## Build via::
##
##     repro build <this-dir>#default --tool-provisioning=path
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``crystal`` on PATH (Crystal compiler). Mode 3 does NOT require
##     ``shards`` on PATH — the convention dispatches to Mode 3 when
##     there's no ``shard.yml``.
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M60.

import repro_project_dsl

package crystal_mode3_hello_binary_example:
  uses:
    "crystal >=1.0"

  executable hello:
    discard
