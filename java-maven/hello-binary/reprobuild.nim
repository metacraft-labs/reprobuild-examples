## Minimal Java executable built via stock Maven (M40 Tier 2b
## ``java-maven`` standard-provider convention).
##
## **First JVM-ecosystem fixture.** This fixture routes through the
## lightweight standard-provider convention added in M40, which shells
## out to a stock ``mvn`` binary for a single ``mvn package -o -q``
## invocation. No introspection lift; the action graph is intentionally
## coarse (one ``mvn package`` action that produces a
## ``target/hello-1.0.jar``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## all of these — the M9 harness SKIPs cleanly otherwise):
##   * ``mvn`` on PATH (Apache Maven 3.9.x recommended).
##   * ``javac`` on PATH (Adoptium JDK 21 LTS recommended; any JDK with
##     a ``javac`` that can target the pom's ``maven.compiler.source``
##     / ``-target`` will do).
##
## **No external dependencies.** The pom.xml is self-contained: the
## only ``<dependencies>`` Maven uses are its built-in plugin defaults
## (``maven-jar-plugin``, ``maven-resources-plugin``,
## ``maven-compiler-plugin``) — which Maven ships bundled with the
## binary distribution under
## ``<maven>/lib/`` and which it caches into ``~/.m2/repository/`` on
## first invocation. M40's offline-mode (``-o``) contract requires
## those plugin jars to already be present in ``~/.m2/repository/``;
## the ``mvn dependency:go-offline -f pom.xml`` provisioning command
## warms the local repo cache for the rare host that hasn't run mvn
## before.
##
## **Provisioning note**: on a development host that doesn't ship JDK
## + Maven, the supported install paths are:
##   * Adoptium JDK 21 LTS into ``D:/metacraft-dev-deps/jdk/21/``
##   * Apache Maven 3.9.x into ``D:/metacraft-dev-deps/maven/3.9.x/``
## env.ps1 should then prepend ``<jdk>/bin`` + ``<maven>/bin`` to PATH
## (M47 covers the full provisioning catalog work).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M40.

import repro_project_dsl

package java_maven_hello_binary_example:
  uses:
    "java >=21"
    "mvn >=3.9"

  executable hello:
    discard
