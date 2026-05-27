## Rust workspace example. Two crates (a library + a binary that
## depends on the library) under one virtual manifest.
##
## No `build:` block. Post-M13 the Rust convention reads
## ``cargo metadata`` from the workspace root, enumerates members, and
## emits per-target compile/link actions with ``--extern <name>=<rmeta>``
## edges across path-dep boundaries. The ``executable crate_b`` member
## below names the user-facing target; the convention picks up crate_a
## as a workspace dependency automatically and emits its compile/link
## pair too. See ../../../reprobuild-specs/Language-Conventions/Rust.md
## §"Workspace" and the M13 milestone in
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org.

import repro_project_dsl

package rust_workspace_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable crate_b:
    discard
