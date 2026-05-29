## Mode 1 Nim fixture — apps/hello/src/main.nim.
##
## Demonstrates the zero-ceremony Mode 1 surface (M48):
##
##   * NO repro.nim / reprobuild.nim
##   * NO *.nimble / repro.scanned-deps.nim
##   * Just sources under apps/<name>/ and libs/<name>/
##
## The Mode 1 loader walks the workspace, finds apps/hello +
## libs/greet, censuses extensions (both are Nim), synthesises an
## in-memory repro.nim + repro.scanned-deps.nim under
## .repro/mode1-synth/, and dispatches to the Nim convention.

import greet

when isMainModule:
  echo greet.greeting()
