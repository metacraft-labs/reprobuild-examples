// calc/main.go — Mode 3 Go executable that depends on the mathlib
// package.
//
// The `import "mathlib"` line is what the scanner picks up to emit
// the `depends_on calcPkg: mathlibPkg` edge in repro.scanned-deps.nim.

package main

import (
	"fmt"
	"mathlib"
)

func main() {
	result := mathlib.Add(2, 3)
	fmt.Printf("hello from go-mode3-binary-with-library, mathlib added 2+3 = %d\n", result)
}
