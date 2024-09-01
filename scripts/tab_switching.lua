local tabs = {
    [0] = "Brinstar", "Kraid", "Norfair", "Ridley", "Tourian", "Crateria", "Chozodia"
}

function GetAreaSwitchingKey()
    return string.format("mzm_area_%s_%s", Archipelago.TeamNumber, Archipelago.PlayerNumber)
end

function SwitchTab(value)
    if value then
        Tracker:UiHint("ActivateTab", tabs[value])
    else
        Tracker:UiHint("ActivateTab", tabs[0])
    end
end
