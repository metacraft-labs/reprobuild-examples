-- Minimal Haskell executable for the M55 ``haskell-cabal/hello-binary``
-- fixture. Cabal's ``executable hello`` stanza expects ``Main.hs``
-- under ``hs-source-dirs: app`` as the entry point — the bare
-- ``main :: IO ()`` pattern is the Haskell top-level entry equivalent
-- of C# 9's top-level statements.
--
-- Imports nothing beyond the implicit Haskell ``Prelude`` (which
-- ``base`` always provides) so the build needs no external Hackage
-- packages — keeping the M55 offline-mode contract trivially satisfied
-- (no ``cabal v2-update`` step required).

module Main where

main :: IO ()
main = putStrLn "hello from haskell-cabal-hello-binary"
