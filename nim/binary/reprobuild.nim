## Minimal Nim binary example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from Nim's
## conventions (.nimble file + src/<binname>.nim entry).
##
## See ../../../reprobuild-specs/Language-Conventions/Nim.md.

import repro_project_dsl

package nimBinaryExample:
  uses:
    "nim >=2.2 <3.0"

  executable nimBinaryExample
