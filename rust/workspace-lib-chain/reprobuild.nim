## Rust workspace lib→lib chain example. Three crates under one
## virtual manifest:
##
##   crate_a (lib) — leaf, no workspace deps.
##   crate_b (lib) — depends on crate_a via a path dep; re-exports
##                   ``greet`` after annotating the source.
##   crate_c (bin) — depends on crate_b via a path dep; prints the
##                   greeting.
##
## No `build:` block. The M23 Rust convention enumerates members via
## ``cargo metadata``, topologically sorts the lib-flavoured targets,
## and emits Pass A in dep order so crate_b's metadata + link passes
## carry ``--extern crate_a=...`` flags pointing at crate_a's
## already-emitted rmeta + rlib. Pass B then emits crate_c with
## ``--extern crate_b=...`` (only direct deps — rustc resolves the
## transitive crate_a edge from crate_b's metadata).
##
## See ../../../reprobuild-specs/Language-Conventions/Rust.md
## §"Workspace" and the M23 milestone in
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org.

import repro_project_dsl

package rust_workspace_lib_chain_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable crate_c:
    discard
