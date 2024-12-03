require("scripts.utils")

local REGIONS = {}

local function create_region_temp(name)
    REGIONS[name] = {}
end

local function connect_regions_temp(entrance_name, source, target, rule)
    REGIONS[source][entrance_name] = {
        ["rule"] = rule,
        ["region"] = target
    }
end

create_region_temp("House 0")
create_region_temp("House 1")
create_region_temp("House 2A")
create_region_temp("House 2B")
create_region_temp("House 2C")
create_region_temp("House 3")
create_region_temp("House 4")

local road_blocked = false

connect_regions_temp("Street 0", "House 0", "House 1")
connect_regions_temp("Street 1", "House 1", "House 2A")
connect_regions_temp("Street 2", "House 1", "House 2B")
connect_regions_temp("Street 3", "House 1", "House 2C")
connect_regions_temp("Street 4", "House 2A", "House 3")
connect_regions_temp("Street 5", "House 2B", "House 3", function() return road_blocked end)
connect_regions_temp("Street 6", "House 2C", "House 3", function() return false end)
connect_regions_temp("Street 7", "House 3", "House 4", function() return false end)

local road_blocked = true

local start_region = "House 0"

-- Should remember to cache accessible regions so we're not unnecessarily rechecking them.

-- Using tail recursion.
local function CanReachRegion(goal, region, entrance, accessible)
    -- print(goal, accessible and accessible[region] or region, entrance)
    -- First call just has goal, so load region.
    if not accessible then
        return CanReachRegion(goal, 1, nil, {start_region})
    end

    -- If no region, we're done.
    if not region then
        return false
    end

    -- If no entrance, we're at the start of the area.
    if not entrance then
        -- If there are no entrances here...
        if not next(REGIONS[accessible[region]]) then
            -- Go to the next region.
            return CanReachRegion(goal, next(accessible, region), nil, accessible)
        end
        return CanReachRegion(goal, region, next(REGIONS[accessible[region]]), accessible)
    end

    -- Avoid having multiple copies of the same region, and test if we can reach our goal.
    local region_already_accessible = false
    for k,v in pairs(accessible) do
        -- Success
        if v == goal then
            return true
        end
        if v == REGIONS[accessible[region]][entrance].region then
            region_already_accessible = true
            break
        end
    end

    -- Test the entrance's access rule.
    if not region_already_accessible and
        not REGIONS[accessible[region]][entrance].rule or
        REGIONS[accessible[region]][entrance].rule() then
        table.insert(accessible, region + 1, REGIONS[accessible[region]][entrance].region)
    end

    -- print(DumpTable(REGIONS[accessible[region]]))
    -- Attempt to move to next region if all entrances here are exhausted.
    if not next(REGIONS[accessible[region]], entrance) then
        return CanReachRegion(goal, next(accessible, region), nil, accessible)
    end

    return CanReachRegion(goal, region, next(REGIONS[accessible[region]], entrance), accessible)
end

print("1: ", CanReachRegion("House 1"), "\n")
print("2: ", CanReachRegion("House 2C"), "\n")
print("3: ", CanReachRegion("House 3"), "\n")
print("4: ", CanReachRegion("House 4"), "\n")
