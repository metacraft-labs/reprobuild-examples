# calc/calc/__main__.py — Mode 3 Python executable entry point.
#
# The python-direct convention emits a wrapper script
# `<projectRoot>/.repro/build/calc/calc.cmd` (Windows) or
# `<projectRoot>/.repro/build/calc/calc` (POSIX) that sets PYTHONPATH
# to include both the calc staging dir AND the mathlib staging dir,
# then invokes `python -m calc` — which runs THIS file.
#
# The `from mathlib import add` line is what the M32 scanner picks up
# to emit the `depends_on calcPkg: mathlibPkg` edge in
# repro.scanned-deps.nim.

from mathlib import add

if __name__ == "__main__":
    result = add(2, 3)
    print("hello from python-mode3-binary-with-library, mathlib added 2+3 =", result)
