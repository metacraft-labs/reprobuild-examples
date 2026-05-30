#!/usr/bin/env ruby
# Minimal Ruby executable for the M56 ``ruby-bundler/hello-binary``
# fixture. Bundler's launcher shim (emitted under
# ``<root>/.repro/build/hello/hello.cmd``) invokes
# ``bundle exec ruby bin/hello.rb`` so this file is the actual entry
# point.
#
# Uses only Ruby stdlib (``puts``) so the build needs no external
# gems — keeping the M56 offline-mode contract trivially satisfied.

puts "hello from ruby-bundler-hello-binary"
