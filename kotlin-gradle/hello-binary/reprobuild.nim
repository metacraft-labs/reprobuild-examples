## Minimal Kotlin executable built via stock Gradle (M41 Tier 2b
## ``kotlin-gradle`` standard-provider convention).
##
## **Second JVM-ecosystem fixture.** This fixture routes through the
## lightweight standard-provider convention added in M41, which shells
## out to a stock ``gradle`` binary (or the project-shipped ``gradlew``
## wrapper when present) for a single ``gradle build --offline
## --no-daemon -q`` invocation. No introspection lift; the action graph
## is intentionally coarse (one ``gradle build`` action that produces
## ``build/libs/hello-1.0.jar``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## all of these — the M9 harness SKIPs cleanly otherwise):
##   * ``gradle`` on PATH (Gradle 8.x recommended) OR ``gradlew[.bat]``
##     at the project root.
##   * ``javac`` on PATH (Adoptium JDK 21 LTS recommended; any JDK with
##     a ``javac`` that can target the build script's
##     ``kotlinOptions.jvmTarget`` will do).
##
## **No external runtime dependencies.** The build.gradle.kts is self-
## contained: the only declared dependency is the Kotlin stdlib, which
## the Kotlin Gradle plugin pulls from Gradle's bundled dependency
## resolver. M41's offline-mode (``--offline``) contract requires the
## Kotlin stdlib jar (plus the Kotlin Gradle plugin itself) to already
## be present in ``~/.gradle/caches/`` from a previous online build;
## the validation script runs a non-fatal ``gradle build`` warm step
## before the offline build to pre-populate the cache.
##
## **Provisioning note**: on a development host that doesn't ship JDK
## + Gradle, the supported install paths are:
##   * Adoptium JDK 21 LTS into ``D:/metacraft-dev-deps/jdk/21/``
##     (shared with the M40 Maven convention).
##   * Gradle 8.x into ``D:/metacraft-dev-deps/gradle/8.x/``.
## env.ps1 should then prepend ``<jdk>/bin`` + ``<gradle>/bin`` to PATH
## (M47 covers the full provisioning catalog work).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M41.

import repro_project_dsl

package kotlin_gradle_hello_binary_example:
  uses:
    "java >=21"
    "gradle >=8"
    "kotlin >=1.9"

  executable hello:
    discard
