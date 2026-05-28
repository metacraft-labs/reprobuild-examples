// Minimal Vite configuration. The presence of ``vite.config.js`` at
// the project root is what triggers the M24 Mode B routing in the
// reprobuild standard provider's JavaScript/TypeScript convention.
//
// The build's headline output is a static site under ``dist/`` — the
// crude fallback declares ``dist/`` as an opaque output directory.

import { defineConfig } from 'vite';

export default defineConfig({
  root: '.',
  build: {
    outDir: 'dist',
    emptyOutDir: true,
    // Use library mode with a minimal entry so vite produces a
    // deterministic, self-contained bundle without needing an HTML
    // entry point.
    lib: {
      entry: 'src/index.js',
      formats: ['es'],
      fileName: 'index'
    },
    // Skip the dependency graph optimisation for this minimal fixture.
    rollupOptions: {
      external: []
    }
  }
});
