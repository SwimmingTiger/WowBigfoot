
local InspectLess = LibStub("LibInspectLess-1.0")

local OFFSET_X, OFFSET_Y = 2, 2;
local INVSLOT_AVALIABLE = 16
local S_ITEM_LEVEL = ITEM_LEVEL:gsub("%%d", "(%%d+)")

local tip
if not tip then
	-- Create a custom tooltip for scanning
	tip = CreateFrame("GameTooltip", "GearStatsSummaryTooltip", nil, "ShoppingTooltipTemplate")
	tip:SetOwner(UIParent, "ANCHOR_NONE")
	for i = 1, 40 do
		tip[i] = _G["GearStatsSummaryTooltipTextLeft"..i]
		if not tip[i] then
			tip[i] = tip:CreateFontString()
			tip:AddFontStrings(tip[i], tip:CreateFontString())
			_G["GearStatsSummaryTooltipTextLeft"..i] = tip[i]
		end
	end
elseif not _G["GearStatsSummaryTooltipTextLeft40"] then
	for i = 1, 40 do
		_G["GearStatsSummaryTooltipTextLeft"..i] = tip[i]
	end
end

local function PraseItemSet(text)
	local value = text:match(RATING_SUMMARY_ITEM_SUIT_FORMAT);
	if value then
		return value;
	end
end

local trinket82 = GetItemInfo(167555) --口袋计算装置
local function ScanItemTooltip(unit, slot)
    if not unit then return end
	tip:SetOwner(UIParent, "ANCHOR_NONE")
	for i = 1,4 do
		if _G[ tip:GetName() .."Texture"..i] then
			_G[ tip:GetName() .."Texture"..i]:SetTexture("")
		end
	end
	tip:SetInventoryItem(unit, slot);
	tip:Show();

	local itemLevel, GemsSlotCount, GemsEmptyCount = 0, 0, 0;
	local itemSet;
	local ret;

	for i = 2, tip:NumLines() do
		local text = _G[ tip:GetName() .."TextLeft"..i]:GetText();
		if(text and text ~= "") then
			ret = tonumber(text:match(S_ITEM_LEVEL));
			if ret then
				itemLevel = ret
			end

			ret = PraseItemSet(text);
			if ret then
				itemSet = ret
			end
		end
	end

    if _G[ tip:GetName() .."TextLeft1"]:GetText() ~= trinket82 then
		for i = 1,4 do
			local texture = _G[ tip:GetName() .."Texture"..i]
			if ( texture ) then
				local texture = _G[ tip:GetName() .."Texture"..i]:GetTexture();
				if ( texture ) then
					GemsSlotCount = GemsSlotCount + 1
					if string.find(texture, "EmptySocket") or texture == 458977 then
						GemsEmptyCount = GemsEmptyCount + 1
					end
				end
			end
		end
    end

	tip:Hide();
	if slot == 2 and GetInventoryItemQuality(unit, 2) == 6 then GemsSlotCount,GemsEmptyCount = 0, 0 end -- 艾泽拉斯之心
	return itemLevel, itemSet, GemsSlotCount, GemsEmptyCount
end

local function SetOrHookScript(frame, scriptName, func)
	if( frame:GetScript(scriptName) ) then
		frame:HookScript(scriptName, func);
	else
		frame:SetScript(scriptName, func);
	end
end

function GearStatsSummary_OnLoad(self)
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("UNIT_INVENTORY_CHANGED");
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
	self:RegisterEvent("ITEM_UPGRADE_MASTER_UPDATE");
	self:RegisterEvent("REPLACE_ENCHANT");

	InspectLess:RegisterCallback("InspectLess_InspectItemReady", GearStatsSummary_InspectItemReady)
	-- InspectLess:RegisterCallback("InspectLess_InspectReady", GearStatsSummary_InspectReady)
	SetOrHookScript(GearManagerDialogPopup, "OnShow", GearStatsSummary_InspectFrame_OnHide)
	if CoreDependCall then --why do this?
		CoreDependCall("Blizzard_TradeSkillUI", function()
			SetOrHookScript(TradeSkillFrame, "OnShow", GearStatsSummary_InspectFrame_OnHide)
		end)
	end
