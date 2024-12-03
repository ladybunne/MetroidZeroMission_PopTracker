-- Access rules

-- List of all tables from `location_rules.lua`
-- These are provided "automatically" (actually manually, don't tell anyone)
-- When the apworld updates, that file needs to be updated too, and if there
-- are any new tables there, they need to be added here as well.
local location_tables_from_apworld = {
  brinstar_start,
  brinstar_main,
  brinstar_top,
  brinstar_pasthives,
  kraid_main,
  kraid_acidworm_area,
  kraid_left_shaft,
  kraid_bottom,
  norfair_main,
  norfair_right_shaft,
  norfair_upper_right,
  norfair_behind_ice,
  norfair_lowerrightshaft,
  lower_norfair,
  norfair_screwattack,
  norfair_behind_superdoor,
  norfair_bottom,
  ridley_main,
  ridley_left_shaft,
  ridley_sw_puzzle,
  ridley_right_shaft,
  ridley_right_speed_puzzles,
  ridley_central,
  ridley_room,
  tourian,
  crateria_main,
  crateria_upper,
  chozodia_ruins_crateria_entrance,
  chozodia_ruins_test,
  chozodia_under_tube,
  chozodia_mothership,
  chozodia_pb_area,
  chozodia_mecha_ridley_hall
}

local location_region_mappings_from_apworld = {
  brinstar_location_table,
  kraid_location_table,
  norfair_location_table,
  ridley_location_table,
  tourian_location_table,
  crateria_location_table,
  chozodia_location_table,
}

access_rules = {}
location_regions = {}

-- Unpack all tables in `tables_from_apworld` and put them all in one table!
for k, v in pairs(location_tables_from_apworld) do
  for k2, v2 in pairs(v) do
      access_rules[k2] = v2
      -- print(string.format("%s, %s", k2, v2))
  end
end

-- Do the same with location region mappings.
for k, v in pairs(location_region_mappings_from_apworld) do
  for k2, v2 in pairs(v) do
      location_regions[k2] = v2
      -- print(string.format("%s, %s", k2, v2))
  end
end

local out_of_logic_access_rules = {}

local scout_rules = {
  ["Brinstar Ceiling E-Tank"] = function() return true end
}

-- Ingress point for locations.json asking for logic.
-- Takes a string, runs it through predicates and returns the most suitable accessibility level.
function CanReach(location)
  -- Very jank, but... if it's the first check, update accessible_regions.
  if location == "Brinstar Morph Ball" then
    ACCESSIBLE_REGIONS = GetAccessibleRegions()
  end

  -- Get access rules for the location.
  local access_rule = access_rules[location]
  local out_of_logic_access_rule = out_of_logic_access_rules[location]
  local scout_rule = scout_rules[location]

  -- If the regular access rule isn't present, the location doesn't exist in logic.
  -- Whether or not that means it's accessible is, at this point, a philosophical exercise.
  -- I've decided to go with "no".
  if not access_rule then
    print(string.format("Location %s doesn't exist in logic.", location))
    return AccessibilityLevel.None
  end

  -- Test that its region is accessible.
  if not CanReachRegion(location_regions[location]) then
    return AccessibilityLevel.None
  end

  -- Test each subsequent rule.
  if access_rule() then
    return AccessibilityLevel.Normal
  elseif out_of_logic_access_rule and out_of_logic_access_rule() then
    return AccessibilityLevel.SequenceBreak
  elseif scout_rule and scout_rule() then
    return AccessibilityLevel.Inspect
  end

  -- Otherwise it's not accessible.
  return AccessibilityLevel.None
end
