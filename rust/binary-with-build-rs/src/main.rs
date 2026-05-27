// Tier 2b M6 fixture — proves that build.rs ran inside the crude path
// by reading the env var build.rs exported.
fn main() {
    println!("hello with build.rs: {}", env!("BUILD_RS_FIRED"));
}
