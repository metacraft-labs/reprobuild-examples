// goaddlib/lib.go — M36 reverse-direction cross-language pilot:
// a Go ``main`` package exposing a single C-callable function via
// Go's ``-buildmode=c-archive`` build mode to a sibling C++
// executable in the same workspace.
//
// **Why ``package main`` AND ``func main(){}``?** Go's
// ``-buildmode=c-archive`` requires a ``main`` package with an empty
// ``main()`` function (the c-archive carries the Go runtime entry
// points but doesn't need a real main; the runtime is initialised
// when the first exported function is called from C/C++ code).
//
// The ``//export GoAdd`` directive paired with the cgo block tells
// Go to emit a C symbol named exactly ``GoAdd`` (the symbol is
// registered with the cgo runtime so C/C++ callers can invoke it).
// Go's c-archive build mode also auto-emits a sibling ``.h`` header
// next to the archive carrying the C declaration for every exported
// function; the C++ source includes that header (via a wrapper) to
// get the ABI.
//
// The go-direct convention builds this module with::
//
//     go build -buildmode=c-archive \
//         -o <root>/.repro/build/goaddlib/libgoaddlib.a \
//         goaddlib/
//
// The build emits BOTH ``libgoaddlib.a`` (the static archive) AND
// ``libgoaddlib.h`` (the auto-generated C header) in the same dir.
// The C++ binary's link line picks up the archive as a trailing
// positional plus the platform-specific Go runtime libs:
//   * POSIX:           -lpthread -ldl -lm
//   * Windows MinGW:   -lws2_32 -lwinmm -lbcrypt -lntdll
//                      -luserenv -ladvapi32

package main

import "C"

//export GoAdd
func GoAdd(a, b C.int) C.int {
	return a + b
}

// Required by ``-buildmode=c-archive`` even though never invoked.
// The Go runtime initialiser hooks into the C consumer's call site
// for the first exported function (``GoAdd`` here), not this main.
func main() {}
