## Minimal Rust library example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from Cargo's
## conventions (Cargo.toml + src/lib.rs). Post-M13 the convention emits
## a metadata + link rustc pair producing ``librust_library_example-<hash>.rlib``.
##
## See ../../../reprobuild-specs/Language-Conventions/Rust.md.

import repro_project_dsl

package rust_library_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  library rust_library_example