end

function GearStatsSummary_SetupHook()
	hooksecurefunc("InspectPaperDollFrame_OnShow", GearStatsSummary_InspectFrame);
	SetOrHookScript(InspectFrame, "OnShow", GearStatsSummary_InspectFrame);
	SetOrHookScript(InspectFrame, "OnHide", GearStatsSummary_InspectFrame_OnHide);
	hooksecurefunc("InspectFrame_UnitChanged", GearStatsSummary_InspectFrame_UnitChanged);
end

local function AddGem(TblGems, gem, addNum)
	if TblGems[gem] == nil then
		TblGems[gem] = addNum or 1
	else
		TblGems[gem] = TblGems[gem] + (addNum or 1)
	end
end

function GearStatsSummary_UpdateAnchor(doll, insp)
	if not doll then doll = PaperDollFrame:IsVisible() elseif doll<0 then doll = nil end
	if not insp then insp = InspectFrame and InspectFrame:IsVisible() elseif insp<0 then insp = nil end

	local at, ax, ay = nil, 0, 0
	if InspectEquip_InfoWindow and InspectEquip_InfoWindow:IsVisible() then
		at = InspectEquip_InfoWindow; ax=1; ay=-1
	elseif(doll) then
		at = PaperDollFrame; ax=OFFSET_X; ay=OFFSET_Y
	elseif(insp) then
		at = InspectFrame; ax=OFFSET_X; ay=OFFSET_Y
	end

	local af = nil;
	if GearStatsSummaryTargetFrame:IsVisible() then
		GearStatsSummarySelfFrame:ClearAllPoints()
		GearStatsSummarySelfFrame:SetPoint("TOPLEFT", GearStatsSummaryTargetFrame, "TOPRIGHT", 0, 0)
		af = GearStatsSummaryTargetFrame
	elseif GearStatsSummarySelfFrame:IsVisible() then
		af = GearStatsSummarySelfFrame
	end

	if(at and af) then
		af:ClearAllPoints();
		af:SetPoint("TOPLEFT", at, "TOPRIGHT", ax, E and 0 or ay)
	end

end

function GearStatsSummary_OnEvent(self, event, ...)
	local arg1, arg2, arg3 = ...;

	if event == "ADDON_LOADED" then
		if arg1 == "GearStatsSummary"then
			SetOrHookScript(PaperDollFrame, "OnShow", GearStatsSummary_PaperDollFrame_OnShow);
			SetOrHookScript(PaperDollFrame, "OnHide", GearStatsSummary_PaperDollFrame_OnHide);
			if IsAddOnLoaded("Blizzard_InspectUI") then
				GearStatsSummary_SetupHook();
				self:UnregisterEvent("ADDON_LOADED");
			end
		elseif arg1 == "Blizzard_InspectUI"then
			GearStatsSummary_SetupHook();
			self:UnregisterEvent("ADDON_LOADED");
		end
	end

	if event == "UNIT_INVENTORY_CHANGED" or event == "PLAYER_EQUIPMENT_CHANGED" then
		if ((arg1 == "player" or event == "PLAYER_EQUIPMENT_CHANGED") and GearStatsSummarySelfFrame:IsVisible()) then
			GearStatsSummary_HideFrame(GearStatsSummarySelfFrame);
			if (GearStatsSummaryTargetFrame:IsVisible()) then
				GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,GearStatsSummaryTargetFrame,UnitName("player"),0,0);
			else
				GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,PaperDollFrame,UnitName("player"),OFFSET_X,OFFSET_Y);
			end
		elseif ( InspectFrame and InspectFrame:IsVisible() and arg1 == InspectFrame.unit and GearStatsSummaryTargetFrame:IsVisible()) then
			GearStatsSummary_HideFrame(GearStatsSummaryTargetFrame);
			GearStatsSummary_ShowFrame(GearStatsSummaryTargetFrame,InspectFrame,UnitName(InspectFrame.unit),OFFSET_X,OFFSET_Y);
			GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,GearStatsSummaryTargetFrame,UnitName("player"),0,0);
		end
	end

	if event == "ITEM_UPGRADE_MASTER_UPDATE" or event == "REPLACE_ENCHANT" then
		if GearStatsSummarySelfFrame:IsVisible() then
			GearStatsSummary_HideFrame(GearStatsSummarySelfFrame);
			GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,PaperDollFrame,UnitName("player"),OFFSET_X,OFFSET_Y);
		end
	end
