## Python console-script example using the standard convention.
##
## No `build:` block. NOTE: the Python convention's Mode A is not yet
## implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The
## conventional source tree is in place ready for the convention to
## land. See ../../../reprobuild-specs/Language-Conventions/Python.md.

import repro_project_dsl

package python_console_script:
  uses:
    "python3 >=3.11 <4.0"
    "uv >=0.5"

  executable python_console_script:
    discard
