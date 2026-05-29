// calc/main.go — Mode 3 cross-language Go executable that calls into
// a sibling C static library declared in the same workspace
// ``repro.nim`` via cgo.
//
// The cross-language wiring the go-direct convention performs:
//
//   1. The C ``mathlib`` library is compiled with ``gcc -c`` per-source
//      and archived via ``ar rcs`` into
//      ``.repro/build/mathlib/libmathlib.a``.
//   2. This Go file is built via ``go build -o calc.exe ./calc`` with
//      ``-ldflags=-extldflags=-L<archive-dir> -lmathlib`` threaded onto
//      the argv by the convention. cgo's preprocessor expands the
//      ``import "C"`` block; the cgo wrapper for ``C.add(...)`` resolves
//      ``add`` against the C archive at link time.
//   3. The link sequencing pulls the C archive build strictly before
//      the Go build so the ``add`` symbol resolves at link time.
//
// The stdout proves the cross-language round-trip: Go -> C add -> back
// to Go fmt.Printf.

package main

/*
#cgo CFLAGS: -I${SRCDIR}/../mathlib/include
#include "mathlib/add.h"
*/
import "C"

import "fmt"

func main() {
	result := C.add(2, 3)
	fmt.Printf("go says: mathlib added 2+3 = %d\n", int(result))
	fmt.Println("hello from go-uses-cpp-lib")
}
