import * as wasem from '../../wasem.js/wasem.js';

const rasm_imports = {
};

export function load(path, custom_imports) {
  let imports = {};
  [rasm_imports, custom_imports].forEach(function (imports_container) {
    for (const key in imports_container) {
      imports[key] = imports_container[key];
    }
  });
  return wasem.load(path, imports);
}
