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

-- yaml options
LAYOUT_PATCHES = false
UNKNOWN_ITEMS_ALWAYS_USABLE = true
HEATRUNS_LAVADIVES = false
IBJ_IN_LOGIC = false
WALLJUMPS_IN_LOGIC = false
CAN_TRICKY_SPARKS = false

-- Bosses
CHOZO_GHOST_DEFEATED = false


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
  return Has("SpaceJump") and (CHOZO_GHOST_DEFEATED or UNKNOWN_ITEMS_ALWAYS_USABLE)
end

function CanTraverseHeat()
  return Has("VariaSuit") or CanGravitySuit()
end

function CanGravitySuit()
  return Has("GravitySuit") and (CHOZO_GHOST_DEFEATED or UNKNOWN_ITEMS_ALWAYS_USABLE)
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

-- AccessBrinstar
-- AccessNorfair
-- AccessCrateria
-- AccessKraid
-- AccessRidley
-- AccessTourian
-- AccessChozodia


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

