// Smoke test for the typescript-cli fixture. The M21 JS/TS convention
// discovers ``test/**/*.test.ts`` (and ``src/**/*.test.ts``) and emits a
// per-test ``node --test --import=tsx`` action against each file.
//
// The test is intentionally trivial — its purpose is to exercise the M21
// A7 test-discovery + test-target emission path, not to validate the CLI's
// behaviour. The CLI's runtime behaviour is asserted by the
// validate-standard-provider-typescript-cli.ps1 script which executes the
// produced launcher shim.

import { test } from 'node:test';
import assert from 'node:assert/strict';

test('arithmetic baseline', () => {
  assert.equal(1 + 1, 2);
});

test('greeting concatenation', () => {
  const subject = 'world';
  assert.equal(`hello, ${subject}`, 'hello, world');
});
