## M62 elixir-mix/hello-binary fixture: escript main module.
##
## Declares ``main/1`` so ``mix escript.build`` can produce a
## self-contained escript that invokes this callback when run via
## ``escript hello`` (or the M62 convention's
## ``<root>/.repro/build/hello/hello.cmd`` wrapper on Windows). Uses
## only Elixir's stdlib (``IO.puts/1``) so the build needs no
## external Hex dependencies — keeping the M62 offline-mode contract
## trivially satisfied.

defmodule Hello do
  def main(_args) do
    IO.puts("hello from elixir-mix-hello-binary")
  end
end
