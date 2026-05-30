# M60 Mode 3 Crystal entry-point source for the
# ``crystal-mode3/hello-binary`` fixture.
#
# Pure-source Crystal — no ``shard.yml`` at the workspace root, so
# the M60 ``crystal`` convention dispatches via Mode 3 (single
# ``crystal build`` action per executable, no ``shards install`` step).
# Crystal's whole-program analysis takes this entry source and
# compiles + links it into a single static binary in one monolithic
# pass.

puts "hello from crystal-mode3-hello-binary"
