function Has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function BrinstarMorphBall()
  return AccessibilityLevel.Normal
end

function BrinstarMorphBallCannon()
  if Has("Bomb") then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarLongBeam()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarCeilingETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarMissileAboveSuper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarSuperMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarTopMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarSpeedBoosterShortcutMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarVariaSuit()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarWormDrop()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarAcidNearVaria()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarFirstMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBehindHive()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarUnderBridge()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarPostHiveMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarUpperPillarMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBehindBombs()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarBomb()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function BrinstarPostHiveETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidGiantHoppersMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSaveRoomMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidCrumbleBlockMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidQuadBallCannonRoom()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpaceJumpUnknownItem2()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidAcidBallspark()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpeedBooster()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidWormMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidPillarMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidAcidFall()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidWormETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidSpeedJump()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function KraidUpperRightMorphBallCannon()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairLavaPowerBomb()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairLavaMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairScrewAttack()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairScrewAttackMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairPowerGripMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairUnderCrateriaElevator()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairWaveBeam()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBombTrap()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBottomHeatedRoomFirst()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBottomHeatedRoomSecond()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHeatedRoomUnderBrinstarElevator()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairSpaceBoostMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairSpaceBoostSuperMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairIceBeam()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHeatedRoomAboveIceBeam()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairHiJump()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBigRoom()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairBehindTopChozoStatue()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairLarvaCeilingETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairRightShaftLower()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function NorfairRightShaftBottom()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySouthwestPuzzleTop()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySouthwestPuzzleBottom()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyWestPillar()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyETankBehindGravity()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyGravitySuitUnknownItem3()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeFloorETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyUpperBallCannonPuzzle()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLowerBallCannonPuzzle()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyImagoSuperMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallUpper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyAfterSidehopperHallLower()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyLongHall()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyCenterPillarMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBallRoomSuper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyFakeLavaMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyOwlETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyNortheastCornerMissile()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleyBombPuzzle()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function RidleySpeedJump()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function TourianLeftOfMotherBrain()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function TourianUnderMotherBrain()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaLandingSiteBallspark()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaPowerGrip()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaMoat()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaStatueWater()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaPlasmaBeamUnknownItem1()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaEastBallspark()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function CrateriaNortheastCorner()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUpperCrateriaDoor()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaBombMaze()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaZoomerMaze()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaRuinsNearUpperCrateriaDoor()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaMorphTunnelAboveWater()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaUnderwater()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderChozoGhostAreaWater()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubeETank()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaLavaSuper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaOriginalPowerBomb()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaNextToOriginalPowerBomb()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaGlassTubePowerBomb()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaChozoGhostAreaLongShinespark()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaShortcutSuper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaWorkbotSuper()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaMothershipCeilingNearZSSStart()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaUnderMechaRidleyHallway()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end

function ChozodiaSoutheastCornerInHull()
  if true then
    return AccessibilityLevel.Normal
  end

  return AccessibilityLevel.None
end
