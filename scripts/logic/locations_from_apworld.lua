brinstar_start = {
    ["Brinstar Morph Ball"] = function() return true end,
    ["Brinstar Morph Ball Cannon"] = CanBallCannon,
    ["Brinstar Ceiling E-Tank"] = Any(
        All(
            IceBeam,
            RidleyBoss
        ),
        CanFly,
        All(
            MorphBall,
            CanTrickySparks
        )
    ),
}

brinstar_main = {
    ["Brinstar Long Beam"] = All(
        MorphBall,
        Any(
            CanLongBeam,
            LayoutPatches
        )
    ),
    ["Brinstar Main Shaft Left Alcove"] = All(
        CanSingleBombBlock,
        Any(
            CanFlyWall,
            IceBeam,
            CanHiGrip
        )
    ),
    ["Brinstar Ballspark"] = CanBallspark,
    ["Brinstar Ripper Climb"] = Any(
        All(
            CanEnterHighMorphTunnel,
            Any(
                IceBeam,
                CanFlyWall
            )
        ),
        CanIBJ,
        All(
            CanBallspark,
            CanTrickySparks,
            CanWallJump,
            AdvancedLogic
        )
    ),
    ["Brinstar Speed Booster Shortcut"] = All(
        Any(
            CanBallspark,
            All(
                AdvancedLogic,
                CanBallJump
            )
        ),
        CanBombTunnelBlock,
        CanVerticalWall
    ),
    ["Brinstar Worm drop"] = All(
        MorphBall,
        Missiles
    ),
    ["Brinstar First Missile"] = MorphBall,
    ["Brinstar Behind Hive"] = All(
        MorphBall,
        Missiles),
    ["Brinstar Under Bridge"] = All(
        Missiles,
        CanSingleBombBlock
    ),
}

brinstar_top = {
    ["Brinstar Varia Suit"] = All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            CanTrickySparks
        ),
        CanBallJump,
        Any(
            CanIBJ,
            PowerGrip,
            All(
                HiJump,
                Any(
                    CanWallJump,
                    GravitySuit
                )
            )
        ),
        CanBombTunnelBlock
    ),
    ["Brinstar Acid near Varia"] = All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            CanTrickySparks
        ),
        CanBallJump,
        CanLongBeam,
        Any(
            VariaSuit,
            GravitySuit,
            Hellrun(2)
        )
    ),
    ["Brinstar Upper Pillar"] = function() return true end
}

brinstar_pasthives = {
    ["Brinstar Post-Hive In Wall"] = function() return true end,
    ["Brinstar Behind Bombs"] = All(
        CanBombTunnelBlock,
        CanBallJump
    ),
    ["Brinstar Bomb"] = function() return true end,
    ["Brinstar Post-Hive Pillar"] = function() return true end
}


kraid_main = {
    ["Kraid Save Room Tunnel"] = CanBombTunnelBlock,
    ["Kraid Zipline Morph Jump"] = All(
        Ziplines,
        CanBallJump
    ),
    ["Kraid Acid Ballspark"] = All(
        Any(
            CanHorizontalIBJ,
            HiJump,
            PowerGrip
        ),
        CanBombTunnelBlock,
        GravitySuit,
        CanBallspark
    ),
    ["Kraid Right Hall Pillar"] = Missiles,
    ["Kraid Speed Jump"] = All(
        Missiles,
        SpeedBooster
    ),
    ["Kraid Upper Right Morph Ball Cannon"] = All(
        Missiles,
        CanBallCannon
    )
}

kraid_acidworm_area = {
    ["Kraid Under Acid Worm"] = All(
        MissileCount(20),
        CanSingleBombBlock,
        CanVerticalWall
    ),
    ["Kraid Zipline Activator Room"] = function() return true end
}


kraid_left_shaft = {
    ["Kraid Behind Giant Hoppers"] = CanEnterHighMorphTunnel,
    ["Kraid Quad Ball Cannon Room"] = All(
        CanBombTunnelBlock,
        Ziplines,
        Missiles
    ),
    ["Kraid Unknown Item Statue"] = All(
        Any(
            Bomb,
            PowerBombCount(2)
        ),
        Any(
            PowerGrip,
            HiJump,
            CanIBJ,
            All(
                IceBeam,
                Bomb
            )
        ),
        Missiles
    )
}




