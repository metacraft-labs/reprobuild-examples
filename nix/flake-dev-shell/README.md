# A project with a Nix flake development shell

The starting point of the reprobuild tutorial
[Move a project from a Nix flake to reprobuild](https://github.com/metacraft-labs/reprobuild/blob/agents/docs/users/content/tutorials/move-a-project-from-a-nix-flake.md).

The flake's development shell provides `nim`, and direnv activates it through
`.envrc`. The project is built by hand inside that shell:

```bash
nix develop --command nim c --out:build/hello src/hello.nim
./build/hello
```

The tutorial moves the project to reprobuild one step at a time and removes
the flake at the end. [`../flake-dev-shell-migrated`](../flake-dev-shell-migrated)
is the result.
