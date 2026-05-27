//! Library exposing a single `greet` function plus a unit test.

/// Return a friendly greeting for `name`.
pub fn greet(name: &str) -> String {
    format!("hello, {}", name)
}

#[cfg(test)]
mod tests {
    use super::greet;

    #[test]
    fn greets_world() {
        assert_eq!(greet("world"), "hello, world");
    }
}
