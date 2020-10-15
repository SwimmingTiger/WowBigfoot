if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
	return
end
local mod	= DBM:NewMod("z628", "DBM-PvP")

mod:SetRevision("20201014230650")
mod:SetZone()
mod:RegisterEvents("ZONE_CHANGED_NEW_AREA")

do
	function mod:OnInitialize()
		if DBM:GetCurrentArea() == 628 then
			DBM:GetModByName("PvPGeneral"):SubscribeAssault(169, 5)
			-- TODO: Add gate health
			-- TODO: Add boss health
		end
	end

	function mod:ZONE_CHANGED_NEW_AREA()
		self:ScheduleMethod(1, "OnInitialize")
	end
end
