# Lua WASI build

This is a [WASI](https://wasi.dev/) build of the Lua 5.4 interpreter, compiled with [wasienv](https://github.com/wasienv/wasienv).

It is published as an NPM package [@antonz/lua-wasi](https://www.npmjs.com/package/@antonz/lua-wasi):

```
https://unpkg.com/@antonz/lua-wasi/dist/lua.wasm
```

## Usage

Using the [Runno](https://github.com/nalgeon/runno) runtime:

```js
import { WASI } from "https://unpkg.com/@antonz/runno/dist/runno.mjs";

const url = "https://unpkg.com/@antonz/lua-wasi/dist/lua.wasm";
const result = await WASI.start(fetch(url), {
    args: ["lua", "-v"],
    stdout: (out) => console.log(out),
    stderr: (err) => console.error(err),
});
console.log(`exit code = ${result.exitCode}`);
```

Result:

```
Lua 5.4.6  Copyright (C) 1994-2023 Lua.org, PUC-Rio
exit code = 0
```

## Limitations

No detailed error messages for syntax errors in code.

No exception handling with `pcall`.

Unsupported stdlib functions:

```
io.tmpfile
os.execute
os.tmpname
```

## Building from source

```
make
make dist
```

## License

Copyright 2024 [Anton Zhiyanov](https://antonz.org/), MIT License.

Lua is copyrighted by [Lua.org](https://www.lua.org/license.html), PUC-Rio, MIT License.
