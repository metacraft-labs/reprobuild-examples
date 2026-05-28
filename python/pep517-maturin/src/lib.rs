// Minimal PyO3 extension: exposes a single ``greet(name) -> str``
// function. Built via maturin (PEP 517 backend ``maturin``); the
// reprobuild standard provider's Python convention routes this
// project through Mode B (``python -m build --wheel --no-isolation``)
// because the maturin backend is in the Mode B catalog (M24).

use pyo3::prelude::*;

#[pyfunction]
fn greet(name: &str) -> PyResult<String> {
    Ok(format!("hello, {name}"))
}

#[pymodule]
fn python_pep517_maturin_example(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(greet, m)?)?;
    Ok(())
}
