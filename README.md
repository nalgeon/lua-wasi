# Lua WASI build

This is a [WASI](https://wasi.dev/) build of the Lua 5.4 interpreter, compiled with [wasienv](https://github.com/wasienv/wasienv).

It is published as an NPM package [@antonz/lua-wasi](https://www.npmjs.com/package/@antonz/lua-wasi):

```
https://unpkg.com/@antonz/lua-wasi/dist/index.js
https://unpkg.com/@antonz/lua-wasi/dist/lua.wasm
```

## Usage

Using the [Runno](https://github.com/nalgeon/runno) runtime:

```js
import lua from "https://unpkg.com/@antonz/lua-wasi/dist/index.js";
import { WASI } from "https://unpkg.com/@antonz/runno/dist/runno.mjs";

const wasm = lua.load();
const result = await WASI.start(wasm, {
    args: ["lua", "-v"],
    stdout: (out) => console.log(out),
    stderr: (err) => console.error(err),
});
console.log("exit code =", result.exitCode);
```

## Building from source

```
make
make dist
```

## License

Copyright 2024 [Anton Zhiyanov](https://antonz.org/), MIT License.

Lua is copyrighted by [Lua.org](https://www.lua.org/license.html), PUC-Rio, MIT License.
