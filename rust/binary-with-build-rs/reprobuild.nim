## Rust binary example carrying a real ``build.rs`` script.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider`. The Rust convention's `recognize` claims
## the project, and its `emitFragment` detects `build.rs` at the root
## and routes through the Mode B crude fallback (`cargo build`
## delegated under FS-snoop monitoring).
##
## Counterpart of `../binary/` for the M6 Mode B path. See
## `../../../reprobuild-specs/Language-Conventions/Rust.md` §"Mode B"
## and `../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org`
## §M6.

import repro_project_dsl

package rust_binary_with_build_rs_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable rust_binary_with_build_rs_example:
    discard
