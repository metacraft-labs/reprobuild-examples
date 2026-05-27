## Rust library example with integration tests under ``tests/``.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider`. The Rust convention exercises per-test-
## crate compile actions (see
## ../../../reprobuild-specs/Language-Conventions/Rust.md §"Test
## commands").

import repro_project_dsl

package rust_library_with_tests_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  library rust_library_with_tests_example
