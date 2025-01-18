-- Regional connection requirements

-- brinstar main to past-hives, top to past-hives is different
function brinstar_past_hives()
    return All(
        MorphBall,
        Missiles,
        Any(
            AdvancedLogic,
            MissileCount(10),
            SuperMissiles,
            LongBeam,
            IceBeam,
            WaveBeam,
            PlasmaBeam,
            ScrewAttack
        )
    )
end

function brinstar_main_to_brinstar_top()
    return Any(
        All(
            CanSingleBombBlock,
            CanBallJump
        ),
        All(
            AdvancedLogic,
            IceBeam,
            CanWallJump,
            PowerBombs
        ) -- truly cursed strat
    )
end

function brinstar_pasthives_to_brinstar_top()
    return All(
        Any(
            CanFly,
            All(
                HiJump,
                IceBeam,
                CanWallJump
            )
        ),
        CanBallJump
    )
end

-- this works for now. it's kind of tricky, cause all you need just to get there is PBs and bombs,
-- but to actually do anything (including get to ship) you need IBJ/speed/sj. it only checks for speed
-- for now since the only thing you'd potentially need this entrance for is Landing Site Ballspark
-- (this assumption changes if/when entrance/elevator rando happens)
function brinstar_crateria_ballcannon()
    return All(
        PowerBombs,
        CanBallCannon,
        CanVertical,
        SpeedBooster
    )
end

-- used for the items in this area as well as determining whether the ziplines can be activated
function kraid_upper_right()
    return All(
        Missiles,
        CanBallCannon,
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            All(
                IceBeam,
                CanBallJump
            )
        )
    )
end

-- access to lower kraid
function kraid_left_shaft_access()
    return All(
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            HiJump
        ),
        CanBallJump,
        CanBombTunnelBlock,
        Any(
            Ziplines,
            SpaceJump,
            All(
                GravitySuit,
                Any(
                    CanTrickySparks,
                    CanIBJ
                )
            ),
            All( -- Acid Worm Skip
                AdvancedLogic,
                PowerGrip
            )
        )
    )
end

function kraid_left_shaft_to_bottom()
    return UnknownItem2
end

function kraid_bottom_to_lower_norfair()
    return All(
        ScrewAttack,
        PowerBombs,
        Missiles,
        MorphBall
    )
end

function norfair_main_to_crateria()
    return All(
        MorphBall,
        Any(
            CanLongBeam,
            CanBallspark
        ),
        Any(
            LayoutPatches,
            CanEnterMediumMorphTunnel
        )
    )
end

function norfair_right_shaft_access()
    return Any(
        CanVertical,
        SpeedBooster
    )
end

function norfair_upper_right_shaft()
    return Any(
        CanVerticalWall,
        IceBeam
    )
end

function norfair_behind_ice_beam()
    return All(
        CanReachLocation("Norfair Ice Beam"),
        Any(
            CanLongBeam,
            WaveBeam
        ),
        MorphBall,
        Any(
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump,
                    IceBeam
                )
            ),
            CanIBJ,
            All(
                IceBeam,
                HiJump
            )
        )
    )
end

function norfair_behind_ice_to_bottom()
    return All(
        Missiles,
        CanBombTunnelBlock,
        Any(
            PowerGrip,
            CanHorizontalIBJ,
            All(
                IceBeam,
                CanBallJump
            )
        ),
        Any(
            CanIBJ,
            All(
                AdvancedLogic,
                PowerBombs,
                HiJump
            ),
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        )
    )
end

function norfair_lower_right_shaft()
    return Any(
        ScrewAttack,
        All(
            SpeedBooster,
            Any(
                CanBallCannon,
                -- TODO: This does nothing. Figure out a way to make it do what you intended
                CanReachEntrance("Norfair Right Shaft -> Lower Norfair")
            )
        )
    )
end

