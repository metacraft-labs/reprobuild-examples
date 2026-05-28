// Minimal webpack app entry. Webpack bundles this file (plus any
// transitive imports) into ``dist/index.js``.

export function greet(name) {
  return `hello, ${name}`;
}

export default greet;
