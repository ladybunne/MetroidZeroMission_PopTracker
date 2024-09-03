function Has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function HasAny(items)
  for _,value in pairs(items) do
    if Has(value) then
      return true
    end
  end
  return false
end

function HasAll(items)
  for _,value in pairs(items) do
    if not Has(value) then
      return false
    end
  end
  return true
end


-- Ability check functions

function HasMissiles()
  return Has("MissileTank") or Has("SuperMissileTank")
end

function MissileCount(amount)
  local missile_count = Tracker:ProviderCountForCode("MissileTank") * 5 +
      Tracker:ProviderCountForCode("SuperMissileTank") * 2
  return missile_count >= amount
end

function HasSuperMissiles()
  return Has("SuperMissileTank")
end

function HasPowerBombs()
  return Has("PowerBombTank")
end

function PowerBombCount(amount)
  return Tracker:ProviderCountForCode("PowerBombTank") * 2 >= amount
end

function CanRegularBomb()
  return Has("MorphBall") and Has("Bomb")
end

function CanBallCannon()
  return Has("MorphBall") and Has("Bomb")
end

-- I can only assume this applies to non-Screw Attackable bomb blocks.
function CanBombBlock()
  return Has("MorphBall") and (Has("Bomb") or Has("PowerBombTank"))
end

function CanLongBeam()
  return Has("LongBeam") or MissileCount(3) or CanBombBlock()
end

function CanHiJump()
  return Has("HiJump") or CanSpaceJump() or CanIBJ()
end

-- Super cursed function name.
function CanHJSJIBJOrGrip()
  return CanHiJump() or Has("PowerGrip")
end

function CanBallspark()
  return Has("MorphBall") and Has("HiJump") and Has("SpeedBooster")
end

function CanSpaceJump()
  return Has("SpaceJump") and (UNKNOWN_ITEMS_ALWAYS_USABLE or ChozoGhostDefeatable())
end

function CanTraverseHeat()
  return Has("VariaSuit") or CanGravitySuit()
end

function CanGravitySuit()
  return Has("GravitySuit") and (UNKNOWN_ITEMS_ALWAYS_USABLE or ChozoGhostDefeatable())
end

function Hellrun(etanks_amount)
  return HEATRUNS_LAVADIVES and Has("EnergyTank", etanks_amount)
end

function CanIBJ()
  return IBJ_IN_LOGIC and CanRegularBomb()
end

function CanWalljump()
  return WALLJUMPS_IN_LOGIC
end

function CanTrickySparks()
  return CAN_TRICKY_SPARKS and Has("SpeedBooster")
end


-- Region functions

function AccessBrinstar()
  return true
end

function AccessNorfair()
  return AccessBrinstar() and
    CanBombBlock()
end

function AccessCrateria()
  return (AccessBrinstar() and
    HasPowerBombs()
    and CanBallCannon()
    and CanHJSJIBJOrGrip()
    and Has("SpeedBooster"))
    or (AccessNorfair() and CanLongBeam())

end

function AccessKraid()
  return AccessBrinstar() and
    (CanBombBlock() or Has("ScrewAttack"))
end

function AccessRidley()
  return AccessNorfair() and
    ((NorfairToSaveBehindHiJump() and MissileCount(4) and HasAll({"WaveBeam", "SpeedBooster"}))
      or NorfairShortcut())
    and (MissileCount(6) or HasPowerBombs())
end

function AccessTourian()
  return AccessBrinstar() and
    KraidDefeatable() and RidleyDefeatable()
end

function AccessChozodia()
  return AccessCrateria() and
    -- Upper door
    ((HasPowerBombs() and (CanIBJ() or CanSpaceJump() or (Has("SpeedBooster") and CanWalljump()))
    and (MotherBrainDefeatable() or not CHOZODIA_ACCESS))
    -- Lower door
    or (HasPowerBombs() and (MotherBrainDefeatable() or not CHOZODIA_ACCESS)))
end

-- Subregion functions

-- I'm not sure why this requires missiles; it's perfectly doable with Short Beam.
function BrinstarPastHives()
  return Has("MorphBall") and MissileCount(10)
end

