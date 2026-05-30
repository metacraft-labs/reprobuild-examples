## M62 elixir-mix/hello-binary fixture: mix project manifest.
##
## Elixir DSL — declares a Mix.Project module that mix reads to drive
## ``mix escript.build``. Declares:
##   * ``app:`` — the OTP application atom (``:hello``); also the
##     escript filename mix emits at the project root.
##   * ``version:`` — package version.
##   * ``elixir:`` — minimum supported Elixir version.
##   * ``escript: [main_module: ...]`` — the entry-point stanza.
##     Points mix's ``escript.build`` task at the ``Hello`` module's
##     ``main/1`` callback.
##   * ``deps:`` — external Hex dependencies. Empty for the fixture
##     so the build needs no network access / pre-warmed Hex cache.
##
## ``mix escript.build`` reads these and produces ``<root>/hello``
## (a single-file escript bundling the compiled ``.beam`` files; runs
## via ``escript hello`` on any host with Erlang/OTP installed).

defmodule Hello.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello,
      version: "1.0.0",
      elixir: "~> 1.14",
      escript: [main_module: Hello],
      deps: []
    ]
  end
end
