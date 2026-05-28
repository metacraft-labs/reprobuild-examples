## Minimal Go library-with-tests example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider`. The Go convention's M22 test-discovery
## surface walks the module's packages, and for each one carrying
## ``*_test.go`` files emits a ``go test -count=1 <importPath>`` action
## under a non-default ``test`` target (see
## ../../../reprobuild-specs/Language-Conventions/Go.md §"Test
## commands").
##
## ``repro build .#default`` builds the library archive only;
## ``repro build .#test`` additionally runs ``go test`` for every
## test-bearing package.

import repro_project_dsl

package go_library_with_tests_example:
  uses:
    "go >=1.22 <2.0"

  library go_library_with_tests_example
