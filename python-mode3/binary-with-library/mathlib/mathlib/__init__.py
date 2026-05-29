# mathlib/mathlib/__init__.py — Mode 3 Python library package.
#
# The python-direct convention stages this package to:
#
#   <projectRoot>/.repro/build/mathlib/mathlib/__init__.py
#
# and byte-compiles it via:
#
#   python -m compileall <staged-pkg-dir>
#
# The downstream `calc` executable's wrapper script sets PYTHONPATH to
# include the staged parent dir (<projectRoot>/.repro/build/mathlib)
# so `from mathlib import add` resolves to this module at runtime.

def add(a, b):
    return a + b
