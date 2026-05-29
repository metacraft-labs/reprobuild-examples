// Minimal self-contained Gradle build for the M41
// ``kotlin-gradle/hello-binary`` fixture. Pinning notes:
//
//   * ``kotlin("jvm")`` is the Kotlin Gradle plugin's JVM target. The
//     version is pinned via ``plugins { kotlin("jvm") version "..." }``
//     so the build is reproducible across hosts that ship a different
//     Kotlin Gradle plugin default. We pin to a Kotlin Gradle plugin
//     version that pairs with Gradle 8.x + Kotlin stdlib 1.9.x — the
//     M41 dev-shell provisioning target.
//
//   * ``application`` plugin sets the executable jar's manifest's
//     ``Main-Class`` attribute via ``application.mainClass``. The
//     produced ``build/libs/hello-1.0.jar`` runs via ``java -jar
//     build/libs/hello-1.0.jar``.
//
//   * ``version = "1.0"`` combines with ``rootProject.name`` (set in
//     settings.gradle.kts to ``hello``) to produce
//     ``build/libs/hello-1.0.jar`` — the path the M41 convention
//     predicts and the validation script greps for.
//
//   * ``kotlin { jvmToolchain(21) }`` pins the compile/runtime JVM to
//     Java 21 so the build is reproducible across hosts that ship a
//     newer JDK. The fixture's Hello.kt uses no language features
//     beyond Kotlin 1.0, so the source level is conservative for
//     compatibility.
//
//   * NO ``repositories { mavenCentral() }`` line — the Kotlin
//     stdlib jar resolves from Gradle's bundled distribution cache
//     during the offline build (the warm-step in the validation
//     script pre-populates ``~/.gradle/caches/`` once via a non-
//     offline ``gradle build`` run). The plugin-management
//     ``mavenCentral()`` declaration in settings.gradle.kts covers
//     the plugin resolution path.

plugins {
    kotlin("jvm") version "1.9.25"
    application
}

group = "com.example"
version = "1.0"

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib"))
}

application {
    mainClass.set("HelloKt")
}

kotlin {
    jvmToolchain(21)
}

// Configure the default ``jar`` task to embed the Kotlin stdlib in the
// produced jar so ``java -jar build/libs/hello-1.0.jar`` runs without a
// classpath wrapper. The Kotlin stdlib is pulled from the
// implementation configuration.
tasks.jar {
    manifest {
        attributes["Main-Class"] = "HelloKt"
    }
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    from({
        configurations.runtimeClasspath.get().map {
            if (it.isDirectory) it else zipTree(it)
        }
    })
}
