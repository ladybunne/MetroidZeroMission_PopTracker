-- Requirements

KraidBoss = Event("kraid")
RidleyBoss = Event("ridley")
MotherBrainBoss = Event("mother_brain")
ChozoGhostBoss = Event("fully_powered_suit")
MechaRidleyBoss = Event("mecha_ridley")

-- CanReachLocation = lambda n: Requirement.location(n)
CanReachLocation = function(n) return true end

-- CanReachEntrance = lambda n: Requirement.entrance(n)
CanReachEntrance = function(n) return true end

UnknownItem1 = CanReachLocation("Crateria Unknown Item Statue")
UnknownItem2 = CanReachLocation("Kraid Unknown Item Statue")
UnknownItem3 = CanReachLocation("Ridley Unknown Item Statue")

CanUseUnknownItems = Any(
    OptionIs("unknown_items_always_usable", true),
    ChozoGhostBoss
)

LayoutPatches = OptionIs("layout_patches", true)

EnergyTanks = function(n) Has("EnergyTank", n) end
MissileTanks = function(n) Has("MissileTank", n) end
SuperMissileTanks = function(n) Has("SuperMissileTank", n) end
PowerBombTanks = function(n) Has("PowerBombTank", n) end

LongBeam = Has("LongBeam")
ChargeBeam = Has("ChargeBeam")
IceBeam = Has("IceBeam")
WaveBeam = Has("WaveBeam")
PlasmaBeam = All(
    Has("PlasmaBeam"),
    CanUseUnknownItems
)
Bomb = Has("Bomb")
VariaSuit = Has("VariaSuit")
GravitySuit = All(
    Has("GravitySuit"),
    CanUseUnknownItems
)
MorphBall = Has("MorphBall")
SpeedBooster = Has("SpeedBooster")
HiJump = Has("HiJump")
ScrewAttack = Has("ScrewAttack")
SpaceJump = All(
    Has("SpaceJump"),
    CanUseUnknownItems
)
PowerGrip = Has("PowerGrip")

Missiles = Any(
    MissileTanks(1),
    SuperMissileTanks(1)
)

MissileCount = function(n)
    return Tracker:ProviderCountForCode("MissileTank") * 5 +
        Tracker:ProviderCountForCode("SuperMissileTank") * 2 >= n
end

SuperMissiles = SuperMissileTanks(1)
PowerBombs = PowerBombTanks(1)
PowerBombCount = function(n) return PowerBombTanks(n // 2) end

CanRegularBomb = All(
    MorphBall,
    Bomb
)
CanBombTunnelBlock = All(
    MorphBall,
    Any(
        Bomb,
        PowerBombTanks(1)
    )
)
CanSingleBombBlock = Any(
    CanBombTunnelBlock,
    ScrewAttack
)
CanBallCannon = CanRegularBomb
CanBallspark = All(
    MorphBall,
    SpeedBooster,
    HiJump
)
CanBallJump = All(
    MorphBall,
    Any(
        Bomb,
        HiJump
    )
)
CanLongBeam = Any(
    LongBeam,
    MissileCount(1),
    CanBombTunnelBlock
)

AdvancedLogic = OptionAtLeast("logic_difficulty", 1)
CanIBJ = All(
    OptionAtLeast("ibj_logic", 1),
    CanRegularBomb
)
CanHorizontalIBJ = All(
    CanIBJ,
    OptionAtLeast("ibj_logic", 2)
)
CanWallJump = OptionAtLeast("walljump_logic", 1)
CanTrickySparks = All(
    OptionIs("tricky_shinesparks"),
    SpeedBooster
)
Hellrun = function(n)
    return All(
        OptionIs("heatruns_lavadives"),
        EnergyTanks(n)
    )
end

CanFly = Any(
    CanIBJ,
    SpaceJump
)
CanFlyWall = Any(
    CanFly,
    CanWallJump
)
CanVertical = Any(
    HiJump,
    PowerGrip,
    CanFly
)
CanVerticalWall = Any(
    CanVertical,
    CanWallJump
)
CanHiGrip = All(
    HiJump,
    PowerGrip
)
CanEnterHighMorphTunnel = Any(
    CanIBJ,
    All(
        MorphBall,
        PowerGrip
    )
)
CanEnterMediumMorphTunnel = Any(
    CanEnterHighMorphTunnel,
    All(
        MorphBall,
        HiJump
    )
)

Ziplines = CanReachEntrance("Kraid Main -> Acid Worm Area")

ChozodiaCombat = All(
    Any(
        IceBeam,
        PlasmaBeam
    ),
    EnergyTanks(4)
)
RuinsTestEscape = All(
    Any(
        All(
            AdvancedLogic,
            CanHiGrip,
            CanWallJump
        ),
        CanIBJ,
        Has("Space Jump")
    ),
    CanEnterMediumMorphTunnel
)

ReachedGoal = Any(
    All(
        OptionIs("goal", 0)
    ),
    All(
        OptionIs("goal", 1),
        MotherBrainBoss,
        ChozoGhostBoss
    )
)
