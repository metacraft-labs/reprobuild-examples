(* Minimal OCaml executable for the M46
 * ``ocaml-dune/hello-binary`` fixture. Dune's ``(executable (name
 * hello))`` stanza expects ``hello.ml`` (or ``hello/main.ml``) as the
 * entry point — the bare ``let () = ...`` pattern is the OCaml
 * top-level entry equivalent of C# 9's top-level statements and
 * avoids a separate ``main`` function.
 *
 * Imports nothing beyond the implicit OCaml stdlib so the build needs
 * no external opam packages — keeping the M46 offline-mode contract
 * trivially satisfied (no opam install --deps-only step required).
 *)
let () = print_endline "hello from ocaml-dune-hello-binary"
