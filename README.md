# Evospace Lua API

Type definitions for the Evospace modding API, version **0.22.0** — 151 classes.

Generated: `library/api.lua` is dumped from the game's live Lua registry by an editor run, and
`api.json` is the same registry as structured data, carrying which members are codegen boilerplate
and which types are internal. Edits here are overwritten by the next release; the API itself changes
in the game's own sources.

## Install

With the Lua extension for VS Code, add the addon to a mod workspace:

```json
{
    "Lua.workspace.library": ["path/to/this/repo/library"],
    "Lua.runtime.version": "LuaJIT",
    "Lua.diagnostics.disable": ["inject-field"]
}
```

Cloning the repository next to the mod and pointing at `library` is enough — completion, parameter
hints and type errors follow from the stubs.

## Versions

Each release is tagged `v<version>`. A mod declares the game version it targets in its own
`info.json`; take the addon tag that matches it.