kraid_bottom = {
    ["Kraid Speed Booster"] = Any(
        KraidBoss,
        SpeedBooster
    ),
    ["Kraid Acid Fall"] = function() return true end,
    ["Kraid"] = All(
        Any(
            UnknownItem2,
            SpeedBooster
        ),
        Any(
            All(
                MissileCount(20),
                EnergyTanks(1)
            ),
            All(
                AdvancedLogic,
                MissileTanks(1)
            )
        ),
        Any(
            SpeedBooster,
            CanHiGrip,
            CanFlyWall
        )
    )
}

norfair_main = {
    ["Norfair Hallway to Crateria"] = Any(
        PowerGrip,
        CanIBJ,
        All(
            IceBeam,
            CanEnterMediumMorphTunnel
        )
    ),
    ["Norfair Under Crateria Elevator"] = All(
        Any(
            CanLongBeam,
            CanBallspark
        ),
        CanEnterHighMorphTunnel
    )
}

norfair_right_shaft = {
    ["Norfair Big Room"] = Any(
        SpeedBooster,
        CanFly,
        All(
            IceBeam,
            CanVerticalWall
        ),
        All(
            AdvancedLogic,
            CanHiGrip,
            CanWallJump
        )
    )
}

norfair_upper_right = {
    ["Norfair Ice Beam"] = function() return true end,
    ["Norfair Heated Room above Ice Beam"] = Any(
        VariaSuit,
        Hellrun(1)
    )
}

norfair_behind_ice = {
    ["Norfair Behind Top Chozo Statue"] = function() return true end,
}

norfair_lowerrightshaft = {
    ["Norfair Bomb Trap"] = All(
        Any(
            Bomb,
            All(
                SpaceJump,
                PowerBombs
            )
        ),
        CanReachLocation("Norfair Heated Room Under Brinstar Elevator")
    ),
    ["Norfair Heated Room Under Brinstar Elevator"] = All(
        SuperMissiles,
        Any(
            VariaSuit,
            Hellrun(4),
            All(
                SpeedBooster,
                Hellrun(1)
            )
        )
    ),
    ["Norfair Hi-Jump"] = Missiles,
    ["Norfair Right Shaft Near Hi-Jump"] = All(
        CanEnterHighMorphTunnel,
        Any(
            HiJump,
            CanWallJump
        )
    )
}

lower_norfair = {
    ["Norfair Lava Dive Left"] = All(
        MissileCount(7),
        GravitySuit,
        CanFly
    ),
    ["Norfair Lava Dive Right"] = All(
        MissileCount(5),
        Any(
            GravitySuit,
            All(
                VariaSuit,
                Hellrun(5)
            ),
            Hellrun(9)
        ),
        Any(
            CanBombTunnelBlock,
            WaveBeam
        ),
        CanVerticalWall
    ),
    ["Norfair Wave Beam"] = MissileCount(4),
    ["Norfair Heated Room Below Wave - Left"] = All(
        CanVerticalWall,
        Any(
            VariaSuit,
            Hellrun(2)
        ),
        Any(
            CanIBJ,
            HiJump,
            PowerGrip,
            All(
                IceBeam,
                Bomb
            )
        )
    ),
    ["Norfair Heated Room Below Wave - Right"] = All(
        CanVerticalWall,
        Any(
            VariaSuit,
            Hellrun(2)
        )
    ),
}

norfair_screwattack = {
    ["Norfair Screw Attack"] = function() return true end,
    ["Norfair Next to Screw Attack"] = ScrewAttack,
}

norfair_behind_superdoor = {
    ["Norfair Behind Lower Super Missile Door - Left"] = All(
        Any(
            All(
                CanIBJ,
                GravitySuit
            ),
            All(
                SpaceJump,
                PowerGrip
            ),
            All(
                AdvancedLogic,
                IceBeam,
                Any(
                    CanEnterMediumMorphTunnel,
                    Bomb
                ),
                CanReachLocation("Norfair Behind Lower Super Missile Door - Right")
            )
        ),
        Any(
            SpeedBooster,
            CanBallJump
        )
    ),
    ["Norfair Behind Lower Super Missile Door - Right"] = Any(
        CanFly,
        All(
            HiJump,
            Any(
                IceBeam,
                All(
                    GravitySuit,
                    CanWallJump
                )
            )
        )
    )
}

norfair_bottom = {
    ["Norfair Larva Ceiling"] = CanReachEntrance("Lower Norfair -> Bottom"),
    ["Norfair Right Shaft Bottom"] = All(
        Any(
            CanVerticalWall,
            IceBeam
        ),
        CanBallJump
    )
}

