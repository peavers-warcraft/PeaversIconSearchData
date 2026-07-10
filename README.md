# PeaversIconSearchData

A data library addon for World of Warcraft that maps item names and search tags to icon fileIDs, updated daily from wago.tools db2 exports.

## Features

<!-- peavers:features -->
- Every player-visible item name mapped to its icon fileID, with slot/armor-type search tags (e.g. "cloth shoulder", "sword 2h")
- Refreshed daily against the latest retail build by the `iconsearch-module` Lambda in PeaversAddonDataSupplier
- Clean public API consumed by [PeaversIconSearch](https://github.com/peavers-warcraft/PeaversIconSearch) and available to any addon
- No configuration, no saved variables — pure data provider
<!-- /peavers:features -->

<!-- peavers:custom -->
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
<!-- /peavers:custom -->

## Installation

This is a data library used by other Peavers addons and doesn't require direct user interaction. [PeaversUpdater](https://github.com/peavers-warcraft/PeaversUpdater/releases/latest) installs and updates it automatically alongside its parent addon, or download it directly from [CurseForge](https://www.curseforge.com/wow/addons/peaversiconsearchdata).

---

*Part of the [Peavers](https://peavers.io) addon collection · [Report an issue](https://github.com/peavers-warcraft/PeaversIconSearchData/issues) · [Support development on Patreon](https://www.patreon.com/Peavers)*
