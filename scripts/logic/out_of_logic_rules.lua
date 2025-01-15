out_of_logic_access_rules = {
    -- These are to suggest that it's very possible to beat bosses without
    -- the prerequisite item counts, so long as you're confident.
    ["Kraid Speed Booster"] = True,
    ["Kraid"] = True,
    ["Kraid Under Acid Worm"] = True,

    -- This needs work.
    ["Mother Brain"] = False,
}

out_of_logic_access_rules_ignore_region = {
    ["Ridley Behind Unknown Statue"] = CanReachRegion("Central Ridley"),
    ["Ridley Unknown Item Statue"] = CanReachRegion("Central Ridley"),
    ["Ridley"] = CanReachRegion("Central Ridley")
}