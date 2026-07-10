local _, addonTable = ...

-- Create the global addon table
_G["PeaversIconSearchData"] = _G["PeaversIconSearchData"] or {}
local publicAPI = _G["PeaversIconSearchData"]

-- Create the API namespace
publicAPI.API = publicAPI.API or {}
local API = publicAPI.API

---Returns the item icon database and releases this addon's reference to it.
---The database is a table of large string chunks, each holding lines of
---"iconFileID:Item Name<TAB>search tags" sorted by name (see src\Data\ItemIcons.lua).
---Handing over ownership lets the caller free the chunks after concatenating,
---so the data is never held in memory twice. Subsequent calls return nil.
---@return table|nil chunks Array of newline-joined line chunks, or nil if already taken
function API.TakeItemIconData()
	local data = addonTable.ItemIconData
	addonTable.ItemIconData = nil
	return data
end
