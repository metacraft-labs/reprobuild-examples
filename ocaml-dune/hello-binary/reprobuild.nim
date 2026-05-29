## Minimal OCaml executable built via stock ``dune build`` (M46
## Tier 2b ``ocaml-dune`` standard-provider convention).
##
## **Fifth managed-ecosystem fixture** after the M40 Java/Maven, M41
## Kotlin/Gradle, M42 C#/.NET, and M43 Swift/SwiftPM siblings. This
## fixture routes through the lightweight standard-provider convention
## added in M46, which shells out to a stock ``dune`` driver for a
## single ``dune build --release -j 1`` invocation. No introspection
## lift; the action graph is intentionally coarse (one ``dune build``
## action that produces ``_build/default/hello.exe``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## these — the M9 harness SKIPs cleanly otherwise):
##   * ``ocaml`` on PATH (the OCaml driver — ``ocaml.exe`` on Windows).
##   * ``dune`` on PATH (the Dune build system — separate
##     ``opam install dune`` since Dune isn't a built-in part of the
##     OCaml distribution).
##
## **No external opam dependencies.** The dune-project is self-contained:
## it declares only a single ``executable`` stanza that links against
## the OCaml stdlib (always available). M46's offline-mode contract is
## trivially satisfied since no dependency resolution is needed.
##
## **Provisioning note**: on a development host that doesn't ship OCaml
## + Dune (the M46 default on Windows — the dev shell doesn't currently
## bundle OCaml), the supported install paths are:
##   * OPAM Windows from ocaml.org (``opam-2.x.y.exe`` installer)
##     unpacked into ``D:/metacraft-dev-deps/opam/``.
##   * Then: ``opam init -y --bare`` + ``opam switch create <ver>`` +
##     ``opam install dune`` (the convention requires both ``ocaml``
##     and ``dune`` on PATH).
## env.ps1 should then prepend the opam switch's ``bin/`` to PATH (a
## follow-up provisioning milestone covers the full catalog work).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M46.

import repro_project_dsl

package ocaml_dune_hello_binary_example:
  uses:
    "ocaml >=4.14"
    "dune >=3.0"

  executable hello:
    discard