end

local toogle
function GearStatsSummary_PaperDollFrame_OnShow()
	if not toogle then return end
	if not InspectFrame or not InspectFrame:IsVisible() then
		GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,PaperDollFrame,UnitName("player"),OFFSET_X,OFFSET_Y);
	end
	GearStatsSummary_UpdateAnchor(1)
end

function GearStatsSummary_PaperDollFrame_OnHide()
	if not InspectFrame or not InspectFrame:IsVisible() then
		GearStatsSummary_HideFrame(GearStatsSummarySelfFrame);
	end
	GearStatsSummary_UpdateAnchor(-1)
end

function GearStatsSummary_InspectFrame(self)
	if not self.unit then return end
	if InspectLess:IsDone() and InspectLess:GetGUID()==UnitGUID(self.unit) then
		GearStatsSummary_InspectItemReady("InspectLess_InspectItemReady", self.unit, InspectLess:GetGUID(), InspectLess:IsDone());
	end
	if not IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("Tukui") then
		local guild, level, levelid = GetGuildInfo(self.unit)
		if(guild) then
			InspectTitleText:Show();
			InspectTitleText:SetText("<"..guild.."> "..level.." ["..levelid.."]"); -- edited
		else
			InspectTitleText:SetText("");
		end
	end
end

function GearStatsSummary_InspectItemReady(event, unit, guid, ready)
	if(not InspectFrame or not InspectFrame:IsVisible()) then return end;
	GearStatsSummary_ShowFrame(GearStatsSummaryTargetFrame,InspectFrame,UnitName(InspectFrame.unit),OFFSET_X,OFFSET_Y,ready);
	GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,GearStatsSummaryTargetFrame,UnitName("player"),0,0);
	GearStatsSummary_UpdateAnchor(nil, 1, nil)
end

local function GetTalentSpec(unit)
	local spec
	if not unit then
		spec = GetSpecialization()
	else
		spec = GetInspectSpecialization(unit)
	end
	if(spec ~= nil and spec > 0) then
		if unit ~= nil then
			local _, name = GetSpecializationInfoByID(spec);
			return name
		else
			local _, name = GetSpecializationInfo(spec)
			return name
		end
	end
end

local function GearStatsSummary_SetFrameText(frame, tiptitle, tiptext, unit)
	local text = getglobal(frame:GetName().."Text");
	local title = getglobal(frame:GetName().."Title");

	if tiptitle then title:SetText(tiptitle); end

	text:SetText(tiptext);

	local height = text:GetStringHeight();
	local width = text:GetStringWidth();
	if(width < title:GetStringWidth()) then
		width = title:GetStringWidth();
	end
	frame:SetHeight(height+30);
	frame:SetWidth(width+10);
end

function GearStatsSummary_InspectReady(event, unit, guid, done)
	if done then
		local frame = GearStatsSummaryTargetFrame;

		if frame:IsVisible() and not frame.talented then
			local tiptext = getglobal(frame:GetName().."Text"):GetText();

			--主天赋显示在装备等级后
			local talent = GetTalentSpec(unit)
			if talent then tiptext = tiptext:gsub("([^\n]*"..RATING_SUMMARY_ITEM_LEVEL_SHORT.."：".."[^\n]*)", "%1 ("..talent.." ) ") end

			tiptext = tiptext.."\n\n"..GearStatsSummary_GetTalentString(true)
			frame.talented = true;
			GearStatsSummary_SetFrameText(frame, nil, tiptext, InspectFrame.unit);
		end
	end
end

function GearStatsSummary_InspectFrame_OnHide()
	GearStatsSummary_HideFrame(GearStatsSummaryTargetFrame);
	GearStatsSummary_HideFrame(GearStatsSummarySelfFrame);
	GearStatsSummary_UpdateAnchor(nil, -1, nil)
end

