## Python extension built via maturin (PyO3) — exercises the M24 Mode B
## crude fallback. ``pyproject.toml`` declares
## ``[build-system].build-backend = "maturin"``, which the Python
## convention's M24 catalog matches; ``pythonEmitFragment`` routes the
## project through ``pythonCrudeFallback`` rather than emitting the
## Mode A PEP 517 hook sub-graph.
##
## The crude fragment invokes ``python -m build --wheel --no-isolation``
## which delegates to maturin; maturin in turn invokes ``cargo`` to
## produce the platform-tagged wheel. The wheel lands under
## ``<projectRoot>/dist/`` (``python -m build``'s default output dir).
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which routes to its Mode B fallback for Mode B-only backends.
##
## See ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org §M24
## and ../../../reprobuild-specs/Language-Conventions/Python.md.

import repro_project_dsl

package pythonPep517MaturinExample:
  uses:
    "python3 >=3.11 <4.0"

  library pythonPep517MaturinExample
