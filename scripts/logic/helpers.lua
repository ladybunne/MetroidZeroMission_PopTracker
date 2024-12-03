-- Helpers - these all return functions, keep in mind.

function Has(item, amount)
    return function()
        local count = Tracker:ProviderCountForCode(item)
        amount = tonumber(amount)
        if not amount then
            return count > 0
        else
            return count >= amount
        end
    end
end

function Event(flag)
    return function()
        local obj = Tracker:FindObjectForCode(flag)
        if not obj then
            return false
        end
        return obj.Active
    end
end

function OptionIs(option, value)
    return function()
        local obj = Tracker:FindObjectForCode(option)
        if not obj then
            return false
        end
        if obj.Type == "toggle" then
            return obj.Active == value
        elseif obj.Type == "progressive" then
            return obj.CurrentStage == value
        end
    end
end

function OptionAtLeast(option, value)
    return function()
        local obj = Tracker:FindObjectForCode(option)
        if not obj then
            return false
        end
        if obj.Type == "toggle" then
            return obj.Active == value
        elseif obj.Type == "progressive" then
            return obj.CurrentStage >= value
        end
    end
end

function Any(...)
    local args = {...}
    return function()
        if not args then
            return true
        end
        for _, element in pairs(args) do
            if element() then
                return true
            end
        end
        return false
    end
end

function All(...)
    local args = {...}
    return function()
        if not args then
            return true
        end
        for _, element in pairs(args) do
            if not element() then
                return false
            end
        end
        return true
    end
end

--- Region stuff

REGIONS = {}
local start_region = "Menu"

function CreateRegion(name)
    REGIONS[name] = {}
end

function ConnectRegions(entrance_name, source, target, rule)
    REGIONS[source][entrance_name] = {
        ["rule"] = rule,
        ["region"] = target
    }
end

ACCESSIBLE_REGIONS = {}

function GetAccessibleRegions(region, entrance, accessible)
    if not accessible then
        ACCESSIBLE_REGIONS = {}
        return GetAccessibleRegions(1, nil, {start_region})
    end

    if not region then
        return accessible
    end

    if not entrance then
        if not next(REGIONS[accessible[region]]) then
            return GetAccessibleRegions(next(accessible, region), nil, accessible)
        end
        return GetAccessibleRegions(region, next(REGIONS[accessible[region]]), accessible)
    end

    local region_already_accessible = false
    for k,v in pairs(accessible) do
        if v == REGIONS[accessible[region]][entrance].region then
            region_already_accessible = true
            break
        end
    end

    if not region_already_accessible and
        not REGIONS[accessible[region]][entrance].rule or
        REGIONS[accessible[region]][entrance].rule() then
        table.insert(accessible, region + 1, REGIONS[accessible[region]][entrance].region)
    end

    if not next(REGIONS[accessible[region]], entrance) then
        return GetAccessibleRegions(next(accessible, region), nil, accessible)
    end

    return GetAccessibleRegions(region, next(REGIONS[accessible[region]], entrance), accessible)
end

function CanReachRegion(goal, region, entrance, accessible)
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

    -- print(DumpTable(accessible))
    -- Attempt to move to next region if all entrances here are exhausted.
    if not next(REGIONS[accessible[region]], entrance) then
        return CanReachRegion(goal, next(accessible, region), nil, accessible)
    end

    return CanReachRegion(goal, region, next(REGIONS[accessible[region]], entrance), accessible)
end

function CanReachEntrance(goal)
    return function()
        return true
    end
end

-- function CanReachEntrance(goal, region, entrance, accessible)
--     -- Start
--     if not region then
--         return CanReachEntrance(goal, 1, next(REGIONS[start_region]), {start_region})
--     end

--     -- Success
--     if entrance == goal then
--         return true
--     end

--     local region_already_accessible = false
--     for k,v in pairs(accessible) do
--         -- Avoid having multiple copies of the same region
--         if v == REGIONS[accessible[region]][entrance].region then
--             region_already_accessible = true
--             break
--         end
--     end

--     -- Test
--     if not region_already_accessible and REGIONS[accessible[region]][entrance].rule() then
--         table.insert(accessible, REGIONS[accessible[region]][entrance].region)

--         -- This is really bad.
--         table.sort(accessible)
--     end

--     -- Failure
--     if not next(REGIONS[accessible[region]], entrance) and
--     not next(accessible, region) then
--         return false
--     end

--     local next_region = region
--     local next_entrance = next(REGIONS[accessible[region]], entrance)

--     if not next_entrance then
--         next_region = next(accessible, region)
--         if next_region then
--             next_entrance = next(REGIONS[accessible[next_region]])
--         end
--     end

--     return CanReachEntrance(goal, next_region, next_entrance, accessible)
-- end