function norfair_lower_right_shaft_to_lower_norfair()
    return All(
        Missiles,
        CanBombTunnelBlock,
        Any(
            SpaceJump,
            CanWallJump,
            All(
                Bomb,
                Any(
                    PowerGrip,
                    CanHorizontalIBJ,
                    All(
                        AdvancedLogic,
                        SuperMissiles,
                        IceBeam
                    )
                )
            )
        ),
        Any(
            VariaSuit,
            Hellrun(6)
        ),
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            All(
                CanSingleBombBlock,
                SpeedBooster
            )
        )
    )
end

function lower_norfair_to_screwattack()
    return Any(
        CanTrickySparks,
        All(
            ScrewAttack,
            Any(
                CanWallJump,
                SpaceJump
            )
        ),
        All(
            MissileCount(5),
            Any(
                CanFlyWall,
                All(
                    AdvancedLogic,
                    IceBeam,
                    HiJump
                )
            )
        )
    )
end

-- This is necessary if your only way to the Screw Attack region is the ballcannon near the Ridley elevator
function screw_to_lower_norfair()
    return Any(
        MissileCount(4),
        ScrewAttack
    )
end

function lower_norfair_to_kraid()
    return All(
        ScrewAttack,
        PowerBombs,
        Missiles,
        Any(
            CanIBJ,
            PowerGrip,
            All(
                HiJump,
                IceBeam
            ),
            All(
                CanTrickySparks,
                CanBallspark
            )
        )
    )
end

-- The two items in Lower Norfair behind the Super Missile door right under the Screw Attack area
function lower_norfair_to_spaceboost_room()
    return All(
        SuperMissiles,
        Any(
            SpeedBooster,
            Bomb,
            PowerBombCount(2),
            All(
                WaveBeam,
                LongBeam,
                Any(
                    PowerGrip,
                    All(
                        GravitySuit,
                        HiJump
                    )
                )
            )
        ),
        CanVertical
    )
end

function lower_norfair_to_bottom_norfair()
    return All(
        MissileCount(2),
        SpeedBooster,
        Any(
            VariaSuit,
            Hellrun(1)
        ),
        Any(
            WaveBeam,
            CanTrickySparks
        ),
        CanEnterMediumMorphTunnel
    )
end

function bottom_norfair_to_lower_shaft()
    return Any(
        All(
            Missiles,
            CanFlyWall,
            Any(
                PowerGrip,
                CanIBJ
            )
        ),
        All(
            SpeedBooster,
            AdvancedLogic
        )
    )
end

function bottom_norfair_to_ridley()
    return Any(
        All(
            MissileCount(6), -- Covers the case where you only have Supers; 1 normal missile is enough from drops
            Any(
                IceBeam,
                AdvancedLogic
            )
        ),
        PowerBombs
    )
end

function bottom_norfair_to_screw()
    return All(
        RidleyBoss,
        SpeedBooster,
        Any(
            CanBallCannon,
            CanTrickySparks,
            AdvancedLogic
        ),
        Any(
            IceBeam,
            CanVerticalWall
        )
    )
end

function ridley_main_to_left_shaft()
    return All(
        SuperMissiles,
        Any(
            CanVerticalWall,
            IceBeam
        ),
        Any(
            VariaSuit,
            Hellrun(1),
            All(
                CanFly,
                CanBombTunnelBlock
            )
        ),
        MorphBall
    )
end

-- shortcut to the right of elevator
function ridley_main_to_right_shaft()
    return All(
        Missiles,
        Any(
            CanIBJ,
            All(
                PowerGrip,
                CanBombTunnelBlock,
                Any(
                    SpaceJump,
                    HiJump,
                    IceBeam
                )
            )
        )
    )
end

function ridley_left_shaft_to_sw_puzzle()
    return All(
        SpeedBooster,
        CanVerticalWall
    )
end

-- The alcove to the right of the right shaft
function ridley_speed_puzzles_access()
    return All(
        SpeedBooster,
        Any(
            CanVerticalWall,
            IceBeam
        )
    )
end

-- getting into the gap at the start of "ball room" and subsequently into the general area of ridley himself
function ridley_right_shaft_to_central()
    return CanEnterMediumMorphTunnel
end

