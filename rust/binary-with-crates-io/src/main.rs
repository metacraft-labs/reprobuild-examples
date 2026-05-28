//! Rust binary that pulls in a crates.io dependency (``libc``) to
//! exercise the M23 external-dep → Mode B fallback path.

use libc::c_int;

/// Return the platform's ``EXIT_SUCCESS`` constant via the ``libc``
/// crate. Used solely to keep ``libc`` from being trimmed out as an
/// unused dep — the runtime printout exercises the symbol.
fn libc_exit_success_value() -> c_int {
    libc::EXIT_SUCCESS
}

fn main() {
    println!(
        "hello from rust-binary-with-crates-io; libc::EXIT_SUCCESS = {}",
        libc_exit_success_value()
    );
}
