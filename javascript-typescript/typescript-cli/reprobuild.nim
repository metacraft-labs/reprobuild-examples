## TypeScript CLI example using the standard convention.
##
## No `build:` block. NOTE: the TypeScript convention's Mode A is not
## yet implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The
## conventional source tree is in place ready for the convention to
## land. See
## ../../../reprobuild-specs/Language-Conventions/JavaScript-TypeScript.md
## §"Example projects" → ``typescript-cli/``.

import repro_project_dsl

package typescript_cli_example:
  uses:
    "node >=20 <23"
    "typescript >=5.6 <6.0"
    "tsx >=4 <5"

  executable typescript_cli_example:
    discard
