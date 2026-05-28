// Minimal webpack configuration. Using ``.cjs`` extension so the
// CommonJS ``module.exports`` syntax is unambiguous even though
// ``package.json`` declares ``"type": "module"`` (which would make
// bare ``.js`` files ESM).
//
// The presence of ``webpack.config.*`` at the project root is what
// triggers the M24 Mode B routing in the reprobuild standard
// provider's JavaScript/TypeScript convention.

const path = require('node:path');

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'index.js',
    library: {
      type: 'module'
    },
    clean: true
  },
  experiments: {
    outputModule: true
  },
  target: 'node20'
};
