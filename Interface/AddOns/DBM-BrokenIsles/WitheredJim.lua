local mod	= DBM:NewMod(1796, "DBM-BrokenIsles", nil, 822)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20200806141949")
mod:SetCreatureID(102075)--112350
--mod:SetEncounterID(1880)
mod:SetReCombatTime(20)

mod:RegisterCombat("combat")
