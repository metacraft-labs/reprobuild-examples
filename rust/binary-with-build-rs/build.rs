// Minimal Cargo build script. Cargo runs this at the start of
// `cargo build` (because of `build = "build.rs"` in Cargo.toml). It
// sets a custom env var that main.rs reads via `env!`, proving:
//   * the standard provider routed through Mode B (cargo build),
//   * Cargo ran build.rs ahead of compiling src/main.rs.
//
// The println! lines use the `cargo:KEY=VALUE` protocol — anything
// that starts with `cargo:` is interpreted by Cargo, not echoed.
fn main() {
    println!("cargo:rustc-env=BUILD_RS_FIRED=yes");
    println!("cargo:rerun-if-changed=build.rs");
}
