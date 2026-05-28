## Minimal Vite app — exercises the M24 Mode B crude fallback.
## ``vite.config.js`` at the project root + ``scripts.build`` invoking
## ``vite build`` both trigger the Mode B routing in the
## javascript-typescript convention's ``projectRequiresModeB`` probe;
## ``jsTsEmitFragment`` delegates to ``jsTsCrudeFallback`` which runs
## ``npm install && npm run build`` (or ``npm ci && npm run build``
## when a lockfile is present).
##
## Vite writes its bundle to ``<projectRoot>/dist/`` (configured
## explicitly in ``vite.config.js``); the crude fallback declares
## ``dist`` as an opaque output directory.
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which routes to its Mode B fallback for projects with bundler
## configs.
##
## See ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org §M24
## and ../../../reprobuild-specs/Language-Conventions/JavaScript-TypeScript.md.

import repro_project_dsl

package viteAppExample:
  uses:
    "node >=20 <23"

  library viteAppExample
