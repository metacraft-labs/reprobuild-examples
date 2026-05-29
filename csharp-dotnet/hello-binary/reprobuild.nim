## Minimal C# executable built via stock ``dotnet`` (M42 Tier 2b
## ``csharp-dotnet`` standard-provider convention).
##
## **Third managed-runtime-ecosystem fixture** after the M40 Java/Maven
## and M41 Kotlin/Gradle siblings. This fixture routes through the
## lightweight standard-provider convention added in M42, which shells
## out to a stock ``dotnet`` driver for a single ``dotnet build -c
## Release --no-restore --nologo --verbosity quiet hello.csproj``
## invocation. No introspection lift; the action graph is intentionally
## coarse (one ``dotnet build`` action that produces
## ``bin/Release/net8.0/hello.exe``).
##
## **Toolchain requirements** (the convention's ``recognize`` enforces
## this — the M9 harness SKIPs cleanly otherwise):
##   * ``dotnet`` on PATH (the .NET SDK 8.0 LTS host; the SDK ships
##     ``dotnet.exe`` as a single driver binary).
##
## **No external NuGet packages.** The hello.csproj is self-contained:
## it references only the implicit ``Microsoft.NETCore.App`` framework
## pack (bundled with the SDK; never resolved from NuGet at build
## time) and ships a ``packages.lock.json`` stub that names zero
## transitive packages. M42's offline-mode (``--no-restore``) contract
## still requires the lockfile to be present at the project root —
## hence the stub. Real-world projects pulling external NuGet packages
## should run ``dotnet restore --use-lock-file`` once with network
## access before invoking the convention.
##
## **Provisioning note**: on a development host that doesn't ship the
## .NET SDK, the supported install paths are:
##   * Adoptium-style: download .NET SDK 8.0 LTS from microsoft.com
##     into ``D:/metacraft-dev-deps/dotnet/8.0/`` (manual download is
##     the canonical Windows path for the dev shell).
##   * Or: ``winget install Microsoft.DotNet.SDK.8`` (uses the system
##     installer; ``%ProgramFiles%\dotnet\dotnet.exe`` lands on PATH
##     automatically).
## env.ps1 should then prepend ``D:/metacraft-dev-deps/dotnet/8.0/`` to
## PATH (M47 covers the full provisioning catalog work).
##
## See ../../../reprobuild-specs/Mode3-Language-Expansion.milestones.org
## §M42.

import repro_project_dsl

package csharp_dotnet_hello_binary_example:
  uses:
    "dotnet >=8"

  executable hello:
    discard
