## Mode 3 pilot binary — imports the library from the same workspace.
##
## The ``import greet`` line below is what the scanner picks up to
## emit the ``depends_on mode3PilotHello: mode3PilotGreet`` edge in
## ``repro.scanned-deps.nim``.

import greet

echo greet("mode3-pilot")
