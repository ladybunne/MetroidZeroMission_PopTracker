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

    GOAL = slot_data["goal"] == 1
    HEATRUNS_LAVADIVES = slot_data["heatruns"] == 1
    WALLJUMPS_IN_LOGIC = slot_data["walljump_logic"] == 1
    LAYOUT_PATCHES = slot_data["layout_patches"] == 1
    UNKNOWN_ITEMS_ALWAYS_USABLE = slot_data["unknown_items"] == 1
    IBJ_IN_LOGIC = slot_data["ibj_logic"] == 1
end