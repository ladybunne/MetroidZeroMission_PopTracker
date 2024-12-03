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
        )  
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

function brinstar_crateria_ballcannon()
    return All(
         PowerBombs,
         CanBallCannon,
         CanVertical,
         SpeedBooster
     )
end

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
            All(  
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

function bottom_norfair_to_ridley()
    return Any(
        All(
            MissileCount(6),  
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
        Any(
            PowerGrip,
            SpaceJump
        ),
        Any(
            PowerGrip,
            PowerBombs,
            All(
                LongBeam,
                WaveBeam
            )
        )
    )
end

function ridley_speed_puzzles_access()
    return All(
        SpeedBooster,
        Any(
            CanVerticalWall,
            IceBeam
        )
    )
end

function ridley_right_shaft_to_central()
    return CanEnterMediumMorphTunnel
end


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

function crateria_upper_to_chozo_ruins()
    return All(
        PowerBombs,
        MorphBall,
        Missiles,
        Any(
            CanFly,
            LookupLocation("Crateria Northeast Corner")
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )
end

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
        All(  
            AdvancedLogic,
            CanWallJump
        ),
        CanFly
    )
end

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
        Any(  
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
            ChozoGhostBoss  
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
        ),  
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
