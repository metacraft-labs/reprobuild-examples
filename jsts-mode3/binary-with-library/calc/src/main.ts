// calc/src/main.ts — Mode 3 JS/TS executable entry point.
//
// The jsts-direct convention emits one esbuild --bundle action that
// consumes this file (transpiling TS → JS on the fly) and inlines the
// mathlib library's source via --alias:mathlib=<mathlib-src>/index.ts.
// The convention then emits an fs.writeText wrapper script
// `<projectRoot>/.repro/build/calc/calc.cmd` (Windows) or
// `<projectRoot>/.repro/build/calc/calc` (POSIX) that runs
// `node <bundle.js>`.
//
// The `import { add } from "mathlib";` line is what the M33 scanner
// picks up to emit the `depends_on calcPkg: mathlibPkg` edge in
// repro.scanned-deps.nim.

import { add } from "mathlib";

const result = add(2, 3);
console.log("hello from jsts-mode3-binary-with-library, mathlib added 2+3 =", result);
