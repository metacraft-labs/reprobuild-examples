## Nim multi-binary example. Declares two executables that share the
## same .nimble package and srcDir.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider`. The Nim convention exercises the
## shared-per-`.c` cache reuse across two binaries (see
## ../../../reprobuild-specs/Language-Conventions/Nim.md §"Mode A").

import repro_project_dsl

package nimMultiBinaryExample:
  uses:
    "nim >=2.2 <3.0"

  executable alpha:
    discard

  executable beta:
    discard
