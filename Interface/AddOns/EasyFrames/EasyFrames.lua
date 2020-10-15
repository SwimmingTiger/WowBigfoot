--[[
    Appreciate what others people do. (c) Usoltsev

    Copyright (c) <2016-2018>, Usoltsev <alexander.usolcev@gmail.com> All rights reserved.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    Neither the name of the <EasyFrames> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
    INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
    OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]

local EasyFrames = LibStub("AceAddon-3.0"):NewAddon("EasyFrames", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EasyFrames")
local Media = LibStub("LibSharedMedia-3.0")

local db

local DEFAULT_BAR_FONT_FAMILY = "Friz Quadrata TT"
local DEFAULT_BAR_FONT_SIZE = 12
local DEFAULT_BAR_SMALL_FONT_SIZE = 11
local DEFAULT_BAR_FONT_STYLE = "OUTLINE"

local DEFAULT_CUSTOM_FORMAT = "%CURRENT% / %MAX% (%PERCENT%%)"

local DefaultCustomFormatFormulas = function()
    return {
        ["gt10T"] = "%.2f万",
        ["gt100T"] = "%.2f万",
        ["gt1M"] = "%.f万",
        ["gt10M"] = "%.f万",
        ["gt100M"] = "%.f万",
        ["gt1B"] = "%.f亿",
    }
end

local function CustomReadableNumber(num, format, useFullValues)
    local ret

    if not num then
        ret = 0
    elseif num >= 1000000000 then
        ret = string.format(format["gt1B"], num / (useFullValues or 1000000000))  -- num > 1 000 000 000
    elseif num >= 100000000 then
        ret = string.format(format["gt100M"], num / (useFullValues or 10000)) -- num > 100 000 000
    elseif num >= 10000000 then
        ret = string.format(format["gt10M"], num / (useFullValues or 10000)) -- num > 10 000 000
    elseif num >= 1000000 then
        ret = string.format(format["gt1M"], num / (useFullValues or 10000)) -- num > 1 000 000
    elseif num >= 100000 then
        ret = string.format(format["gt100T"], num / (useFullValues or 10000)) -- num > 100 000
    elseif num >= 10000 then
        ret = string.format(format["gt10T"], num / (useFullValues or 10000)) -- num > 10000
    else
        ret = num -- num < 10000
    end
    return ret
end

local function ReadableNumber(num)
    local ret

    if not num then
        ret = 0
    elseif num >= 1000000000 then
        ret = string.format("%.f", num / 1000000000) .. "十亿" -- billion
    elseif num >= 100000000 then
        ret = string.format("%.1f", num / 10000) .. "亿" -- millions > 100
    elseif num >= 10000000 then
        ret = string.format("%.f", num / 10000) .. "万" -- million > 10
    elseif num >= 1000000 then
        ret = string.format("%.1f", num / 10000) .. "万" -- million > 1
    elseif num >= 100000 then
        ret = string.format("%.1f", num / 10000) .. "万" -- thousand > 100
    elseif num >= 10000 then
        ret = string.format("%.1f", num / 10000) .. "万" -- thousand
    else
        ret = num -- hundreds
    end
    return ret
end

local defaults = {
    profile = {
        general = {
            classColored = false,
            colorBasedOnCurrentHealth = false,

            customBuffSize = true,
            buffSize = 21,
            selfBuffSize = 27,
            highlightDispelledBuff = true,
            ifPlayerCanDispelBuff = true,
            dispelledBuffScale = 1,
            showOnlyMyDebuff = false,
            maxBuffCount = 32,
            maxDebuffCount = 16,

            classPortraits = true,
            hideOutOfCombat = false,
            hideOutOfCombatWithFullHP = false,
            hideOutOfCombatOpacity = 0.1,
            barTexture = "Blizzard",
            forceManaBarTexture = false,
            brightFrameBorder = 1,
            lightTexture = true,
            friendlyFrameDefaultColors = {0, 1, 0},
            enemyFrameDefaultColors = {1, 0, 0},
            neutralFrameDefaultColors = {1, 1, 0},
            showWelcomeMessage = true,
            framesPoints = false,
            frameToSetPoints = "player"
        },

        player = {
            scaleFrame = 1,
            portrait = "1",
            -- Custom HP format.
            healthFormat = "3",
            healthBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            healthBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            healthBarFontSize = DEFAULT_BAR_FONT_SIZE,
            useHealthFormatFullValues = false,
            customHealthFormatFormulas = DefaultCustomFormatFormulas(),
            customHealthFormat = DEFAULT_CUSTOM_FORMAT,
            -- Custom mana format.
            manaFormat = "custom",
            manaBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            manaBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            manaBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useManaFormatFullValues = false,
            customManaFormatFormulas = DefaultCustomFormatFormulas(),
            customManaFormat = DEFAULT_CUSTOM_FORMAT,
            -- Name
            showName = true,
            showNameInsideFrame = false,
            playerNameFontFamily = DEFAULT_BAR_FONT_FAMILY,
            playerNameFontSize = 13,
            playerNameFontStyle = "NONE",
            showHitIndicator = true,
            showSpecialbar = true,
            showRestIcon = true,
            showStatusTexture = false,
            showAttackBackground = true,
            attackBackgroundOpacity = 0.7,
            showGroupIndicator = true,
            showRoleIcon = true,
            showPVPIcon = true,
        },

        target = {
            scaleFrame = 1,
            portrait = "1",
            -- Custom HP format.
            healthFormat = "3",
            healthBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            healthBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            healthBarFontSize = DEFAULT_BAR_FONT_SIZE,
            useHealthFormatFullValues = false,
            reverseDirectionLosingHP = false,
            customHealthFormatFormulas = DefaultCustomFormatFormulas(),
            customHealthFormat = DEFAULT_CUSTOM_FORMAT,
            -- Custom mana format.
            manaFormat = "2",
            manaBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            manaBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            manaBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useManaFormatFullValues = false,
            customManaFormatFormulas = DefaultCustomFormatFormulas(),
            customManaFormat = DEFAULT_CUSTOM_FORMAT,
            -- Name.
            showName = true,
            showNameInsideFrame = false,
            targetNameFontFamily = DEFAULT_BAR_FONT_FAMILY,
            targetNameFontSize = 13,
            targetNameFontStyle = "NONE",
            showToTFrame = true,
            showAttackBackground = false,
            attackBackgroundOpacity = 0.7,
            showTargetCastbar = false,
            showPVPIcon = true,
        },

        focus = {
            scaleFrame = 1,
            portrait = "1",
            -- Custom HP format.
            healthFormat = "3",
            healthBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            healthBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            healthBarFontSize = DEFAULT_BAR_FONT_SIZE,
            useHealthFormatFullValues = false,
            reverseDirectionLosingHP = false,
            customHealthFormatFormulas = DefaultCustomFormatFormulas(),
            customHealthFormat = DEFAULT_CUSTOM_FORMAT,
            -- Custom mana format.
            manaFormat = "2",
            manaBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            manaBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            manaBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useManaFormatFullValues = false,
            customManaFormatFormulas = DefaultCustomFormatFormulas(),
            customManaFormat = DEFAULT_CUSTOM_FORMAT,
            -- Name.
            showName = true,
            showNameInsideFrame = false,
            focusNameFontFamily = DEFAULT_BAR_FONT_FAMILY,
            focusNameFontSize = 13,
            focusNameFontStyle = "NONE",
            showToTFrame = true,
            showAttackBackground = false,
            attackBackgroundOpacity = 0.7,
            showPVPIcon = true,
        },

        pet = {
            scaleFrame = 1,
            lockedMovableFrame = true,
            customPoints = false,
            -- Custom HP format.
            healthFormat = "2",
            healthBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            healthBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            healthBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useHealthFormatFullValues = false,
            customHealthFormatFormulas = DefaultCustomFormatFormulas(),
            customHealthFormat = DEFAULT_CUSTOM_FORMAT,
            -- Custom mana format.
            manaFormat = "2",
            manaBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            manaBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            manaBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useManaFormatFullValues = false,
            customManaFormatFormulas = DefaultCustomFormatFormulas(),
            customManaFormat = DEFAULT_CUSTOM_FORMAT,
            -- Name.
            showName = true,
            petNameFontFamily = DEFAULT_BAR_FONT_FAMILY,
            petNameFontSize = DEFAULT_BAR_FONT_SIZE,
            petNameFontStyle = "NONE",
            showHitIndicator = true,
            showStatusTexture = true,
            showAttackBackground = true,
            attackBackgroundOpacity = 0.7,
        },

        party = {
            scaleFrame = 1,
            -- Custom HP format.
            healthFormat = "2",
            healthBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            healthBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            healthBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useHealthFormatFullValues = false,
            customHealthFormatFormulas = DefaultCustomFormatFormulas(),
            customHealthFormat = DEFAULT_CUSTOM_FORMAT,
            -- Custom mana format.
            manaFormat = "2",
            manaBarFontStyle = DEFAULT_BAR_FONT_STYLE,
            manaBarFontFamily = DEFAULT_BAR_FONT_FAMILY,
            manaBarFontSize = DEFAULT_BAR_SMALL_FONT_SIZE,
            useManaFormatFullValues = false,
            customManaFormatFormulas = DefaultCustomFormatFormulas(),
            customManaFormat = DEFAULT_CUSTOM_FORMAT,
            -- Name.
            showName = true,
            partyNameFontFamily = DEFAULT_BAR_FONT_FAMILY,
            partyNameFontSize = DEFAULT_BAR_FONT_SIZE,
            partyNameFontStyle = "NONE",
            showPetFrames = true,
        },
    }
}

Media:Register("statusbar", "Ace", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\Ace")
Media:Register("statusbar", "Aluminium", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\Aluminium")
Media:Register("statusbar", "Banto", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\banto")
Media:Register("statusbar", "Blizzard", "Interface\\TargetingFrame\\UI-StatusBar")
Media:Register("statusbar", "Charcoal", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\Charcoal")
Media:Register("statusbar", "Glaze", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\glaze")
Media:Register("statusbar", "LiteStep", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\LiteStep")
Media:Register("statusbar", "Minimalist", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\Minimalist")
Media:Register("statusbar", "Otravi", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\otravi")
Media:Register("statusbar", "Perl", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\perl")
Media:Register("statusbar", "Smooth", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\smooth")
Media:Register("statusbar", "Striped", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\striped")
Media:Register("statusbar", "Swag", "Interface\\AddOns\\EasyFrames\\Textures\\StatusBarTexture\\swag")


Media:Register("frames", "default", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-TargetingFrame")
Media:Register("frames", "minus", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-TargetingFrame-Minus")
Media:Register("frames", "elite", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-TargetingFrame-Elite")
Media:Register("frames", "rareelite", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-TargetingFrame-Rare-Elite")
Media:Register("frames", "rare", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-TargetingFrame-Rare")
Media:Register("frames", "smalltarget", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-SmallTargetingFramex")
Media:Register("frames", "nomana", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-SmallTargetingFramex-NoMana")


Media:Register("misc", "player-status", "Interface\\AddOns\\EasyFrames\\Textures\\TargetingFrame\\UI-Player-Status")

function EasyFrames:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("EasyFramesDB", defaults, true)

    self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")

    db = self.db.profile

    self:SetupOptions()
end

function EasyFrames:OnProfileChanged(event, database, newProfileKey)
    self.db = database
    db = self.db.profile

    for _, v in self:IterateModules() do
        if (v.OnProfileChanged) then
            v:OnProfileChanged(database)
        end
    end
end

EasyFrames.Utils = {};
function EasyFrames.Utils.UpdateHealthValues(frame, healthFormat, customHealthFormat, customHealthFormatFormulas, useHealthFormatFullValues)
    local unit = frame.unit
    local healthbar = frame:GetParent().healthbar

	local Health = UnitHealth(unit)
	local HealthMax = UnitHealthMax(unit)
	local HealthPercent = (Health / HealthMax) * 100
    if (healthFormat == "1") then
        -- Percent
        if (Health > 0) then
            healthbar.TextString:SetText(format("%.0f", HealthPercent) .. "%")
        end
    elseif (healthFormat == "2") then
        -- Current + Max
        if (Health > 0) then
            healthbar.TextString:SetText(ReadableNumber(Health) .. " / " .. ReadableNumber(HealthMax));
        end
    elseif (healthFormat == "3") then
        -- Current + Max + Percent
        if (Health > 0) then
            healthbar.TextString:SetText(ReadableNumber(Health) .. " / " .. ReadableNumber(HealthMax) .. " (" .. string.format("%.0f", HealthPercent) .. "%)");
        end
    elseif (healthFormat == "4") then
        -- Current + Percent
        if (Health > 0) then
            healthbar.TextString:SetText(ReadableNumber(Health) .. " (" .. string.format("%.0f", HealthPercent) .. "%)");
        end
    elseif (healthFormat == "custom") then
        -- Own format
        if (Health > 0) then
            local useFullValues = false
            if (useHealthFormatFullValues) then
                useFullValues = 1
            end

            Health = CustomReadableNumber(Health, customHealthFormatFormulas, useFullValues)
            HealthMax = CustomReadableNumber(HealthMax, customHealthFormatFormulas, useFullValues)

            local Result = string.gsub(
                string.gsub(
                    string.gsub(
                        customHealthFormat,
                        "%%PERCENT%%",
                        string.format("%.0f", HealthPercent)
                    ),
                    "%%MAX%%",
                    HealthMax
                ),
                "%%CURRENT%%",
                Health
            )
            healthbar.TextString:SetText( Result );
        end
    end
end

function EasyFrames.Utils.UpdateManaValues(frame, manaFormat, customManaFormat, customManaFormatFormulas, useManaFormatFullValues)
    local unit = frame.unit
    local manabar = frame

    local ManaPercent = 0

	local Mana = UnitPower(unit)
	local ManaMax = UnitPowerMax(unit)

    if (ManaMax > 0) then
        ManaPercent = (Mana / ManaMax) * 100
    end

    if (manaFormat == "1") then
        -- Percent
        if (Mana > 0) then
            manabar.TextString:SetText(format("%.0f", ManaPercent) .. "%")
        end
    elseif (manaFormat == "2") then
        -- Smart
		local powerType = UnitPowerType(unit)
        if (powerType == 0) then --mana
            manabar.TextString:SetText(string.format("%.0f%%", ManaPercent))
        elseif (powerType == 1 or powerType == 2 or powerType == 3 or powerType == 6) then
            manabar.TextString:SetText(AbbreviateLargeNumbers(Mana))
        end

        if (ManaMax == 0) then
            manabar.TextString:SetText(" ")
        end
    elseif (manaFormat == "custom") then
        -- Own format
        if (Mana > 0) then
            local useFullValues = false
            if (useManaFormatFullValues) then
                useFullValues = 1
            end

            Mana = CustomReadableNumber(Mana, customManaFormatFormulas, useFullValues)
            ManaMax = CustomReadableNumber(ManaMax, customManaFormatFormulas, useFullValues)

            local Result = string.gsub(
                string.gsub(
                    string.gsub(
                        customManaFormat,
                        "%%PERCENT%%",
                        string.format("%.0f", ManaPercent)
                    ),
                    "%%MAX%%",
                    ManaMax
                ),
                "%%CURRENT%%",
                Mana
            )

            manabar.TextString:SetText( Result );
        end

    end
end

function EasyFrames.Utils.GetAllFrames()
    return {
        PlayerFrame,

        TargetFrame,
        TargetFrameToT,

        FocusFrame,
        FocusFrameToT,

        PetFrame,

        PartyMemberFrame1,
        PartyMemberFrame2,
        PartyMemberFrame3,
        PartyMemberFrame4,
    }
end

function EasyFrames.Utils.GetFramesHealthBar()
    return {
        PlayerFrameHealthBar,
        PetFrameHealthBar,

        TargetFrameHealthBar,
        TargetFrameToTHealthBar,

        FocusFrameHealthBar,
        FocusFrameToTHealthBar,

    }
end

function EasyFrames.Utils.GetFramesManaBar()
    return {
        PlayerFrameManaBar,
        PlayerFrameAlternateManaBar,
        PetFrameManaBar,

        TargetFrameManaBar,
        TargetFrameToTManaBar,

        FocusFrameManaBar,
        FocusFrameToTManaBar,
    }
end

function EasyFrames.Utils.GetPartyFrames()
    return {
        PartyMemberFrame1,
        PartyMemberFrame2,
        PartyMemberFrame3,
        PartyMemberFrame4
    }
end

function EasyFrames.Utils.GetFrameByUnit(unit)
    return _G[unit:gsub("^%l", string.upper) .. "Frame"]
end

function EasyFrames.Utils.ClassPortraits(frame)
    local _, unitClass = UnitClass(frame.unit)
    if (unitClass and UnitIsPlayer(frame.unit)) then
        frame.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
        frame.portrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[unitClass]))
    else
        frame.portrait:SetTexCoord(0, 1, 0, 1)
    end
end

function EasyFrames.Utils.DefaultPortraits(frame)
    SetPortraitTexture(frame.portrait, frame.unit)
    frame.portrait:SetTexCoord(0, 1, 0, 1)
end

EasyFrames.Helpers = {};
function EasyFrames.Helpers.Iterator(object)
    local iterator = function(callback)
        for _, value in pairs(object) do
            callback(value)
        end
    end

    return iterator
end
