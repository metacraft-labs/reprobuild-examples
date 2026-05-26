## Minimal Rust binary example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from Cargo's
## conventions (Cargo.toml + src/main.rs).
##
## See ../../../reprobuild-specs/Language-Conventions/Rust.md.

import repro_project_dsl

package rustBinaryExample:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable rustBinaryExample
