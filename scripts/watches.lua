-- File for watches, which can be loaded last.

function SwitchTabOnAutoSwitchOptionEnabled(code)
    if Tracker:FindObjectForCode(code).CurrentStage == 1 then
        SwitchTab(CURRENT_TAB_VALUE)
    end
end

-- Caching images for performance reasons.
local unknown_items_known = {
    ["PlasmaBeam"] = ImageReference:FromPackRelativePath("images/PlasmaBeam.png"),
    ["SpaceJump"] = ImageReference:FromPackRelativePath("images/SpaceJump.png"),
    ["GravitySuit"] = ImageReference:FromPackRelativePath("images/GravitySuit.png")
}
local unknown_items_known_disabled = {
    ["PlasmaBeam"] = ImageReference:FromImageReference(unknown_items_known["PlasmaBeam"], "@disabled"),
    ["SpaceJump"] = ImageReference:FromImageReference(unknown_items_known["SpaceJump"], "@disabled"),
    ["GravitySuit"] = ImageReference:FromImageReference(unknown_items_known["GravitySuit"], "@disabled")
}
local unknown_items_unknown = {
    ["PlasmaBeam"] = ImageReference:FromPackRelativePath("images/UnknownPlasmaBeam.png"),
    ["SpaceJump"] = ImageReference:FromPackRelativePath("images/UnknownSpaceJump.png"),
    ["GravitySuit"] = ImageReference:FromPackRelativePath("images/UnknownGravitySuit.png")
}
local unknown_items_unknown_disabled = {
    ["PlasmaBeam"] = ImageReference:FromImageReference(unknown_items_unknown["PlasmaBeam"], "@disabled"),
    ["SpaceJump"] = ImageReference:FromImageReference(unknown_items_unknown["SpaceJump"], "@disabled"),
    ["GravitySuit"] = ImageReference:FromImageReference(unknown_items_unknown["GravitySuit"], "@disabled")
}

-- You can't change the name of JSON items... apparently... which makes this useless. Unfortunate.
-- If that ever changes I'll wire these up.
local unknown_items_names_known = {
    ["PlasmaBeam"] = "Plasma Beam",
    ["SpaceJump"] = "Space Jump",
    ["GravitySuit"] = "Gravity Suit"
}
local unknown_items_names_unknown = {
    ["PlasmaBeam"] = "Unknown Item 1 (Plasma Beam)",
    ["SpaceJump"] = "Unknown Item 2 (Space Jump)",
    ["GravitySuit"] = "Unknown Item 3 (Gravity Suit)"
}

function UpdateUnknownItemIcon(item)
    local item_object = Tracker:FindObjectForCode(item)
    if not item_object then
        return
    elseif CanUseUnknownItems() then
        -- item_object.Name = unknown_items_names_known[item]
        item_object.Icon = item_object.Active and unknown_items_known[item] or unknown_items_known_disabled[item]
        item_object:SetOverlay("")
    else
        -- item_object.Name = unknown_items_names_unknown[item]
        item_object.Icon = item_object.Active and unknown_items_unknown[item] or unknown_items_unknown_disabled[item]
        item_object:SetOverlay("X")
        item_object:SetOverlayFontSize(14)
        item_object:SetOverlayBackground(item_object.Active and "#FF0000" or "#888888")
    end
end

function UpdateUnknownPlasmaBeam() UpdateUnknownItemIcon("PlasmaBeam") end
function UpdateUnknownSpaceJump() UpdateUnknownItemIcon("SpaceJump") end
function UpdateUnknownGravitySuit() UpdateUnknownItemIcon("GravitySuit") end

function UpdateUnknownItemIcons()
    UpdateUnknownPlasmaBeam()
    UpdateUnknownSpaceJump()
    UpdateUnknownGravitySuit()
end

