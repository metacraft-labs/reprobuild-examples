// Minimal Swift executable for the M43
// ``swift-swiftpm/hello-binary`` fixture. SwiftPM's
// ``executableTarget`` shape expects sources under
// ``Sources/<targetName>/`` with ``main.swift`` being the entry point
// — print("...") at top level is the SwiftPM equivalent of C# 9's
// top-level statements and avoids the ``@main`` / ``static func
// main()`` boilerplate.
//
// Imports nothing beyond the implicit Swift stdlib so the build needs
// no external SwiftPM packages — keeping the M43 offline-mode contract
// trivially satisfied (no ``Package.resolved`` lockfile required).
print("hello from swift-swiftpm-hello-binary")
