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
    Has("Bomb")

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

function KraidSpaceJumpUnknownItem2()
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
    KraidSpaceJumpUnknownItem2()
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
    CanIBJ() or (Has("PowerGrip") or HasAll({"HiJump", "IceBeam"}))

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
    Has("SpeedBooster")
    or (NorfairRightShaftAccess()
      and (CanIBJ() or CanSpaceJump()
        or (Has("IceBeam")
          and (HasAny({"HiJump", "PowerGrip"}) or CanWalljump()))))

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
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySouthwestPuzzleBottom()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyWestPillar()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyETankBehindGravity()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyGravitySuitUnknownItem3()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeFloorETank()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyUpperBallCannonPuzzle()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLowerBallCannonPuzzle()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyImagoSuperMissile()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallUpper()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallLower()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLongHall()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyCenterPillarMissile()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomMissile()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomSuper()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeLavaMissile()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyOwlETank()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyNortheastCornerMissile()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBombPuzzle()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySpeedJump()
  local condition = true

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
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaMoat()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaStatueWater()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaPlasmaBeamUnknownItem1()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaEastBallspark()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaNortheastCorner()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

-- Chozodia

function ChozodiaUpperCrateriaDoor()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaBombMaze()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaZoomerMaze()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaRuinsNearUpperCrateriaDoor()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaMorphTunnelAboveWater()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaUnderwater()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderChozoGhostAreaWater()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubeETank()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaLavaSuper()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaOriginalPowerBomb()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaNextToOriginalPowerBomb()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubePowerBomb()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaLongShinespark()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaShortcutSuper()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaWorkbotSuper()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaMothershipCeilingNearZSSStart()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderMechaRidleyHallway()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaSoutheastCornerInHull()
  local condition = true

  if condition then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end
