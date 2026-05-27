## Go multi-binary example. Two executables under ``cmd/<name>/``
## sharing the same module.
##
## No `build:` block. NOTE: the M5 Go convention's current
## ``recognize`` only matches root-``main.go`` layouts; this fixture
## falls through to crude mode until the spec's outstanding
## ``cmd/<name>/main.go`` walk lands. See
## ../../../reprobuild-specs/Language-Conventions/Go.md §"Project
## member types" + §"Recognition" and
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org
## §M5 outstanding tasks.

import repro_project_dsl

package go_multi_binary_example:
  uses:
    "go >=1.22 <2.0"

  executable alpha:
    discard

  executable beta:
    discard
