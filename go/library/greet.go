// Package golibraryexample is a minimal Go library exposing a single
// Greet function consumed by the standard-provider example tree.
package golibraryexample

// Greet returns a friendly greeting for name.
func Greet(name string) string {
	return "hello, " + name
}