function KraidUpperRight()
  return (HasMissiles()
    and CanBallCannon()
    and (CanWalljump()
      or CanSpaceJump()
      or Has("PowerGrip"))
    ) and (CanIBJ()
      or Has("PowerGrip")
      or (HasAll({"IceBeam", "HiJump"})))
end

function KraidLeftShaftAccess()
  return ((CanIBJ() or HasAny({"PowerGrip", "HiJump"}))
    and CanBombBlock()
    and (CanRegularBomb() or Has("HiJump"))
    and (KraidUpperRight()
      or CanSpaceJump()
      or (CanGravitySuit() and CanTrickySparks())))
end

function NorfairRightShaftAccess()
  return CanHJSJIBJOrGrip() or Has("SpeedBooster")
end

function NorfairUpperRightShaft()
  return (NorfairRightShaftAccess()
    and (CanHJSJIBJOrGrip()
      or Has("IceBeam")
      or CanWalljump()))
end

function NorfairBehindIceBeam()
  return (NorfairUpperRightShaft()
    and (CanLongBeam() or Has("WaveBeam"))
    and ((Has("IceBeam") and HasAny({"HiJump", "PowerGrip"}))
      or CanIBJ()
      or (CanWalljump() and Has("PowerGrip")))
    )
end

function NorfairLowerRightShaft()
  return (NorfairRightShaftAccess()
    and (Has("ScrewAttack")
      or (Has("SpeedBooster") and CanBallCannon())))
end

function NorfairToSaveBehindHiJump()
  return (NorfairLowerRightShaft()
    and HasMissiles()
    and CanBombBlock()
    and (CanIBJ()
      or (HasPowerBombs() and Has("HiJump"))
      or (Has("Bomb") and HasAny({"HiJump", "PowerGrip"})))
    and (CanHJSJIBJOrGrip() or CanWalljump() or Has("IceBeam"))
    and (CanTraverseHeat() or Hellrun(6))
    and (CanIBJ() or CanSpaceJump()
      or (Has("SpeedBooster")
        and (CanBombBlock() or Has("ScrewAttack")))))
end

function NorfairShortcut()
  return (NorfairBehindIceBeam()
    and HasMissiles()
    and (CanIBJ()
      or (Has("PowerGrip")
        and (CanSpaceJump() or CanWalljump())
        and CanBombBlock())))
end

function NorfairBottomRightShaft()
  return ((NorfairToSaveBehindHiJump()
      and MissileCount(4)
      and HasAll({"WaveBeam", "SpeedBooster"}))
    or (NorfairShortcut()))
end

function RidleyLeftShaftAccess()
  return (HasSuperMissiles()
    and (CanHJSJIBJOrGrip() or CanWalljump()
      or Has("IceBeam" or CanBombBlock()))
    and (CanTraverseHeat() or Hellrun(1)))
end

function RidleyLongWayRightShaftAccess()
  return (RidleyLeftShaftAccess()
    and (Has("PowerGrip")
      and (CanHJSJIBJOrGrip() or CanWalljump())))
end

function RidleyShortcutRightShaftAccess()
  return (HasMissiles()
    and ((Has("PowerGrip") and HasPowerBombs() and HasAny({"IceBeam", "HiJump"}))
      or CanIBJ())
    and (CanBombBlock() or Has("ScrewAttack")))
end

function RidleyCentralAccess()
  return ((RidleyShortcutRightShaftAccess() or RidleyLongWayRightShaftAccess())
    and (CanIBJ() or HasAny({"HiJump", "PowerGrip"})))
end

function ChozodiaGhostFromUpperCrateriaDoor()
  return (Has("IceBeam") and Has("EnergyTank", 4)
    and HasMissiles()
    and (CanWalljump() or CanIBJ() or CanSpaceJump())
    and PowerBombCount(4))
end

function ChozodiaGlassTubeFromCrateriaDoor()
  return (Has("IceBeam") and Has("EnergyTank", 2)
    and HasMissiles() and Has("PowerBombTank")
    and (CanSpaceJump() or CanIBJ())
  )
    or (Has("IceBeam") and Has("EnergyTank", 2)
      and (CanIBJ() or CanSpaceJump() or Has("SpeedBooster"))
      and MissileCount(6)
      and Has("PowerBombTank")
    )
end

