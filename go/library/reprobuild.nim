## Minimal Go library example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from go's
## module conventions (go.mod + non-``main`` package at root or under
## ``<name>/``).
##
## See ../../../reprobuild-specs/Language-Conventions/Go.md.

import repro_project_dsl

package go_library_example:
  uses:
    "go >=1.22 <2.0"

  library go_library_example
