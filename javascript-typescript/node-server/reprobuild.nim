## Node HTTP server example using the standard convention.
##
## No `build:` block. NOTE: the Node convention's Mode A is not yet
## implemented; the standard provider currently emits a
## ``no-convention-matched`` diagnostic for this layout. The
## conventional source tree is in place ready for the convention to
## land. See
## ../../../reprobuild-specs/Language-Conventions/JavaScript-TypeScript.md
## §"Example projects" → ``node-server/``.

import repro_project_dsl

package node_server_example:
  uses:
    "node >=20 <23"

  executable node_server_example:
    discard
