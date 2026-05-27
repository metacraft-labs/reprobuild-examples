## Rust workspace example. Two crates (a library + a binary that
## depends on the library) under one virtual manifest.
##
## No `build:` block. NOTE: per the M4 spec the Rust convention's
## current ``recognize`` rejects ``[workspace]`` and falls through to
## the M6 crude mode (``cargo build``). M4+1 will exercise the Mode A
## per-crate path. See
## ../../../reprobuild-specs/Language-Conventions/Rust.md §"Workspace"
## and ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org
## §M4 outstanding tasks.

import repro_project_dsl

package rust_workspace_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable crate_b:
    discard
