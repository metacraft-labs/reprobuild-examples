## TypeScript library example using the standard convention.
##
## No `build:` block — the engine dispatches to
## `repro-standard-provider` which uses npm + tsc + the src→dist
## convention. `dist/` carries .js + .d.ts ready for npm publish.
##
## See ../../../reprobuild-specs/Language-Conventions/JavaScript-TypeScript.md.

import repro_project_dsl

package typescriptLibraryExample:
  uses:
    "node >=20 <23"
    "typescript >=5.6 <6.0"

  library typescriptLibraryExample
