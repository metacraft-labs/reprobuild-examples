// swift-tools-version:5.5
//
// Minimal SwiftPM manifest for the M43
// ``swift-swiftpm/hello-binary`` fixture. Pinning notes:
//
//   * ``swift-tools-version:5.5`` is the minimum tools version that
//     supports ``executableTarget`` directly (older versions require
//     declaring a separate product). Most installed Swift toolchains
//     (5.5+) parse this manifest correctly.
//   * The package name is ``hello`` so SwiftPM lays the produced
//     executable at ``.build/release/hello`` (on POSIX) or
//     ``.build/release/hello.exe`` (on Windows). The M43 convention
//     predicts this path for output declaration.
//   * Single ``executableTarget(name: "hello")`` — SwiftPM expects
//     sources under ``Sources/hello/`` per the standard SwiftPM layout
//     convention (which the convention's input-walker mirrors).
//   * NO ``.package(url: ...)`` dependencies — the fixture is
//     stdlib-only so no ``Package.resolved`` is needed and no
//     network access is required at build time.

import PackageDescription

let package = Package(
    name: "hello",
    targets: [
        .executableTarget(name: "hello"),
    ]
)
