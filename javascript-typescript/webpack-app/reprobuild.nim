## Minimal webpack app — exercises the M24 Mode B crude fallback.
## ``webpack.config.cjs`` at the project root + ``scripts.build``
## invoking ``webpack --mode production`` both trigger the Mode B
## routing in the javascript-typescript convention's
## ``projectRequiresModeB`` probe; ``jsTsEmitFragment`` delegates to
## ``jsTsCrudeFallback`` which runs ``npm install && npm run build``
## (or ``npm ci && npm run build`` when a lockfile is present).
##
## Webpack writes its bundle to ``<projectRoot>/dist/`` (configured
## explicitly in ``webpack.config.cjs``); the crude fallback declares
## ``dist`` as an opaque output directory.
##
## No `build:` block — engine dispatches to ``repro-standard-provider``
## which routes to its Mode B fallback for projects with bundler
## configs.
##
## See ../../../reprobuild-specs/Standard-Provider-Implementation.milestones.org §M24.

import repro_project_dsl

package webpackAppExample:
  uses:
    "node >=20 <23"

  library webpackAppExample
