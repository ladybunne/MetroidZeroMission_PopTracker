DEBUG = true
ENABLE_DEBUG_LOG = true

-- Items
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/events.json")
Tracker:AddItems("items/options.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations.json")

-- Non-logic helpers
ScriptHost:LoadScript("scripts/utils.lua")

ScriptHost:LoadScript("scripts/tab_switching.lua")
ScriptHost:LoadScript("scripts/logic/yaml_options.lua")
ScriptHost:LoadScript("scripts/logic/events.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/helpers.lua")
ScriptHost:LoadScript("scripts/logic/requirements.lua")

    -- From apworld
    ScriptHost:LoadScript("scripts/logic/from_apworld/location_region_mappings.lua")
    ScriptHost:LoadScript("scripts/logic/from_apworld/location_rules.lua")
    ScriptHost:LoadScript("scripts/logic/from_apworld/region_rules.lua")
    ScriptHost:LoadScript("scripts/logic/from_apworld/create_regions.lua")

ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/load_apworld_data.lua")
ScriptHost:LoadScript("scripts/logic/load_scout_rules.lua")

-- Layouts
-- Tracker:AddLayouts("layouts/equipment_horizontal.json")
Tracker:AddLayouts("layouts/equipment_vertical.json")
Tracker:AddLayouts("layouts/events1.json")
Tracker:AddLayouts("layouts/events2.json")
-- Tracker:AddLayouts("layouts/tracker_horizontal.json")
Tracker:AddLayouts("layouts/tracker_vertical.json")
Tracker:AddLayouts("layouts/options.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- Autotracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end


-- Extra init stuff


-- Watch for auto swap tab option changing
-- This is the nichest of niche UX improvements, but I like it, and that's what matters.
ScriptHost:AddWatchForCode("AutoSwitchTabOnOptionEnabled", "auto_switch_tabs", SwitchTabOnAutoSwitchOptionEnabled)
