## Umbrella module for the minimal Nim library example.

proc greet*(name: string): string =
  ## Return a friendly greeting for ``name``.
  "hello, " & name
