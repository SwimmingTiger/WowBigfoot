
local GUI = LibStub('NetEaseGUI-2.0');
if not GUI then return end

local bfQR,qrcodeText

local instanceT = {
	-- [557] = "http://wow.178.com",
	[477] = "http://wow.178.com/201410/208721055772.html",		-- 悬槌堡
	[457] = "http://wow.178.com/201411/209934940763.html",		-- 黑石铸造厂
}

--Creature/Vehicle/Pet
----<type>:<subtype>:<realmID>:<mapID>:<serverID>:<dbID>:<creationbits>
--Player/Item
----<type>:<realmID>:<dbID>
local function GetCIDFromGUID(guid)
	local type, _, playerdbID, _, _, cid, creationbits = strsplit(":", guid or "")
	if type and (type == "Creature" or type == "Vehicle" or type == "Pet") then
		return tonumber(cid)
	elseif type and (type == "Player" or type == "Item") then
		return tonumber(playerdbID)
	end
	return 0
end

local function drawQRCodes(url,text)
	bfQR:SetValue(url)
	qrcodeText:SetText(string.format("%s 攻略扫描", text))
end

local function creatQRInfo()
	local instanceID = EncounterJournal.instanceID
	if instanceT[instanceID] then
		BigFootQRCodesFrame:Show();
		drawQRCodes(instanceT[instanceID],EJ_GetInstanceInfo(instanceID));
	else
		BigFootQRCodesFrame:Hide();
	end
end

local function BigFootQRCodesFrameUpdate()
	if EncounterJournalNavBarButton2 and EncounterJournalNavBarButton2:IsShown() then
		creatQRInfo();
	end
end

local function BigFootQRCodes_Initialize()
	BigFootQRCodesFrame:SetParent(EncounterJournal.encounter);
	BigFootQRCodesFrame:SetFrameLevel(EncounterJournal:GetFrameLevel());
	BigFootQRCodesFrame:SetPoint("TOPLEFT",EncounterJournal,"BOTTOMRIGHT",-3,183);
	bfQR = GUI:GetClass('QRCodeWidget'):New(BigFootQRCodesFrame)
	bfQR:SetSize(150, 150)
	bfQR:SetToplevel(true)
	bfQR:SetPoint('CENTER', BigFootQRCodesFrame, 'CENTER', 0, 6)
	qrcodeText = bfQR:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	qrcodeText:SetPoint('TOP', bfQR, 'BOTTOM', 0, 0)
	hooksecurefunc("EncounterJournal_DisplayInstance",function ()
		BigFootQRCodesFrameUpdate()
	end)
end

do
	if IsAddOnLoaded("Blizzard_EncounterJournal") then
		BigFootQRCodes_Initialize()
	else
		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(_,event,...)
			if event=="ADDON_LOADED" and select(1,...) == "Blizzard_EncounterJournal" then
				BigFootQRCodes_Initialize()
				f:UnregisterEvent("ADDON_LOADED")
				f = nil;
			end
		end)
	end
end