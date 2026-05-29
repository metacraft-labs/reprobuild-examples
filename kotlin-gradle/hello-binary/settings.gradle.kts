// Settings file for the M41 ``kotlin-gradle/hello-binary`` fixture.
//
//   * ``rootProject.name = "hello"`` combines with the build.gradle.kts
//     ``version = "1.0"`` to produce ``build/libs/hello-1.0.jar`` — the
//     path the M41 convention predicts and the validation script greps
//     for.
//
//   * The ``pluginManagement`` block declares ``mavenCentral()`` as the
//     plugin-resolution source. Gradle pulls the Kotlin Gradle plugin
//     (``kotlin("jvm")``) from there during the warm-step
//     ``gradle build`` run; subsequent offline builds find the plugin
//     in ``~/.gradle/caches/``.

pluginManagement {
    repositories {
        mavenCentral()
        gradlePluginPortal()
    }
}

rootProject.name = "hello"
