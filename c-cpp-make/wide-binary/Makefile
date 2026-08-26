# Hand-written Makefile mirroring what the C-Cpp-Make convention derives,
# kept as a documentation artifact exactly as in ../binary/Makefile.
#
# The wildcard is the point of this example: every src/*.c is an
# independent compile, so `make -j` and reprobuild's scheduler both see
# 64 units plus main.c that can run at once.

CC      ?= cc
CFLAGS  ?= -O2 -Wall -Wextra
LDFLAGS ?=

SRCS := $(wildcard src/*.c)
OBJS := $(SRCS:.c=.o)

.PHONY: all clean

all: widecalc

widecalc: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f widecalc widecalc.exe $(OBJS)