-- Ridley, Unknown 3, and the item behind Unknown 3
function ridley_central_to_ridley_room()
    return All(
        Any(
            AdvancedLogic,
            All(
                MissileCount(40),
                EnergyTanks(3)
            )
        ),
        Any(
            CanFly,
            All(
                IceBeam,
                CanVerticalWall
            )
        )
    )
end

function tourian_to_chozodia()
    return All(
        MotherBrainBoss,
        RuinsTestEscape
    )
end

-- Getting to Unknown 1 and everything above
function crateria_main_to_crateria_upper()
    return Any(
        CanBallJump,
        All(
            LayoutPatches,
            CanFly
        ),
        All(
            AdvancedLogic,
            ScrewAttack,
            Any(
                SpaceJump,
                All(
                    PowerBombs,
                    CanTrickySparks,
                    CanWallJump
                )
            )
        )
    )
end

-- Upper Crateria door to Ruins, the two items right by it, and the Triple Crawling Pirates
function crateria_upper_to_chozo_ruins()
    return All(
        PowerBombs,
        MorphBall,
        Missiles,
        Any(
            CanFly,
            CanReachLocation("Crateria Northeast Corner")
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )
end

-- Ruins to Chozo Ghost, the three items in that general area, and the lava dive item
function chozo_ruins_to_ruins_test()
    return All(
        MorphBall,
        PowerBombs,
        Any(
            Bomb,
            PowerBombCount(3)
        ),
        Any(
            AdvancedLogic,
            ChozodiaCombat
        ),
        RuinsTestEscape
    )
end

function chozo_ruins_to_chozodia_tube()
    return Any(
        All( -- Getting up to the tube is doable with just walljumps but tricky enough to be advanced imo
            AdvancedLogic,
            CanWallJump
        ),
        CanFly
    )
end

-- Specifically getting to the room with Crateria Upper Door location. Might need another empty region for region rando
function chozodia_tube_to_chozo_ruins()
    return All(
        Any(
            CanFlyWall,
            CanHiGrip
        ),
        CanBombTunnelBlock
    )
end

function crateria_to_under_tube()
    return All(
        PowerBombs,
        MorphBall,
        Any( -- To get to the save station and warp out
            SpeedBooster,
            CanFlyWall,
            CanHiGrip
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )
end

function under_tube_to_tube()
    return Any(
        SpeedBooster,
        All(
            CanFly,
            PowerBombs,
            ChozoGhostBoss -- Change if basepatch makes the tube breakable before Charlie
        )
    )
end

function under_tube_to_crateria()
    return Any(
        CanIBJ,
        All(
            PowerGrip,
            CanFlyWall
        ),
        All(
            CanTrickySparks,
            CanBallspark
        )
    )
end

function tube_to_under_tube()
    return All(
        ChozoGhostBoss,
        PowerBombs
    )
end

function chozodia_tube_to_mothership_central()
    return All(
        Any(
            AdvancedLogic,
            ChozodiaCombat
        ),
        Any(
            CanFly,
            All(
                CanWallJump,
                HiJump
            )
        )
    )
end

function mothership_central_to_cockpit()
    return All(
        Any(
            Bomb,
            PowerBombCount(2)
        ),
        Any(
            ScrewAttack,
            MissileCount(5)
        ),
        Any(
            SuperMissiles,
            PowerGrip,
            CanFly
        ),
        Any(
            AdvancedLogic,
            EnergyTanks(6)
        )
    )
end

function cockpit_to_original_pb()
    return All(
        Any(
            CanWallJump,
            HiJump,
            PowerGrip,
            SpaceJump
        ), -- cannot IBJ to escape to cockpit
        Any(
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    CanFlyWall,
                    HiJump
                )
            ),
            All(
                AdvancedLogic,
                IceBeam,
                CanBallJump
            )
        )
    )
end

function cockpit_to_mecha_ridley()
    return All(
        CanBombTunnelBlock,
        Any(
            CanIBJ,
            PowerGrip,
            All(
                AdvancedLogic,
                IceBeam,
                HiJump
            )
        ),
        CanBallJump,
        Any(
            PowerBombCount(2),
            All(
                Bomb,
                PowerBombs
            ),
            All(
                AdvancedLogic,
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
                )
            )
        )
    )
end