function GearStatsSummary_InspectFrame_UnitChanged()
	if ( InspectFrame and InspectFrame:IsVisible() and GearStatsSummaryTargetFrame:IsVisible()) then
		GearStatsSummary_HideFrame(GearStatsSummaryTargetFrame);
		GearStatsSummary_ShowFrame(GearStatsSummaryTargetFrame,InspectFrame,UnitName(InspectFrame.unit),OFFSET_X,OFFSET_Y);
		GearStatsSummary_ShowFrame(GearStatsSummarySelfFrame,GearStatsSummaryTargetFrame,UnitName("player"),0,0);
	end
end

local function GearStatsSummary_GetTalentString(isInspecting)
	local active, inact

	if(isInspecting)then
		local unit = InspectFrame.unit
		if(unit)then
			active = GetInspectSpecialization(unit)
			if(active and active>0) then active = select(2, GetSpecializationInfoByID(active)) end
		end
	else
		active = GetSpecialization();
		active = active and select(2, GetSpecializationInfo(active))
	end

	if(active or inact)then
		if(inact)then
			return active, inact
		else
			return active
		end
	else
		return ""
	end
end

local function RS_GetTalentFormat(active , inact)
	if(active or inact)then
		local talentString = SPECIALIZATION..": ";
		talentString=talentString..NORMAL_FONT_COLOR_CODE..(active or EMPTY)..FONT_COLOR_CODE_CLOSE
		if(inact)then
			talentString = talentString.." / "..GRAY_FONT_COLOR_CODE..inact..FONT_COLOR_CODE_CLOSE
		end
		return talentString
	else
		return ""
	end
end

