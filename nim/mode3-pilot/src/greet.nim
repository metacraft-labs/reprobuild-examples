## Umbrella module for the Mode 3 pilot's library.

proc greet*(name: string): string =
  ## Return a friendly greeting for ``name``.
  "hello from mode3-pilot, " & name
