## Unit tests for the library's ``greet`` proc.

import std/unittest

import nim_library_with_tests_example

suite "greet":
  test "greets the named subject":
    check greet("world") == "hello, world"

  test "round-trips an empty string":
    check greet("") == "hello, "
