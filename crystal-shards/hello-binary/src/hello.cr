# M60 Mode 2 Crystal entry-point source for the
# ``crystal-shards/hello-binary`` fixture.
#
# Crystal's whole-program analysis takes the entry source declared in
# ``shard.yml``'s ``targets.hello.main`` field (``src/hello.cr``) and
# compiles + links it into a single static binary. No external Shards
# dependencies — the fixture depends only on Crystal's stdlib so the
# build runs fully offline without any ``shards install`` network
# traffic.

puts "hello from crystal-shards-hello-binary"
