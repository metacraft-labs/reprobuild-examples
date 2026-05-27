# Minimal hand-written Makefile producing a static library
# ``libgreet.a`` from src/greet.c. Matches the canonical
# %.o: %.c + lib<n>.a: <objs> shape the C-Cpp-Make convention
# recognises (§"Mode A").

CC     ?= cc
CFLAGS ?= -O2 -Wall -Wextra
AR     ?= ar

.PHONY: all clean

all: libgreet.a

libgreet.a: src/greet.o
	$(AR) rcs $@ $^

src/greet.o: src/greet.c src/greet.h
	$(CC) $(CFLAGS) -Isrc -c -o $@ $<

clean:
	rm -f libgreet.a src/greet.o
