## TypeScript CLI example using the standard convention.
##
## No `build:` block. The M21 JS/TS convention picks this fixture up via
## ``Tier 2b standard direct`` dispatch and emits:
##
##   * A1 ``npm ci`` (lockfile-pinned typescript / tsx / esbuild install)
##   * A3 whole-project ``tsc`` compile (type-check + ``.d.ts`` emit)
##   * A5 per-bin ``esbuild --bundle`` -> ``.repro/build/dist/bin/cli.js``
##   * A6 launcher shim -> ``.repro/build/bin/typescript-cli-example.cmd``
##     (Windows) / ``.repro/build/bin/typescript-cli-example`` (POSIX)
##   * A7 ``node --test --import=tsx`` action for ``test/*.test.ts``
##     under the non-default ``test`` target.
##
## See ../../../reprobuild-specs/Language-Conventions/JavaScript-TypeScript.md
## §"Example projects" → ``typescript-cli/``.

import repro_project_dsl

package typescript_cli_example:
  uses:
    "node >=20 <23"
    "typescript >=5.6 <6.0"
    "tsx >=4 <5"
    "esbuild >=0.24 <1.0"

  executable typescript_cli_example:
    discard
