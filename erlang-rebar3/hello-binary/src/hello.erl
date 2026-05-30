%% M61 erlang-rebar3/hello-binary fixture: escript main module.
%%
%% Declares ``main/1`` so ``rebar3 escriptize`` can produce a
%% self-contained escript that invokes this callback when run.
%% Uses only Erlang's stdlib (``io:format/1``) so the build needs no
%% external Hex dependencies — keeping the M61 offline-mode contract
%% trivially satisfied.

-module(hello).
-export([main/1]).

main(_Args) ->
    io:format("hello from erlang-rebar3-hello-binary~n").
