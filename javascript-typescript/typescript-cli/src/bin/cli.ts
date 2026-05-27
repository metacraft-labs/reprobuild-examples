#!/usr/bin/env node
// Minimal TypeScript CLI entry point. The standard provider will
// bundle this via esbuild (Mode A §A5); the hashbang on line 1 is
// preserved into the emitted dist/bin/cli.js so the launcher can
// exec it directly on POSIX hosts.

console.log("hello from typescript-cli-example");
