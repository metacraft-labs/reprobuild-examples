## Python extension built via scikit-build-core (CMake-driven C
## extension) — exercises the M24 Mode B crude fallback.
## ``pyproject.toml`` declares
## ``[build-system].build-backend = "scikit_build_core.build"``, which
## the Python convention's M24 catalog matches; ``pythonEmitFragment``
## routes the project through ``pythonCrudeFallback`` rather than
## emitting the Mode A PEP 517 hook sub-graph.
##
## The crude fragment invokes ``python -m build --wheel --no-isolation``
## which delegates to scikit_build_core.build; scikit-build-core in
## turn invokes CMake + a C compiler to produce the platform-tagged
## wheel. The wheel lands under ``<projectRoot>/dist/``.
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which routes to its Mode B fallback for Mode B-only backends.
##
## See ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org §M24.

import repro_project_dsl

package pythonPep517ScikitBuildCoreExample:
  uses:
    "python3 >=3.11 <4.0"

  library pythonPep517ScikitBuildCoreExample
