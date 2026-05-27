## Go multi-binary example. Two executables under ``cmd/<name>/``
## sharing the same module.
##
## No `build:` block. The M14 Go convention enumerates every
## ``package main`` reported by ``go list -deps`` and emits one
## (importcfg.link, link) pair per binary; the binary basename is the
## last path segment of each main package's import path
## (``cmd/alpha`` → ``alpha``, ``cmd/beta`` → ``beta``). See
## ../../../reprobuild-specs/Language-Conventions/Go.md §"Project
## member types" + §"Recognition" and
## ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org
## §M14.

import repro_project_dsl

package go_multi_binary_example:
  uses:
    "go >=1.22 <2.0"

  executable alpha:
    discard

  executable beta:
    discard
