-- yaml options - defaults for now until I can wire them up.

GOAL = false
HEATRUNS_LAVADIVES = false
WALLJUMPS_IN_LOGIC = true
LAYOUT_PATCHES = true
UNKNOWN_ITEMS_ALWAYS_USABLE = true
IBJ_IN_LOGIC = false

CAN_TRICKY_SPARKS = false
CHOZODIA_ACCESS = false


function LoadOptions(slot_data)
    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        local obj = Tracker:FindObjectForCode(k)
        if obj then
            obj.Active = v == 1
        end
    end
end

function WalljumpsInLogic()
    return Tracker:FindObjectForCode("walljump_logic").Active
end


-- {
--     ["death_link"] = 0,
--     ["logic_difficulty"] = 0,
--     ["unknown_items"] = 1,
--     ["remote_items"] = 1,
--     ["tricky_shinesparks"] = 0,
--     ["ibj_logic"] = 0,
--     ["goal"] = 1,
--     ["walljump_logic"] = 1,
--     ["heatruns"] = 0,
--     ["layout_patches"] = 1,
-- }