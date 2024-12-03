function testing(a)

end

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

create_region_temp("House 1")
create_region_temp("House 2A")
create_region_temp("House 2B")
create_region_temp("House 2C")
create_region_temp("House 3")
create_region_temp("House 4")

local road_blocked = false

connect_regions_temp("Street 1", "House 1", "House 2A", function() return true end)
connect_regions_temp("Street 2", "House 1", "House 2B", function() return true end)
connect_regions_temp("Street 3", "House 1", "House 2C", function() return true end)
connect_regions_temp("Street 4", "House 2A", "House 3", function() return true end)
connect_regions_temp("Street 5", "House 2B", "House 3", function() return road_blocked end)
connect_regions_temp("Street 6", "House 2C", "House 3", function() return false end)
connect_regions_temp("Street 7", "House 3", "House 4", function() return false end)

local road_blocked = true

local start_region = "House 1"

-- Should remember to cache accessible regions so we're not unnecessarily rechecking them.

-- Using tail recursion.
local function CanReachRegionTemp(goal, region, entrance, accessible)
    print(goal, accessible and accessible[region] or region, entrance)
    -- Start
    if not region then
        return CanReachRegionTemp(goal, 1, next(REGIONS[start_region]), {start_region})
    end

    local region_already_accessible = false
    for k,v in pairs(accessible) do
        -- Success
        if v == goal then
            return true
        end
        -- Avoid having multiple copies of the same region
        if v == REGIONS[accessible[region]][entrance].region then
            region_already_accessible = true
            break
        end
    end

    -- Test
    if not region_already_accessible and REGIONS[accessible[region]][entrance].rule() then
        table.insert(accessible, REGIONS[accessible[region]][entrance].region)

        -- This is really bad.
        table.sort(accessible)
    end

    -- Failure
    if not next(REGIONS[accessible[region]], entrance) and
    not next(accessible, region) then
        return false
    end

    local next_region = region
    local next_entrance = next(REGIONS[accessible[region]], entrance)

    if not next_entrance then
        next_region = next(accessible, region)
        if next_region then
            next_entrance = next(REGIONS[accessible[next_region]])
        end
    end

    return CanReachRegionTemp(goal, next_region, next_entrance, accessible)
end

print("1: ", CanReachRegionTemp("House 1"), "\n")
print("2: ", CanReachRegionTemp("House 2C"), "\n")
print("3: ", CanReachRegionTemp("House 3"), "\n")
print("4: ", CanReachRegionTemp("House 4"), "\n")
