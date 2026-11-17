# The flake project, moved to reprobuild

[`../flake-dev-shell`](../flake-dev-shell) after the last step of the
reprobuild tutorial
[Move a project from a Nix flake to reprobuild](https://github.com/metacraft-labs/reprobuild/blob/agents/docs/users/content/tutorials/move-a-project-from-a-nix-flake.md).
It has no flake: `repro.nim` declares the build and the development
environment, and `nim` comes from Nix through reprobuild's package catalog.

```bash
repro build
./build/hello
repro allow
repro exec -- nim --version
```
