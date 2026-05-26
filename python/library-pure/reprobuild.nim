## Pure-Python library example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which uses Python's pyproject.toml +
## src-layout convention. Building produces a wheel via the configured
## PEP 517 backend.
##
## See ../../../reprobuild-specs/Language-Conventions/Python.md.

import repro_project_dsl

package pythonLibraryExample:
  uses:
    "python3 >=3.11 <4.0"
    "uv >=0.5"

  library pythonLibraryExample