function GearStatsSummary_ShowFrame(frame,target,tiptitle,anchorx,anchory,ready)
	local unit = "player";
	if(GearStatsSummaryTargetFrame == frame) then
		if(InspectFrame.unit) then
			unit = InspectFrame.unit;
		else
			return;
		end
    end
	local inspecting = unit~="player"

	-- 名字 职业
	local uclocale, uc = UnitClass(unit)
	tiptitle = tiptitle .."  |c"..RAID_CLASS_COLORS[uc]["colorStr"]..uclocale..FONT_COLOR_CODE_CLOSE --add class in title

	local tiptext = "";

	local sum, GSSTJ = GearStatsSummary_Sum(inspecting);
	local avgLevel = (sum["ITEMLEVEL"] or 0) / sum["ITEMSLOTFORCALC"]

	-- 装等
	if(avgLevel and avgLevel > 0) then
		tiptext = tiptext.."\n"..NORMAL_FONT_COLOR_CODE..RATING_SUMMARY_ITEM_LEVEL_SHORT..": "..FONT_COLOR_CODE_CLOSE..HIGHLIGHT_FONT_COLOR_CODE..format("%.1f",avgLevel)..FONT_COLOR_CODE_CLOSE
	end

	-- 装备列表
	tiptext = tiptext.."\n\n"..HIGHLIGHT_FONT_COLOR_CODE..RATING_SUMMARY_ITEM_LIST_TITLE..":"..FONT_COLOR_CODE_CLOSE;
	for _, v in pairs(sum["ItemLink"]) do
		if v then
			tiptext = tiptext.."\n"..v
		end
	end

	-- 套装
	if GSSTJ and next(GSSTJ) then
		tiptext = tiptext.."\n\n"..RATING_SUMMARY_ITEM_SUIT
		local _,_,_,colorCode = GetItemQualityColor(4)
		for k, v in pairs(GSSTJ) do
			if v > 0 and k:find('0/') then
				k = k:gsub('0/', tostring(v)..'/')
			end
			tiptext = tiptext..'\n'..format("|c"..colorCode.."%s |r", k)
		end
	end

	--[[
	tiptext = tiptext.."\n\n"..HIGHLIGHT_FONT_COLOR_CODE..RATING_SUMMARY_ITEM_LEVEL_TITLE..":"..FONT_COLOR_CODE_CLOSE;
	for v = 7, 2, -1 do
		if(sum["ITEMCOUNT"..v]) then
			local _,_,_,colorCode = GetItemQualityColor(v)
			tiptext = tiptext.."\n"..format("|c"..colorCode.."%s "..RATING_SUMMARY_ITEM_LEVEL_FORMAT.."|r", RATING_SUMMARY_ITEM_QUANLITY_NAME[v], sum["ITEMCOUNT"..v], floor(sum["ITEMLEVEL"..v]/sum["ITEMCOUNT"..v]))
		end
	end
	]]

	-- 附魔
	local total_enchant, has_enchant, missing_enchant = (sum["CanEnchant"] or 0), (sum["HasEnchant"] or 0), sum["EnchantMissing"]
	if total_enchant ~= 0 then
		tiptext = tiptext .. ('\n\n'..RATING_SUMMARY_ENCHANT..': '..(total_enchant == has_enchant and "%d" or "|cffff0000%d|r")..'/%d |cffff0000%s|r'):format(has_enchant, total_enchant, missing_enchant)
	end

	-- 宝石
	if sum["Gems"] and sum["Gems"]["GemSlotCount"] and sum["Gems"]["GemSlotCount"] > 0 then
		local total_gem, has_gem, missing_gem = sum["Gems"]["GemSlotCount"], sum["Gems"]["GemSlotCount"] - (sum["Gems"]["EmptyGemSlotCount"] or 0), sum["Gems"]["EmptyGemSlotCount"]
		local gem_info = string.format(((missing_gem == nil or missing_gem == 0) and "%d" or "|cffff0000%d|r")..'/%d',has_gem, total_gem)
		tiptext = tiptext ..'\n'..RATING_SUMMARY_GEM..': '.. gem_info
	end

	--talent
	local spec, active, inact
	if inspecting then
		spec = GetInspectSpecialization(unit)
	else
		spec = GetSpecialization()
		if spec ~= nil then
			spec = GetSpecializationInfo(spec)
		end
	end
	if not inspecting then
		active, inact = GearStatsSummary_GetTalentString(false);
	elseif ready then
		active = GearStatsSummary_GetTalentString(true);
	end
	if not inspecting then
		tiptext = tiptext.."\n\n"..RS_GetTalentFormat(active, inact);
	elseif ready then
		tiptext = tiptext.."\n\n"..RS_GetTalentFormat(active);
	else
		frame.talented = false;
	end

    --8.3 CORRUPTION
	if U1GetCorruptionInfo then
		if not inspecting then
			tiptext = tiptext .. "\n\n|cff946cd0".."合计腐蚀"..": |r".."|cff946cd0"..format("%-5d", max(0, GetCorruption() - GetCorruptionResistance()))..format("(+%d|-%d)", GetCorruption(),GetCorruptionResistance()).."|r"
		end
		local slots = { Waist=6, Legs=7, Feet=8, Wrist=9, Hands=10, Finger0=11, Finger1=12, MainHand=16, SecondaryHand=17, }
		for _, slot in pairs(slots) do
			local link = sum["ItemLink"][slot]
			if link then
				local name, corrupt, level = U1GetCorruptionInfo(link)
				if name then
					tiptext = tiptext .. "\n|cff946cd0 - ".. (level and format("%d级%s", level, name) or "1级专有") .. "    (+"..corrupt..")|r"
				end
			end
		end
	end

	GearStatsSummary_SetFrameText(frame, tiptitle, tiptext, unit);
	frame:Show();
end

function GearStatsSummary_HideFrame(frame)
	frame:Hide();
end