function ChozodiaTubeToMothershipCentral()
  return (ChozodiaGlassTubeFromCrateriaDoor()
    and Has("EnergyTank", 6)
    and ((Has("HiJump") and (CanWalljump() or Has("PowerGrip")))
      or CanIBJ() or CanSpaceJump()
      )
  )
end

function ChozodiaToCockpit()
  return (((CanWalljump() and Has("HiJump")) or CanIBJ()
    or CanSpaceJump()))
    and Has("EnergyTank", 6)
    and Has("IceBeam")
    and HasMissiles()
    and (Has("Bomb") or PowerBombCount(4))
end

-- Boss / fake location functions
-- These are written somewhat differently to the apworld. It has full knowledge of whether
-- those bosses are *actually* defeated, since it has access to the game itself. We do not
-- have that luxury, so instead, we can imagine that all defeatable bosses are instantly
-- defeated for the purposes of logic. It's good enough for our purposes.

function KraidDefeatable()
  return KraidSpaceJump() == AccessibilityLevel.Normal
    and MissileCount(30)
    and Has("EnergyTank", 1)
    and (HasAll({"HiJump", "PowerGrip"}) or Has("SpeedBooster") or CanSpaceJump() or CanIBJ() or CanWalljump())
end

function RidleyDefeatable()
  return RidleyGravitySuit() == AccessibilityLevel.Normal
end

function MotherBrainDefeatable()
  return HasAll({"IceBeam", "Bomb"})
    and MissileCount(40)
    and Has("EnergyTank", 4)
    and (CanHiJump() or Has("PowerGrip"))
    and (Has("SpeedBooster") or CanSpaceJump() or CanIBJ() or (Has("HiJump") and CanWalljump()))
end

function ChozoGhostDefeatable()
  return MotherBrainDefeatable()
end

function MechaRidleyDefeatable()
  return ChozodiaToCockpit()
    and MissileCount(40)
    and Has("PowerBombTank")
end

function ChozodiaSpacePirateShip()
  return MechaRidleyDefeatable() and Has("PlasmaBeam")
end

-- The actual checks themselves!

-- Brinstar

