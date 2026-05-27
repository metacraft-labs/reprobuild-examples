## Nim library example with a unittest-based test suite.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider`. The Nim convention recognises the
## ``tests/test_*.nim`` files and emits per-test 3-phase compile
## actions (see ../../../reprobuild-specs/Language-Conventions/Nim.md
## §"Test commands").

import repro_project_dsl

package nimLibraryWithTestsExample:
  uses:
    "nim >=2.2 <3.0"

  library nim_library_with_tests_example