ridley_main = {
    ["Ridley Imago Super Missile"] = All(
        CanVerticalWall,
        Any(
            MissileCount(20),
            All(
                AdvancedLogic,
                MissileTanks(1)
            ),
            ChargeBeam
        )
    )
}

ridley_left_shaft = {
    ["Ridley West Pillar"] = function() return true end,
    ["Ridley Fake Floor"] = function() return true end,
    ["Ridley Long Hall"] = function() return true end
}

ridley_sw_puzzle = {
    ["Ridley Southwest Puzzle Top"] = All(
        MissileCount(5),
        Any(
            CanWallJump,
            PowerGrip,
            SpaceJump
        )
    ),
    ["Ridley Southwest Puzzle Bottom"] = function() return true end
}

ridley_right_shaft = {
    ["Ridley Northeast Corner"] = Any(
        CanFly,
        All(
            AdvancedLogic,
            CanWallJump,
            HiJump
        ),
        All(
            IceBeam,
            Any(
                CanWallJump,
                CanHiGrip
            )
        )
    )
}

ridley_right_speed_puzzles = {
    ["Ridley Bomb Puzzle"] = All(
        PowerGrip,
        Any(
            All(
                Bomb,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            ),
            All(
                AdvancedLogic,
                PowerBombCount(2),
                HiJump
            )
        )
    ),
    ["Ridley Speed Jump"] = WaveBeam
}

