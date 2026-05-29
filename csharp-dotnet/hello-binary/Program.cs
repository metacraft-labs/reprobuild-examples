// Minimal C# executable for the M42 ``csharp-dotnet/hello-binary``
// fixture. Top-level statements (introduced in C# 9 / .NET 5) avoid
// the ``Main`` boilerplate; the produced
// ``bin/Release/net8.0/hello.exe`` runs directly via Windows .exe
// host (no ``dotnet`` driver wrapping needed for self-launching
// SDK-style executables since .NET 5).
//
// Imports nothing beyond ``System`` (part of the implicit
// ``Microsoft.NETCore.App`` framework reference) so the build needs
// no external NuGet packages — keeping the M42 offline-mode contract
// (``dotnet build --no-restore``) trivially satisfiable since the
// ``packages.lock.json`` stub names zero packages.
using System;

Console.WriteLine("hello from csharp-dotnet-hello-binary");
