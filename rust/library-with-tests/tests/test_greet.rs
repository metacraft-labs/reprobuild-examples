//! Integration test for the ``greet`` function.

use rust_library_with_tests_example::greet;

#[test]
fn integration_greets_world() {
    assert_eq!(greet("world"), "hello, world");
}

#[test]
fn integration_greets_empty() {
    assert_eq!(greet(""), "hello, ");
}
