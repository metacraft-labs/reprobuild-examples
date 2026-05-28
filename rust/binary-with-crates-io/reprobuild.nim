## Rust binary with a crates.io dependency. ``Cargo.toml`` lists a
## ``libc = "0.2"`` registry dep, exercising the M23 "external dep
## detection" path.
##
## The M23 Rust convention's ``loadProject`` walks each package's
## ``dependencies`` array, detects ``source != null`` (registry/git),
## and sets ``hasExternalDeps``. ``rustEmitFragment`` then routes the
## entire project through the Mode B crude fallback (``cargo build
## --release --offline``) rather than attempting per-rustc-action
## ``--extern`` threading against the registry cache. The fallback
## relies on ``CARGO_HOME`` being pre-populated; a future milestone
## graduates this to true Mode A with ``--extern`` paths derived from
## ``cargo fetch`` + ``cargo metadata --message-format=json``.
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which routes to its Mode B fallback for projects with external deps.
##
## See ../../../reprobuild-specs/Language-Conventions/Rust.md and the M23
## milestone in
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org.

import repro_project_dsl

package rust_binary_with_crates_io:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  executable rust_binary_with_crates_io:
    discard
