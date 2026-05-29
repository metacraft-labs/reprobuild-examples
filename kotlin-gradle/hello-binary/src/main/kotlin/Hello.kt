/**
 * Minimal Kotlin executable for the M41 ``kotlin-gradle/hello-binary``
 * fixture. The build.gradle.kts's ``application.mainClass`` is set to
 * ``HelloKt`` — Kotlin compiles a top-level ``fun main()`` into a
 * synthetic class named ``<Filename>Kt`` (here ``HelloKt``), and the
 * ``jar`` task's manifest pins ``Main-Class: HelloKt`` so the produced
 * ``build/libs/hello-1.0.jar`` runs via
 * ``java -jar build/libs/hello-1.0.jar``.
 *
 * Imports nothing beyond the Kotlin stdlib (which Gradle pulls from
 * ``~/.gradle/caches/`` during the offline build) so the build needs
 * no external runtime dependencies — keeping the M41 offline-mode
 * contract (``gradle build --offline``) trivially satisfiable after a
 * one-time warm-step.
 */
fun main() {
    println("hello from kotlin-gradle-hello-binary")
}
