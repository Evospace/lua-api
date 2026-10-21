# Evospace Lua API

Type definitions for the Evospace modding API, version **0.22.2** — 168 classes.

The game runs mods on Luau. Generated: `library/api.lua` is dumped from the game's live Lua
registry by an editor run, `evospace.d.luau` is the same API as Luau definitions, and `api.json`
is the registry as structured data, carrying which members are codegen boilerplate and which types
are internal. Edits here are overwritten by the next release; the API itself changes in the game's
own sources.

## Install

### luau-lsp

With the Luau Language Server extension for VS Code, point a mod workspace at the definitions:

```json
{
    "luau-lsp.platform.type": "standard",
    "luau-lsp.sourcemap.enabled": false,
    "luau-lsp.types.definitionFiles": ["path/to/this/repo/evospace.d.luau"]
}
```

This is the one that reads Luau itself: type annotations, `+=`, `continue`, if-expressions and
the `--!sim` chunks, whose `column` and `integer` the definitions declare as numbers.

A count or a value in a sim chunk is annotated `number`: the server has an `integer` type of its
own, and the definitions do not use it.

`require` is Luau's require-by-string, the rules the server applies too:

- `./x` and `../x` from the requiring file, `@self/x` from a mod's `init.lua`;
- `@ModName/x` from the mod itself or from a mod in its `dependencies`;
- a bare name, an absolute path and a path above the mod root are errors;
- a module returns exactly one value.

A `.luaurc` in the folder that holds the mods gives the server the same mod names and keeps it from
flagging the `--!sim` directive:

```json
{
    "lint": { "CommentDirective": false },
    "aliases": { "Vanilla": "./Vanilla", "VanillaLib": "./VanillaLib" }
}
```

### LuaLS

With the Lua extension for VS Code, add the addon to a mod workspace:

```json
{
    "Lua.workspace.library": ["path/to/this/repo/library"],
    "Lua.runtime.version": "Lua 5.1",
    "Lua.diagnostics.disable": ["inject-field"]
}
```

LuaLS does not parse Luau syntax, so it suits mods written in plain Lua 5.1.

## Versions

Each release is tagged `v<version>`. A mod declares the game version it targets in its own
`info.json`; take the addon tag that matches it.
