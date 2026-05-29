// mathlib/src/index.ts — Mode 3 JS/TS library entry.
//
// The jsts-direct convention does NOT emit a per-library build action;
// the executable's esbuild bundle action reads this source file
// directly via `--alias:mathlib=<this file>` so `import { add } from
// "mathlib";` in calc/src/main.ts resolves at bundle time.

export function add(a: number, b: number): number {
  return a + b;
}
