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
    return function()
        for _, v in pairs(arg) do
            if v() then
                return true
            end
        end
        return false
    end
end

function All(...)
    return function()
        for _, v in pairs(arg) do
            if not v() then
                return false
            end
        end
        return true
    end
end
