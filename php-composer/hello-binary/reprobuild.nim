## Minimal PHP app-style executable built via the stock ``composer``
## driver (M57 Tier 2b ``php-composer`` standard-provider convention).
##
## **Third Phase 2 fixture** — added in M57 immediately after M56
## ruby-bundler. Routes through the lightweight standard-provider
## convention added in M57, which shells out to a stock ``composer``
## driver for a single offline ``composer install --no-dev
## --optimize-autoloader --no-progress --quiet`` invocation plus a
## launcher ``.cmd`` shim that runs ``php bin/<name>.php``. No
## introspection lift; the action graph is intentionally coarse (one
## install action producing a sentinel file under ``vendor/`` + one
## ``.cmd`` wrapper per executable under
## ``.repro/build/<name>/<name>.cmd``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``php`` on PATH (the PHP interpreter — ``php.exe`` on Windows).
##     M57 pins PHP 8.3.13.
##   * ``composer`` on PATH (Composer — independent of PHP; the
##     canonical Windows install path is the Composer-Setup.exe
##     installer from https://getcomposer.org/Composer-Setup.exe).
##     M57 pins Composer 2.8.1.
##
## **No external package dependencies.** The ``composer.json``
## declares the project type but adds zero package dependencies, so
## the install step is effectively a no-op (Composer still produces
## a sentinel that records "everything resolved" but doesn't fetch
## any packages). M57's offline-mode contract is trivially satisfied
## since no dependency resolution is needed — ``composer install
## --no-dev`` succeeds even without network access when the
## ``composer.lock`` is in sync with the empty package set.
##
## **Provisioning note**: on a development host that doesn't ship PHP
## (the M57 default on Windows — the dev shell doesn't currently
## bundle PHP), the canonical install paths on Windows are:
##   * PHP Windows binary from ``https://windows.php.net/downloads/``;
##     M57 pins ``PHP_VERSION=8.3.13``.
##   * Composer ``2.8.x`` ``.phar`` via Composer-Setup.exe from
##     ``https://getcomposer.org/Composer-Setup.exe``; M57 pins
##     ``COMPOSER_VERSION=2.8.1``.
## Total dev-shell footprint ~85 MB. A follow-up provisioning
## milestone covers the full catalog work.
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M57.

import repro_project_dsl

package php_composer_hello_binary_example:
  uses:
    "php >=8.0"

  executable hello:
    discard
