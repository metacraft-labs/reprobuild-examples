## Minimal Rust cdylib example. ``Cargo.toml`` declares
## ``crate-type = ["cdylib"]`` so cargo metadata reports the library
## target's ``kind`` array as ``["cdylib"]``. The M23 Rust convention
## picks that up via ``extractTargets`` → ``rtkCdylib`` and emits
## ``rustc --crate-type cdylib --emit=link,dep-info`` producing
## ``<name>.dll`` on Windows or ``lib<name>.so``/``.dylib`` on POSIX.
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which derives the build graph from Cargo's conventions. See
## ../../../reprobuild-specs/Language-Conventions/Rust.md and the M23
## milestone in
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org.

import repro_project_dsl

package rust_cdylib_example:
  uses:
    "rust >=1.80 <2.0"
    "cargo >=1.80 <2.0"

  library rust_cdylib_example
