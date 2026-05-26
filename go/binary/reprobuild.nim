## Minimal Go binary example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which derives the build graph from go's
## module conventions (go.mod + cmd/<name>/main.go or root main.go).
##
## See ../../../reprobuild-specs/Language-Conventions/Go.md.

import repro_project_dsl

package goBinaryExample:
  uses:
    "go >=1.22 <2.0"

  executable goBinaryExample
