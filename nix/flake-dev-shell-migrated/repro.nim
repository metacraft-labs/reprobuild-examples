## The project of ../flake-dev-shell after the last step of the tutorial
## "Move a project from a Nix flake to reprobuild": it has no flake.
## reprobuild builds it and provides its development environment, and takes
## `nim` from Nix through the package catalog.

import repro_project_dsl

package hello:
  uses:
    "nim >=2.2 <3.0"

  defaultToolProvisioning "nix"

  devEnv:
    discard

  build:
    discard nim.c(source = "src/hello.nim", binary = "build/hello")
