DEBUG = true
ENABLE_DEBUG_LOG = true

-- Lua
ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/tab_switching.lua")
ScriptHost:LoadScript("scripts/logic/yaml_options.lua")
ScriptHost:LoadScript("scripts/logic/events.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Items
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/events.json")
Tracker:AddItems("items/options.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations.json")

-- Layouts
Tracker:AddLayouts("layouts/equipment.json")
Tracker:AddLayouts("layouts/events.json")
Tracker:AddLayouts("layouts/map.json")
Tracker:AddLayouts("layouts/options.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- Autotracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

-- Load default options
LoadDefaultOptions()