function BrinstarMorphBall()
  local condition = AccessBrinstar()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarMorphBallCannon()
  local condition = AccessBrinstar() and
    CanRegularBomb()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarLongBeam()
  local condition = AccessBrinstar() and
    Has("MorphBall") and (CanLongBeam() or LAYOUT_PATCHES)

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarCeilingETank()
  local condition = AccessBrinstar() and
    ((Has("IceBeam") and RidleyDefeatable())
    or CanSpaceJump()
    or CanIBJ())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarMissileAboveSuper()
  local condition = AccessBrinstar() and
    (CanBombBlock() and (CanSpaceJump()
      or Has("IceBeam")
      or HasAll({"HiJump", "PowerGrip"})
      or CanIBJ()
      or CanWalljump()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarSuperMissile()
  local condition = AccessBrinstar() and
    CanBallspark()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarTopMissile()
  local condition = AccessBrinstar() and
    (HasAll({"MorphBall", "PowerGrip"}) and (Has("IceBeam")
      or CanSpaceJump()
      or CanWalljump()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarSpeedBoosterShortcutMissile()
  local condition = AccessBrinstar() and
    (CanBombBlock() and CanBallspark() and (CanWalljump() or CanHJSJIBJOrGrip()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarVariaSuit()
  local condition = AccessBrinstar() and
    ((CanIBJ() or CanSpaceJump() or HasAll({"PowerGrip", "HiJump"}))
      and (CanRegularBomb() or HasAll({"MorphBall", "HiJump"}))
      and (CanIBJ() or Has("PowerGrip") or (Has("HiJump") and (CanWalljump() or CanGravitySuit()))))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarWormDrop()
  local condition = AccessBrinstar() and
    (Has("MorphBall") and HasMissiles())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarAcidNearVaria()
  local condition = AccessBrinstar() and
    (CanIBJ() or CanSpaceJump() or HasAll({"PowerGrip", "HiJump"}))
      and (CanRegularBomb() or HasAll({"MorphBall", "HiJump"}))
      and (CanLongBeam() and (Hellrun(2) or Has("VariaSuit") or CanGravitySuit()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarFirstMissile()
  local condition = AccessBrinstar() and
    Has("MorphBall")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBehindHive()
  local condition = AccessBrinstar() and
    (Has("MorphBall") and MissileCount(5))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarUnderBridge()
  local condition = AccessBrinstar() and
    (HasMissiles() and CanBombBlock())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarPostHiveMissile()
  local condition = AccessBrinstar() and
    BrinstarPastHives()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarUpperPillarMissile()
  local condition = AccessBrinstar() and
    (CanBombBlock() and HasAny({"Bomb", "HiJump"}))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBehindBombs()
  local condition = AccessBrinstar() and
    (BrinstarPastHives() and (CanBombBlock() and HasAny({"Bomb", "HiJump"})))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBomb()
  local condition = AccessBrinstar() and
    (BrinstarPastHives())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarPostHiveETank()
  local condition = AccessBrinstar() and
    (BrinstarPastHives())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Kraid

function KraidGiantHoppersMissile()
  local condition = AccessKraid() and
    KraidLeftShaftAccess()
    and (CanIBJ() or HasAll({"MorphBall", "PowerGrip"}))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSaveRoomMissile()
  local condition = AccessKraid() and
    CanBombBlock()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidCrumbleBlockMissile()
  local condition = AccessKraid() and
    KraidUpperRight()
    and Has("MorphBall")
    and HasAny({"Bomb", "HiJump"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidQuadBallCannonRoom()
  local condition = AccessKraid() and
    KraidLeftShaftAccess()
    and KraidUpperRight()
    and HasMissiles()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpaceJump()
  local condition = AccessKraid() and
    KraidLeftShaftAccess()
    and (Has("Bomb") or PowerBombCount(2))
    and (HasAny({"PowerGrip", "HiJump"}) or CanIBJ())
    and HasMissiles()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidAcidBallspark()
  local condition = AccessKraid() and
    (CanIBJ() or HasAny({"PowerGrip", "HiJump"}))
    and CanBombBlock()
    and (CanRegularBomb() or Has("HiJump"))
    and CanGravitySuit()
    and CanBallspark()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpeedBooster()
  local condition = AccessKraid() and
    KraidDefeatable()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidWormMissile()
  local condition = AccessKraid() and
    KraidUpperRight()
    and MissileCount(30)
    and CanBombBlock()
    and (CanHJSJIBJOrGrip() or CanWalljump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidPillarMissile()
  local condition = AccessKraid() and
    HasMissiles()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidAcidFall()
  local condition = AccessKraid() and
    KraidSpaceJump()
    and Has("MorphBall")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidWormETank()
  local condition = AccessKraid() and
    KraidUpperRight()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpeedJump()
  local condition = AccessKraid() and
    HasMissiles() and Has("SpeedBooster")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidUpperRightMorphBallCannon()
  local condition = AccessKraid() and
    HasMissiles() and CanBallCannon()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Norfair

function NorfairLavaPowerBomb()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and MissileCount(5)
    and CanGravitySuit()
    and (CanSpaceJump() or CanIBJ())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairLavaMissile()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and MissileCount(3)
    and (CanBombBlock() or Has("WaveBeam"))
    and (CanGravitySuit() or (Has("VariaSuit") or Hellrun(5)) or Hellrun(9))
    and (CanIBJ() or CanSpaceJump() or CanWalljump() or HasAny({"HiJump", "PowerGrip"}))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairScrewAttack()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and (CanTrickySparks()
      or (Has("ScrewAttack")
        and (CanSpaceJump() or CanWalljump()))
      or (MissileCount(5)
        and (CanWalljump() or CanIBJ() or CanSpaceJump())))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairScrewAttackMissile()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and Has("ScrewAttack")
    and (CanTrickySparks() or CanSpaceJump() or CanWalljump() or (MissileCount(5) and CanIBJ()))
    and (CanHJSJIBJOrGrip() or Has("IceBeam"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairPowerGripMissile()
  local condition = AccessNorfair() and
    (CanIBJ() or (Has("PowerGrip") or HasAll({"HiJump", "IceBeam"})))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairUnderCrateriaElevator()
  local condition = AccessNorfair() and
    (CanLongBeam() or CanBallspark())
    and (Has("PowerGrip") or CanIBJ())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairWaveBeam()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and MissileCount(4)

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBombTrap()
  local condition = AccessNorfair() and
    NorfairLowerRightShaft()
    and HasSuperMissiles()
    and (CanTraverseHeat() or Hellrun(4) or (Has("SpeedBooster") and Hellrun(1)))
    and (HasAll({"MorphBall", "Bomb"}) or (CanSpaceJump() and HasPowerBombs()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBottomHeatedRoomFirst()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBottomHeatedRoomSecond()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHeatedRoomUnderBrinstarElevator()
  local condition = AccessNorfair() and
    NorfairLowerRightShaft()
    and HasSuperMissiles()
    and (CanTraverseHeat() or Hellrun(4) or Has("SpeedBooster") and Hellrun(1))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairSpaceBoostMissile()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and HasSuperMissiles()
    and (Has("SpeedBooster") or (CanBombBlock() or HasAll({"LongBeam", "WaveBeam"})
      and (Has("PowerGrip") or (CanGravitySuit() and Has("HiJump")))))
    and (CanHJSJIBJOrGrip() or CanWalljump())
    and ((CanIBJ() and CanGravitySuit())
      or (CanSpaceJump() and Has("PowerGrip"))
      or (Has("IceBeam") and HasAny({"PowerGrip", "HiJump", "Bomb"}))
    )

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairSpaceBoostSuperMissile()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and HasSuperMissiles()
    and (Has("SpeedBooster")
      or (CanBombBlock()
        or HasAll({"LongBeam", "WaveBeam"}))
        and (Has("PowerGrip")
          or (CanGravitySuit() and Has("HiJump")))
      )
    and (CanHJSJIBJOrGrip() or CanWalljump())
    and (CanIBJ() or CanSpaceJump() or HasAll({"IceBeam", "HiJump"}) or (CanGravitySuit() and CanWalljump() and Has("HiJump")))


  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairIceBeam()
  local condition = AccessNorfair() and
    NorfairUpperRightShaft()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHeatedRoomAboveIceBeam()
  local condition = AccessNorfair() and
    NorfairUpperRightShaft()
    and (CanTraverseHeat() or Hellrun(1))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHiJump()
  local condition = AccessNorfair() and
    NorfairLowerRightShaft() and HasMissiles()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBigRoom()
  local condition = AccessNorfair() and
    (Has("SpeedBooster")
    or (NorfairRightShaftAccess()
      and (CanIBJ() or CanSpaceJump()
        or (Has("IceBeam")
          and (HasAny({"HiJump", "PowerGrip"}) or CanWalljump())))))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBehindTopChozoStatue()
  local condition = AccessNorfair() and
    NorfairBehindIceBeam()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairLarvaCeilingETank()
  local condition = AccessNorfair() and
    NorfairToSaveBehindHiJump()
    and MissileCount(4)
    and HasAll({"WaveBeam", "SpeedBooster"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairRightShaftLower()
  local condition = AccessNorfair() and
    NorfairLowerRightShaft()
    and (CanIBJ() or (Has("PowerGrip") and (CanHiJump() or CanWalljump())))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairRightShaftBottom()
  local condition = AccessNorfair() and
    NorfairBottomRightShaft()
    and (CanHJSJIBJOrGrip() or CanWalljump() or Has("IceBeam"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Ridley

function RidleySouthwestPuzzleTop()
  local condition = AccessRidley() and
    (RidleyLongWayRightShaftAccess() or RidleyShortcutRightShaftAccess())
    and Has("SpeedBooster")
    and (Has("PowerGrip") or CanSpaceJump())
    and (Has("PowerGrip") or HasPowerBombs() or HasAll({"LongBeam", "WaveBeam"}))
    and (MissileCount(5) and (CanWalljump() or CanSpaceJump() or Has("PowerGrip")))


  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySouthwestPuzzleBottom()
  local condition = AccessRidley() and
    (RidleyLongWayRightShaftAccess() or RidleyShortcutRightShaftAccess())
    and Has("SpeedBooster")
    and (Has("PowerGrip") or CanSpaceJump())
    and (Has("PowerGrip") or HasPowerBombs() or HasAll({"LongBeam", "WaveBeam"}))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyWestPillar()
  local condition = AccessRidley() and
    RidleyLongWayRightShaftAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyETankBehindGravity()
  local condition = AccessRidley() and
    RidleyGravitySuit() == AccessibilityLevel.Normal

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyGravitySuit()
  local condition = AccessRidley() and
    RidleyCentralAccess()
    and MissileCount(40)
    and Has("EnergyTank", 3)
    and ((Has("IceBeam") and HasAny({"HiJump", "PowerGrip"})) or CanIBJ() or CanSpaceJump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeFloorETank()
  local condition = AccessRidley() and
    RidleyLeftShaftAccess()
    and (CanHJSJIBJOrGrip() or CanWalljump())
    and CanBombBlock()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyUpperBallCannonPuzzle()
  local condition = AccessRidley() and
    RidleyCentralAccess()
    and CanBallCannon()
    and ((CanWalljump() and Has("PowerGrip")) or Has("HiJump") or CanIBJ())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLowerBallCannonPuzzle()
  local condition = AccessRidley() and
    RidleyCentralAccess()
    and CanBallCannon()
    and (HasAny({"HiJump", "Bomb"}) or CanWalljump() or CanSpaceJump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyImagoSuperMissile()
  local condition = AccessRidley() and
    (CanHJSJIBJOrGrip() or CanWalljump())
    and (MissileCount(20) or Has("ChargeBeam"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallUpper()
  local condition = AccessRidley() and
    RidleyCentralAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallLower()
  local condition = AccessRidley() and
    RidleyCentralAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLongHall()
  local condition = AccessRidley() and
    (RidleyLongWayRightShaftAccess() or RidleyShortcutRightShaftAccess())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyCenterPillarMissile()
  local condition = AccessRidley() and
    RidleyCentralAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomMissile()
  local condition = AccessRidley() and
    RidleyCentralAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomSuper()
  local condition = AccessRidley() and
    RidleyCentralAccess() and HasSuperMissiles()
    and (CanIBJ() or CanWalljump() or CanSpaceJump() or HasAll({"HiJump", "PowerGrip"}))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeLavaMissile()
  local condition = AccessRidley() and
    RidleyCentralAccess()
    and (Has("WaveBeam") or CanBombBlock())
    and (CanIBJ() or Has("PowerGrip"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyOwlETank()
  local condition = AccessRidley() and
    RidleyCentralAccess()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyNortheastCornerMissile()
  local condition = AccessRidley() and
    HasMissiles()
    and (CanIBJ() or (Has("PowerGrip") and HasPowerBombs() and HasAny({"IceBeam", "HiJump"})))
    and (CanBombBlock() or Has("ScrewAttack"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBombPuzzle()
  local condition = AccessRidley() and
    (RidleyLongWayRightShaftAccess() or RidleyShortcutRightShaftAccess())
    and HasAll({"SpeedBooster", "Bomb", "PowerGrip"})
    and (CanWalljump() or Has("HiJump") or CanSpaceJump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySpeedJump()
  local condition = AccessRidley() and
    (RidleyLongWayRightShaftAccess() or RidleyShortcutRightShaftAccess())
    and HasAll({"WaveBeam", "SpeedBooster"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Tourian

function TourianLeftOfMotherBrain()
  local condition = AccessTourian() and
    ChozoGhostDefeatable() and Has("SpeedBooster") and Has("SpaceJump")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function TourianUnderMotherBrain()
  local condition = AccessTourian() and
    MotherBrainDefeatable() and HasSuperMissiles()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Crateria

function CrateriaLandingSiteBallspark()
  local condition = AccessCrateria() and
    ChozoGhostDefeatable() and CanBallspark()
    and (CanGravitySuit() or false) -- CanReachEntrance("Brinstar-Crateria ball cannon")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaPowerGrip()
  local condition = AccessCrateria() and
    HasAny({"Bomb", "HiJump"}) and CanHJSJIBJOrGrip()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaMoat()
  local condition = AccessCrateria()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaStatueWater()
  -- I expect this will break.
  local condition = AccessCrateria() and
    CrateriaPlasmaBeam() == AccessibilityLevel.Normal

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaPlasmaBeam()
  local condition = AccessCrateria() and
    HasAny({"Bomb", "HiJump"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaEastBallspark()
  local condition = AccessCrateria() and
    CanBallspark() and (CanSpaceJump() or CanWalljump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaNortheastCorner()
  local condition = AccessCrateria() and
    (Has("SpeedBooster")
    and (CanSpaceJump() or CanWalljump() or CanTrickySparks()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Chozodia

function ChozodiaUpperCrateriaDoor()
  local condition = AccessChozodia() and
    HasMissiles()
    and (CanWalljump() or CanIBJ() or CanSpaceJump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaBombMaze()
  local condition = AccessChozodia() and
    (CanIBJ() or CanBallspark() or (Has("PowerGrip") and (CanWalljump() or CanSpaceJump())))
    and (Has("Bomb") or PowerBombCount(6))
    and (Has("Bomb") or Has("HiJump"))
    and (Has("HiJump") or CanIBJ() or (Has("PowerGrip") and CanWalljump()))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaZoomerMaze()
  local condition = AccessChozodia() and
    (CanIBJ() or CanBallspark() or (Has("PowerGrip") and (CanWalljump() or CanSpaceJump())))
    and (CanIBJ() or (Has("HiJump") and HasAny({"SpeedBooster", "PowerGrip"})))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaRuinsNearUpperCrateriaDoor()
  local condition = AccessChozodia() and
    HasMissiles()
    and (CanWalljump() or CanIBJ() or CanSpaceJump())
    and Has("PowerBombTank")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaMorphTunnelAboveWater()
  local condition = AccessChozodia() and
    ChozoGhostDefeatable() and HasAny({"HiJump", "Bomb"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaUnderwater()
  local condition = AccessChozodia() and
    ChozoGhostDefeatable() and CanGravitySuit() and Has("SpeedBooster")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderChozoGhostAreaWater()
  local condition = AccessChozodia() and
    ChozodiaGhostFromUpperCrateriaDoor() or MotherBrainDefeatable()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubeETank()
  local condition = AccessChozodia() and
    (CanIBJ() or CanBallspark() or (Has("PowerGrip") and (CanWalljump() or CanSpaceJump())))
    and MissileCount(6)
    and Has("SpeedBooster")

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaLavaSuper()
  local condition = AccessChozodia() and
    ChozoGhostDefeatable()
    and ((CanGravitySuit() and ((Has("PowerGrip") and HasAny({"HiJump", "Bomb"}))
      or CanIBJ()))
      or (HasAll({"HiJump", "PowerGrip"}) and (Has("VariaSuit") or Hellrun(6))))
    and (CanWalljump() or (CanGravitySuit() and (CanIBJ() or CanSpaceJump())))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaOriginalPowerBomb()
  local condition = AccessChozodia() and
    ChozodiaToCockpit()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaNextToOriginalPowerBomb()
  local condition = AccessChozodia() and
    ChozodiaToCockpit()
    and Has("PowerBombTank")
    and (CanSpaceJump() or CanIBJ())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubePowerBomb()
  local condition = AccessChozodia() and
    ChozodiaGlassTubeFromCrateriaDoor()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaLongShinespark()
  local condition = AccessChozodia() and
    ChozoGhostDefeatable() and Has("SpeedBooster") and CanGravitySuit()

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaShortcutSuper()
  local condition = AccessChozodia() and
    (ChozodiaTubeToMothershipCentral() or ChozoGhostDefeatable())
    and HasAny({"SuperMissileTank", "PowerBombTank"})
    and (CanIBJ() or CanWalljump() or CanSpaceJump())

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaWorkbotSuper()
  local condition = AccessChozodia() and
    (ChozodiaTubeToMothershipCentral() or ChozoGhostDefeatable())
    and MissileCount(5)

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaMothershipCeilingNearZSSStart()
  local condition = AccessChozodia() and
    ChozodiaTubeToMothershipCentral() or (ChozoGhostDefeatable() and Has("PowerBombTank"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderMechaRidleyHallway()
  local condition = AccessChozodia() and
    ChozodiaToCockpit()
    and (Has("PowerGrip") or CanIBJ())
    and HasAll({"PowerBombTank", "SpeedBooster"})

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaSoutheastCornerInHull()
  local condition = AccessChozodia() and
    ChozodiaTubeToMothershipCentral() or (ChozoGhostDefeatable() and Has("PowerBombTank"))

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end
