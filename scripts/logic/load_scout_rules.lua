-- Also load scoutables here. Just for now.

scout_rules = {
    -- Brinstar
    ["Brinstar Ceiling E-Tank"] = MorphBall,
    ["Brinstar Ballspark"] = Any(
        CanSingleBombBlock,
        Any(
            CanFlyWall,
            PowerGrip
        )
    ),
    ["Brinstar Speed Booster Shortcut"] = function() return true end,
    ["Brinstar Acid near Varia"] = All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            CanTrickySparks
        ),
        CanBallJump
    ),
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
    ["Kraid Acid Ballspark"] = All(
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            HiJump
        ),
        CanBallJump,
        CanBombTunnelBlock,
        Any(
            VariaSuit
        )
    ),
    ["Kraid Speed Jump"] = All(
        Missiles,
        Any(
            VariaSuit,
            Hellrun(1)
        )
    ),

    -- Norfair
    ["Norfair Next to Screw Attack"] = function() return true end,
    ["Norfair Hallway to Crateria"] = function() return true end,
    ["Norfair Bomb Trap"] = CanReachLocation("Norfair Heated Room Under Brinstar Elevator"),
    ["Norfair Big Room"] = function() return true end,
    ["Norfair Right Shaft Near Hi-Jump"] = function() return true end,

    -- Ridley

    -- Tourian

    -- Crateria

    -- Chozodia

}