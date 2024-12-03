-- Also load scoutables here. Just for now.

scout_rules = {
    -- Brinstar
    ["Brinstar Ceiling E-Tank"] = function() return true end,
    ["Brinstar Ballspark"] = Any(
        CanSingleBombBlock,
        Any(
            CanFlyWall,
            PowerGrip
        )
    ),
    ["Brinstar Speed Booster Shortcut"] = function() return true end,
    -- This one needs the initial climb's logic written out.
    ["Brinstar Acid near Varia"] = function() return false end,
    ["Brinstar Under Bridge"] = Any(
        Missiles,
        CanReachRegion("Brinstar Past Hives")
    ),
    ["Brinstar Behind Bombs"] = Missiles,

    -- Kraid
    ["Kraid Behind Giant Hoppers"] = function() return true end,
    ["Kraid Zipline Morph Jump"] = function() return true end,
    ["Kraid Quad Ball Cannon Room"] = function() return true end,
    -- This is doable in a few ways: savescumming obviously. Otherwise, you can get down,
    -- see the item then get back up in around 200-400 energy. No energy requirement with 
    -- Varia, and not even any tools - you can use the breakable blocks strategically.
    -- Without Varia you're on the clock, have to move fast and can't be as patient with
    -- the blocks.
    -- 
    -- Time this later.
    ["Kraid Acid Ballspark"] = Any(
        VariaSuit
    ),
    ["Kraid Speed Jump"] = All(
        Missiles,
        Any(
            VariaSuit,
            Hellrun(1)
        )
    ),
    ["Kraid Upper Right Morph Ball Cannon"] = Missiles

    -- Norfair

    -- Ridley

    -- Tourian

    -- Crateria

    -- Chozodia

}