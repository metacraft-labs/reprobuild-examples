# Minimal hand-written Makefile producing a single executable named
# ``hello`` from src/main.c. Follows the canonical %.o: %.c +
# bin: <objs> shape the C-Cpp-Make convention recognises (§"Mode A").

CC      ?= cc
CFLAGS  ?= -O2 -Wall -Wextra
LDFLAGS ?=

.PHONY: all clean

all: hello

hello: src/main.o
	$(CC) $(LDFLAGS) -o $@ $^

src/main.o: src/main.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f hello hello.exe src/main.o
