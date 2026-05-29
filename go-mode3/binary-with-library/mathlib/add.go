// mathlib/add.go — Mode 3 Go library package.
//
// The go-direct convention compiles this package with:
//
//   go tool compile -p mathlib -lang=go1.21 -complete \
//                   -importcfg .repro/build/mathlib/mathlib.importcfg \
//                   -pack -o .repro/build/mathlib/mathlib.a \
//                   mathlib/add.go
//
// The resulting mathlib.a is then threaded onto the downstream `calc`
// binary's compile-time importcfg + the link-time importcfg.link so
// `import "mathlib"` in calc/main.go resolves. M31 emits the .a (not
// a sibling lib<name>.a) — the cross-language alias is deferred to
// M36 if it lands.

package mathlib

// Add returns the sum of two integers. Exported so `calc`'s
// `mathlib.Add(...)` call resolves at link time.
func Add(a, b int) int {
	return a + b
}
