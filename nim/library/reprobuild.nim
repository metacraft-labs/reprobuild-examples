## Minimal Nim library example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from Nim's
## conventions (.nimble file + src/<pkg>.nim umbrella module).
##
## See ../../../reprobuild-specs/Language-Conventions/Nim.md.

import repro_project_dsl

package nimLibraryExample:
  uses:
    "nim >=2.2 <3.0"

  library nim_library_example
