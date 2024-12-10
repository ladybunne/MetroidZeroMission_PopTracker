-- Load scoutables here.
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
    ["Brinstar Speed Booster Shortcut"] = True,
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
    ["Kraid Behind Giant Hoppers"] = True,
    ["Kraid Zipline Morph Jump"] = True,
    ["Kraid Quad Ball Cannon Room"] = True,
    -- This is doable in a few ways: savescumming, obviously. Otherwise, you can get down,
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
    ["Norfair Lava Dive Right"] = All(
        -- To get in...
        Any(
            -- This can be scouted with 299, but you'll die. Maybe that's fine?
            Hellrun(2)
        )
        -- And to get out... you need quite a bit more, as well as some way to climb out.
        -- I'd estimate around 499-599 energy, and either Power Grip or walljumps.
        -- Other methods of flight don't work since you're underwater.
    ),
    ["Norfair Next to Screw Attack"] = True,
    ["Norfair Hallway to Crateria"] = True,
    ["Norfair Bomb Trap"] = CanReachLocation("Norfair Heated Room Under Brinstar Elevator"),
    ["Norfair Heated Room Below Wave - Left"] = CanReachLocation("Norfair Heated Room Below Wave - Right"),
    ["Norfair Big Room"] = True,
    ["Norfair Right Shaft Near Hi-Jump"] = True,

    -- Ridley
    ["Ridley Southwest Puzzle Top"] = All(
        -- Some of this may be redundant, as I think you might just be able to
        -- get the check if you can make it to the point where you can see it.

        -- Get past first bit (slow pit block)
        Any(
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    HiJump,
                    SpaceJump,
                    CanWallJump
                )
            )
        ),
        -- Get past second bit (missile block and fast pit block)
        All(
            Missiles,
            Any(
                PowerGrip,
                SpaceJump,
                -- This is hyper cursed and requires a frame-perfect pit block jump.
                -- Might make it advanced logic, normal players are not going to do this.
                All(
                    -- AdvancedLogic,
                    CanWallJump
                )
            )
        )
    ),
    ["Ridley Southwest Puzzle Bottom"] = True,
    ["Ridley Bomb Puzzle"] = True,

    -- Tourian - None in Tourian!

    -- Crateria
    ["Crateria East Ballspark"] = Any(
        CanFlyWall,
        SpeedBooster
    ),
    ["Crateria Northeast Corner"] = Any(
        CanFly
    )

    -- Chozodia

}

-- Some workarounds for checks that don't play nice with the regions system.
scout_rules_ignore_region = {
    -- Norfair
    ["Norfair Larva Ceiling"] = All(
        Any(
            -- Speed Booster breakables (normal) method
            All(
                CanReachRegion("Norfair Lower Right Shaft"),
                Any(
                    -- Some way into the tunnel
                    Any(
                        CanIBJ,
                        -- Normal
                        All(
                            Any(
                                HiJump,
                                SpaceJump,
                                -- Slightly cursed walljump wraparound grab
                                CanWallJump
                            ),
                            PowerGrip
                        ),
                        -- Cursed wraparound jumpball thing
                        All(
                            IceBeam,
                            HiJump
                        )
                    ),
                    -- Cursed diagonal shinespark into walljump while blocks are reforming
                    All(
                        CanTrickySparks,
                        CanWallJump,
                        SpeedBooster
                    )
                )
            ),
            -- Ridley shaft method
            All(
                CanReachEntrance("Norfair Ridley Shortcut")
                -- Nothing else needed, since you're guaranteed to have
                -- everything you need from here.
            )
        ),

        -- Then something to reveal the item itself
        Any(
            PowerBombs,
            WaveBeam
        )
    ),

    -- Ridley
    ["Ridley Behind Unknown Statue"] = CanReachRegion("Central Ridley"),
    ["Ridley Unknown Item Statue"] = CanReachRegion("Central Ridley"),
    ["Ridley Long Hall"] = True,
}