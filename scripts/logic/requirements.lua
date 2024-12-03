-- Requirements

function LookupLocation(location)
    return function()
        return true
    end
end

KraidBoss = Event("kraid")
RidleyBoss = Event("ridley")
MotherBrainBoss = Event("mother_brain")
ChozoGhostBoss = Event("fully_powered_suit")
MechaRidleyBoss = Event("mecha_ridley")

UnknownItem1 = LookupLocation("Crateria Unknown Item Statue")
UnknownItem2 = LookupLocation("Kraid Unknown Item Statue")
UnknownItem3 = LookupLocation("Ridley Unknown Item Statue")

CanUseUnknownItems = Any(
    OptionIs("unknown_items", 1),
    ChozoGhostBoss
)

LayoutPatches = OptionIs("layout_patches", 1)

EnergyTanks = function(n) return Has("EnergyTank", n) end
MissileTanks = function(n) return Has("MissileTank", n) end
SuperMissileTanks = function(n) return Has("SuperMissileTank", n) end
PowerBombTanks = function(n) return Has("PowerBombTank", n) end

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
    local count = n
    return function()
        return Tracker:ProviderCountForCode("MissileTank") * 5 +
            Tracker:ProviderCountForCode("SuperMissileTank") * 2 >= count
    end
end

SuperMissiles = function() return SuperMissileTanks(1) end
PowerBombs = function() return PowerBombTanks(1) end
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
    OptionIs("tricky_shinesparks", 1),
    SpeedBooster
)
Hellrun = function(n)
    return All(
        OptionIs("heatruns", 1),
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

Ziplines = function() return CanReachEntrance("Kraid Main -> Acid Worm Area") end

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
