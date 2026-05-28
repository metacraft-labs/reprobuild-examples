/* Minimal CPython C extension exposing a single ``greet(name) -> str``
 * function. Built via scikit-build-core (PEP 517 backend
 * ``scikit_build_core.build``); the reprobuild standard provider's
 * Python convention routes this project through Mode B
 * (``python -m build --wheel --no-isolation``) because the
 * scikit_build_core.build backend is in the Mode B catalog (M24).
 */
#define PY_SSIZE_T_CLEAN
#include <Python.h>

static PyObject *greet(PyObject *self, PyObject *args) {
  const char *name;
  if (!PyArg_ParseTuple(args, "s", &name)) {
    return NULL;
  }
  return PyUnicode_FromFormat("hello, %s", name);
}

static PyMethodDef methods[] = {
    {"greet", greet, METH_VARARGS, "Return a greeting for ``name``."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef moduledef = {
    PyModuleDef_HEAD_INIT,
    "python_pep517_scikit_build_core_example",
    "Minimal scikit-build-core extension for M24 verification.",
    -1,
    methods,
};

PyMODINIT_FUNC PyInit_python_pep517_scikit_build_core_example(void) {
  return PyModule_Create(&moduledef);
}
