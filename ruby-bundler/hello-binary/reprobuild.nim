## Minimal Ruby app-style executable built via the stock ``bundle``
## driver (M56 Tier 2b ``ruby-bundler`` standard-provider convention).
##
## **Second Phase 2 fixture** — added in M56 immediately after M55
## haskell-cabal. Routes through the lightweight standard-provider
## convention added in M56, which shells out to a stock ``bundle``
## driver for a single offline ``bundle install --deployment --local
## --quiet --path vendor/bundle`` invocation plus a launcher ``.cmd``
## shim that runs ``bundle exec ruby bin/<name>.rb``. No introspection
## lift; the action graph is intentionally coarse (one install action
## producing a sentinel file under ``vendor/bundle/`` + one ``.cmd``
## wrapper per executable under ``.repro/build/<name>/<name>.cmd``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``ruby`` on PATH (the Ruby interpreter — ``ruby.exe`` on
##     Windows). M56 pins Ruby 3.3.5.
##   * ``bundle`` on PATH (Bundler — ships with Ruby ≥ 2.6 so a vanilla
##     Ruby install satisfies this automatically).
##
## **No external gem dependencies.** The ``Gemfile`` declares the
## ``rubygems`` source but adds zero gem dependencies, so the install
## step is effectively a no-op (Bundler still produces a sentinel that
## records "everything resolved" but doesn't fetch any gems). M56's
## offline-mode contract is trivially satisfied since no dependency
## resolution is needed — ``bundle install --deployment --local``
## succeeds even without a populated ``vendor/cache/``.
##
## **Provisioning note**: on a development host that doesn't ship Ruby
## (the M56 default on Windows — the dev shell doesn't currently
## bundle Ruby), the canonical install path on Windows is RubyInstaller
## (``https://rubyinstaller.org/``). M56 pins ``RUBY_VERSION=3.3.5``
## (latest stable as of 2024-09). Bundler ships with Ruby ≥ 2.6 so no
## separate install is required. Total dev-shell footprint ~120 MB. A
## follow-up provisioning milestone covers the full catalog work.
##
## See ../../../reprobuild-specs/Provisioning-And-Languages-Expansion.milestones.org §M56.

import repro_project_dsl

package ruby_bundler_hello_binary_example:
  uses:
    "ruby >=3.0"

  executable hello:
    discard
