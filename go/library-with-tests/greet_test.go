// Unit tests for the Greet function. The M22 Go test-discovery surface
// emits a single ``go test -count=1 <importPath>`` action per package
// that ships ``*_test.go`` files; this file is what makes the package
// "test-bearing" so the convention emits a non-default ``test`` target.
package golibrarywithtestsexample

import "testing"

func TestGreetWorld(t *testing.T) {
	got := Greet("world")
	want := "hello, world"
	if got != want {
		t.Fatalf("Greet(%q) = %q; want %q", "world", got, want)
	}
}

func TestGreetEmpty(t *testing.T) {
	got := Greet("")
	want := "hello, "
	if got != want {
		t.Fatalf("Greet(%q) = %q; want %q", "", got, want)
	}
}
