# Reprobuild Examples

Per-language example projects demonstrating reprobuild's
[standard-provider convention](https://github.com/metacraft-labs/reprobuild-specs/blob/main/Language-Conventions/README.md).

Every example in this repo follows the same shape:

```
<language>/<project-type>/
    reprobuild.nim          # package declaration, NO `build:` block
    <source files following the language's standard layout>
```

The `reprobuild.nim` file declares **what** the package is (executables,
libraries, files); the standard provider derives **how** to build it
from the language's convention and the source-tree layout.

## Repository layout

```
rust/
  binary/
  library/
  library-with-tests/
  workspace/
go/
  binary/
  library/
  multi-binary/
python/
  library-pure/
  console-script/
javascript-typescript/
  typescript-library/
  typescript-cli/
  node-server/
nim/
  binary/
  library/
  library-with-tests/
  multi-binary/
c-cpp-make/
  binary/
  library-static/
c-cpp-autotools/
  hello-binary/
c-cpp-cmake/
  ...
java/
  binary/
  library-jar/
  gradle-multi-module/
kotlin/
  binary/
  library/
scala/
  mill-binary/
csharp/
  console-app/
  library/
swift/
  executable/
  library/
ruby/
  gem-library/
  cli-tool/
```

Each leaf directory is a standalone, build-able example. To try one:

```sh
cd rust/binary
repro build
```

(or the equivalent in the dev shell for the host repo).

## Status

Initial scaffold pass: directory structure + minimal `reprobuild.nim`
+ minimal source for each example. Verification ("does this actually
build end-to-end on every host") is in progress as a follow-on
campaign — see the per-example README for current state.

## Adding a language

1. Add the spec to
   [reprobuild-specs/Language-Conventions/](https://github.com/metacraft-labs/reprobuild-specs/tree/main/Language-Conventions).
2. Add `<lang>/<project-type>/` directories under this repo with the
   minimal `reprobuild.nim` and conventional source layout.
3. Update this README's tree.
4. Verify each example builds in the matching dev shell.