ridley_central = {
    ["Ridley Upper Ball Cannon Puzzle"] = All(
        Any(
            HiJump,
            All(
                CanWallJump,
                Any(
                    PowerGrip,
                    SpaceJump
                )
            )
        ),
        Any(
            CanBallCannon,
            LayoutPatches
        )
    ),
    ["Ridley Lower Ball Cannon Puzzle"] = All(
        Any(
            PowerBombs,
            PowerGrip,
            All(
                WaveBeam,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        ),
        Any(
            CanBallCannon,
            All(
                LayoutPatches,
                Any(
                    HiJump,
                    SpaceJump,
                    CanWallJump
                )
            )
        )
    ),
    ["Ridley After Sidehopper Hall Upper"] = function() return true end,
    ["Ridley After Sidehopper Hall Lower"] = function() return true end,
    ["Ridley Center Pillar"] = function() return true end,
    ["Ridley Ball Room Lower"] = function() return true end,
    ["Ridley Ball Room Upper"] = All(
        SuperMissiles,
        Any(
            CanFlyWall,
            CanHiGrip
        )
    ),
    ["Ridley Fake Lava Under Floor"] = All(
        Any(
            WaveBeam,
            CanBombTunnelBlock
        ),
        CanEnterHighMorphTunnel
    ),
    ["Ridley Under Owls"] = function() return true end,
}

ridley_room = {
    ["Ridley Behind Unknown Statue"] = UnknownItem3,
    ["Ridley Unknown Item Statue"] = function() return true end,
    ["Ridley"] = UnknownItem3,
}

tourian = {
    ["Tourian Left of Mother Brain"] = All(
        ChozoGhostBoss,
        MotherBrainBoss,
        SpeedBooster,
        Any(
            SpaceJump,
            CanTrickySparks
        )
    ),
    ["Tourian Under Mother Brain"] = All(
        MotherBrainBoss,
        SuperMissiles,
        CanEnterMediumMorphTunnel
    ),
    ["Mother Brain"] = All(
        IceBeam,
        CanRegularBomb,
        Any(
            AdvancedLogic,
            All(
                MissileCount(40),
                EnergyTanks(4)
            )
        ),
        CanVertical,
        Any(
            SpeedBooster,
            CanFly,
            All(
                HiJump,
                CanWallJump
            )
        )
    )
}

crateria_main = {
    ["Crateria Landing Site Ballspark"] = All(
        ChozoGhostBoss,
        MotherBrainBoss,
        CanBallspark,
        CanBallJump,
        Any(
            GravitySuit,
            CanReachEntrance("Brinstar -> Crateria Ballcannon")
        )
    ),
    ["Crateria Moat"] = function() return true end
}

crateria_upper = {
    ["Crateria Power Grip"] = All(
        CanBallJump,
        Any(
            All(
                CanVertical,
                LayoutPatches
            ),
            PowerGrip,
            CanIBJ
        )
    ),
    ["Crateria Statue Water"] = UnknownItem1,
    ["Crateria Unknown Item Statue"] = CanBallJump,
    ["Crateria East Ballspark"] = All(
        CanBallspark,
        Any(
            CanReachEntrance("Crateria -> Chozodia Upper Door"),
            CanReachLocation("Crateria Northeast Corner")
        )
    ),
    ["Crateria Northeast Corner"] = All(
        SpeedBooster,
        Any(
            SpaceJump,
            CanWallJump,
            CanTrickySparks
        )
    )
}

chozodia_ruins_crateria_entrance = {
    ["Chozodia Upper Crateria Door"] =
        CanReachEntrance("Crateria -> Chozodia Upper Door"),
    ["Chozodia Ruins East of Upper Crateria Door"] = Missiles,
    ["Chozodia Triple Crawling Pirates"] = All(
        Any(
            Bomb,
            PowerBombCount(3)
        ),
        Any(
            CanHiGrip,
            CanFlyWall
        ),
        Any(
            AdvancedLogic,
            ChozodiaCombat
        )
    ),
}

chozodia_ruins_test = {
    ["Chozodia Chozo Ghost Area Morph Tunnel Above Water"] = All(
        ChozoGhostBoss,
        Missiles,
        CanBallJump
    ),
    ["Chozodia Chozo Ghost Area Underwater"] = All(
        ChozoGhostBoss,
        SpeedBooster,
        GravitySuit
    ),
    ["Chozodia Chozo Ghost Area Long Shinespark"] = All(
        ChozoGhostBoss,
        SpeedBooster,
        GravitySuit
    ),
    ["Chozodia Lava Dive"] = All(
        ChozoGhostBoss,
        Any(
            GravitySuit,
            All(
                Hellrun(4),
                VariaSuit,
                CanHiGrip
            ),
            All(
                AdvancedLogic,
                Hellrun(6),
                CanHiGrip
            )
        ),
        CanEnterHighMorphTunnel,
        CanBallJump,
        Any(
            CanWallJump,
            All(
                GravitySuit,
                CanFly
            )
        )
    ),
    ["Chozo Ghost"] = function() return true end
}

chozodia_under_tube = {
    ["Chozodia Bomb Maze"] = All(
        MorphBall,
        Any(
            CanIBJ,
            All(
                CanBallspark,
                CanTrickySparks
            ),
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        ),
        Any(
            Bomb,
            PowerBombCount(3)
        ),
        CanBallJump
    ),
    ["Chozodia Zoomer Maze"] = Any(
        CanIBJ,
        All(
            PowerGrip,
            CanBallJump
        ),
        All(
            CanBallspark,
            CanTrickySparks
        )
    ),
    ["Chozodia Left of Glass Tube"] = All(
        SpeedBooster,
        CanReachEntrance("Chozodia Glass Tube -> Chozo Ruins")
    ),
    ["Chozodia Right of Glass Tube"] = All(
        PowerBombs,
        CanFly
    )
}

chozodia_mothership = {
    ["Chozodia Pirate Pitfall Trap"] = All(
        Missiles,
        SuperMissiles,
        Any(
            ScrewAttack,
            MissileCount(5)
        ),
        Any(
            All(
                CanBombTunnelBlock,
                CanFlyWall
            ),
            All(
                AdvancedLogic,
                CanSingleBombBlock
            )
        )
    ),
    ["Chozodia Behind Workbot"] = MissileCount(5),
    ["Chozodia Ceiling Near Map Station"] = All(
        Missiles,
        Any(
            PowerBombs,
            ScrewAttack,
            MissileCount(6)
        )
    ),
    ["Chozodia Southeast Corner In Hull"] = PowerBombs
}

chozodia_pb_area = {
    ["Chozodia Original Power Bomb"] = function() return true end,
    ["Chozodia Next to Original Power Bomb"] = All(
        PowerBombs,
        CanFly
    )
}

chozodia_mecha_ridley_hall = {
    ["Chozodia Under Mecha Ridley Hallway"] = SpeedBooster,
    ["Mecha Ridley"] = All(
        PlasmaBeam,
        Any(
            MissileCount(40),
            All(
                AdvancedLogic,
                Missiles,
                Any(
                    HiJump,
                    CanWallJump
                )
            )
        ),
        CanEnterHighMorphTunnel,
        ReachedGoal
    ),
    ["Chozodia Space Pirate's Ship"] = MechaRidleyBoss
}