local ClassArmorBonus =
{ 5, 5, 4, 3, 2, 5, 4, 2, 2, 3, 3,}
-- 2=布甲,3=皮甲,4=鎖甲,5=鎧甲
function GearStatsSummary_Sum(inspecting, tipUnit)
	--local slotID;
	--[[ 0 = ammo 1 = head 2 = neck 3 = shoulder 4 = shirt 5 = chest 6 = belt 7 = legs 8 = feet 9 = wrist 10 = gloves 11 = finger 1 12 = finger 2 13 = trinket 1 14 = trinket 2 15 = back 16 = main hand 17 = off hand 18 = ranged 19 = tabard ]]--

	local unit = "player";
	if inspecting then unit = InspectFrame.unit end
	if tipUnit then unit = tipUnit end
	local _, _, ucindex = UnitClass(unit)

	local sum = {};
	sum["EnchantMissing"] = ""
	-- sum["ExtraSocketMissing"] = ""
	--sum["TinkerMissing"] = ""
	sum.ArmorBonus = ClassArmorBonus[ucindex];
	sum["ITEMSLOTFORCALC"] = INVSLOT_AVALIABLE
	sum["ItemLink"] = {}

	local GSSJTNum = {}
	for i = INVSLOT_FIRST_EQUIPPED, INVSLOT_LAST_EQUIPPED do --zhengruiw02
		local link = GetInventoryItemLink(unit, i);
		if link and i ~= INVSLOT_BODY and i ~= INVSLOT_TABARD then
			local itemName, _, quality, level, _, itemType, itemSubType, _, ItemEquipLoc = GetItemInfo(link); --TO DO: ADD UPGRADES
			local iLevel, iSet, GemsSlotCount, GemsEmptyCount = ScanItemTooltip(unit, i);

			--[[# 2 - Uncommon # 3 - Rare # 4 - Epic # 5 - Legendary # 7 Account]]
			if quality and (quality >= 2 and quality <= 7) then
				sum["ITEMCOUNT"..quality] = (sum["ITEMCOUNT"..quality] or 0) + 1;
				sum["ITEMLEVEL"..quality] = (sum["ITEMLEVEL"..quality] or 0) + iLevel;
				sum["ItemLink"][i] = "["..iLevel.."]"..link;
			end

			if iLevel then
				sum["ITEMLEVEL"] = (sum["ITEMLEVEL"] or 0) + iLevel
			end

			if i == INVSLOT_MAINHAND and GetInventoryItemLink(unit, INVSLOT_OFFHAND) == nil and (ItemEquipLoc == "INVTYPE_2HWEAPON" or ItemEquipLoc == "INVTYPE_RANGED" or ItemEquipLoc == "INVTYPE_RANGEDRIGHT" or quality == 6) then
				sum["ITEMLEVEL"] = sum["ITEMLEVEL"] + iLevel
			end

			if iSet then
				if not GSSJTNum[iSet] then GSSJTNum[iSet] = 1 else GSSJTNum[iSet] = GSSJTNum[iSet] + 1 end
			end

			local stats = {};
			stats["Gems"] = {}
			stats["Gems"]["GemSlotCount"] = 0

			if GemsSlotCount then
				AddGem(stats["Gems"], "GemSlotCount", GemsSlotCount)
			end
			if GemsEmptyCount then
				AddGem(stats["Gems"], "EmptyGemSlotCount", GemsEmptyCount)
			end

			local check, _, color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4, Suffix, Unique, LinkLvl, Reforge, Upgrade, Name = string.find(link, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%d*)|?h?%[?([^%[%]c]*)%]?|?h?|?r?");

			if Enchant ~= nil and tonumber(Enchant) and tonumber(Enchant) > 0 then --func for RS
				stats["Enchanted"] = 1
			end

			if sum["Gems"] == nil then sum["Gems"] = {} end
			for k,v in pairs(stats["Gems"]) do
				if sum["Gems"][k] == nil then sum["Gems"][k] = 0 end
				sum["Gems"][k] = sum["Gems"][k] + v
			end

			if RATING_SUMMARY_ENCHANTABLES[i] then
				local isArtifact;
				if i == INVSLOT_MAINHAND and quality == 6 then
					isArtifact = true;
				end
				if not isArtifact then
					if sum["CanEnchant"] == nil then sum["CanEnchant"] = 0 end
					if sum["HasEnchant"] == nil then sum["HasEnchant"] = 0 end
					sum["CanEnchant"] = sum["CanEnchant"] + 1
					if stats["Enchanted"] then
						sum["HasEnchant"] = sum["HasEnchant"] + 1
					else
						sum["EnchantMissing"] = sum["EnchantMissing"]..RATING_SUMMARY_ENCHANTABLES[i]
					end
				end
			end
		end
	end

	return sum, GSSJTNum;
end

function GearStatsSummary_Toogle(swith)
	toogle = swith;
	if not swith then
		GearStatsSummary_PaperDollFrame_OnHide();
	end
end
