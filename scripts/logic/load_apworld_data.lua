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
