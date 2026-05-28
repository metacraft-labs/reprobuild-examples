// Package golibrarywithtestsexample is a minimal Go library exposing a
// single Greet function plus a companion ``greet_test.go`` exercising it
// under ``go test``. Used by the M22 standard-provider test-discovery
// gate to verify that the Go convention emits a ``target("test", ...)``
// when the project ships ``*_test.go`` files.
package golibrarywithtestsexample

// Greet returns a friendly greeting for name.
func Greet(name string) string {
	return "hello, " + name
}
