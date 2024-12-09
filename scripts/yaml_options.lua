function LoadOptions(slot_data)
    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        local obj = Tracker:FindObjectForCode(k)
        if obj then
            if obj.Type == "toggle" then
                obj.Active = v >= 1
            elseif obj.Type == "progressive" then
                obj.CurrentStage = v
            end
        end
    end
end
