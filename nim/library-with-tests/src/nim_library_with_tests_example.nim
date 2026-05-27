## Umbrella module for the Nim library-with-tests example.

proc greet*(name: string): string =
  ## Return a friendly greeting for ``name``.
  "hello, " & name
