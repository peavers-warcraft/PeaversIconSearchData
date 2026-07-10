# PeaversIconSearchData

Item name to icon fileID data for World of Warcraft, generated from wago.tools db2 exports.

[peavers.io](https://peavers.io) | [Report Issues](https://github.com/peavers-warcraft/PeaversIconSearchData/issues)

## Features

- Every player-visible item name mapped to its icon fileID, with slot/armor-type search tags (e.g. "cloth shoulder", "sword 2h")
- Refreshed daily against the latest retail build by the `iconsearch-module` Lambda in PeaversAddonDataSupplier
- Clean public API consumed by [PeaversIconSearch](https://github.com/peavers-warcraft/PeaversIconSearch) and available to any addon
- No configuration, no saved variables — pure data provider

## API

The addon exposes a global `PeaversIconSearchData.API`:

```lua
local API = PeaversIconSearchData.API

-- Take ownership of the icon database: a table of large string chunks, each
-- holding "iconFileID:Item Name<TAB>search tags" lines sorted by name.
-- Returns nil on subsequent calls — the caller owns (and can free) the data.
local chunks = API.TakeItemIconData()
local blob = table.concat(chunks, "\n")
```

The data ships as raw string chunks rather than 80k+ table entries so consumers can
search it as a single string, keeping load time and memory low.

## Installation

Installed automatically as a dependency of PeaversIconSearch, or manually from CurseForge.
