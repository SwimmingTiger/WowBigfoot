-- 重新实现一些已被9.0废弃的接口，以便无需修改插件就可以无错运行
-- API改动参考：
-- https://github.com/Stanzilla/WoWUIBugs/wiki/9.0.1-Consolidated-UI-Changes#deprecated-api-removals


--------------------- GameTooltip ---------------------

if not GameTooltip_AddNewbieTip then
    function GameTooltip_AddNewbieTip(tooltip,text,r,g,b,newtext)
        if SHOW_NEWBIE_TIPS=="1" and newtext then
            if text then
                GameTooltip:AddLine(text,r,g,b);
                GameTooltip:AddLine(newtext,NORMAL_FONT_COLOR.r,NORMAL_FONT_COLOR.g,NORMAL_FONT_COLOR.b,1);
            else
                GameTooltip:AddLine(newtext,r,g,b,1);
            end
        elseif text then
            GameTooltip:AddLine(text,r,g,b);
        end
    end
end


--------------------- C_CurrencyInfo ---------------------

if not ExpandCurrencyList then
    ExpandCurrencyList = C_CurrencyInfo.ExpandCurrencyList
end

if not GetBackpackCurrencyInfo then
    function GetBackpackCurrencyInfo(...)
        local info = C_CurrencyInfo.GetBackpackCurrencyInfo(...)
        if type(info) ~= 'table' then return info end
        return info.name, info.quantity, info.iconFileID, info.currencyTypesID
    end
end

if not GetCurrencyInfo then
    function GetCurrencyInfo(...)
        local info = C_CurrencyInfo.GetCurrencyInfo(...)
        if type(info) ~= 'table' then return info end
        return info.name, info.quantity, info.iconFileID, info.quantityEarnedThisWeek, info.maxWeeklyQuantity, info.maxQuantity, info.discovered
    end
end

if not GetCurrencyLink then
    GetCurrencyLink = C_CurrencyInfo.GetCurrencyLink
end

if not GetCurrencyListInfo then
    function GetCurrencyListInfo(...)
        local info = C_CurrencyInfo.GetCurrencyListInfo(...)
        if type(info) ~= 'table' then return info end
        -- `extraCurrencyType` and `itemID` not found from struct `CurrencyInfo`
        return info.name, info.isHeader, info.isHeaderExpanded, info.isTypeUnused, info.isShowInBackpack, info.quantity, nil, info.iconFileID, nil
    end
end

if not GetCurrencyListLink then
    GetCurrencyListLink = C_CurrencyInfo.GetCurrencyListLink
end

if not GetCurrencyListSize then
    GetCurrencyListSize = C_CurrencyInfo.GetCurrencyListSize
end

if not PickupCurrency then
    PickupCurrency = C_CurrencyInfo.PickupCurrency
end

if not SetCurrencyBackpack then
    SetCurrencyBackpack = C_CurrencyInfo.SetCurrencyBackpack
end

if not SetCurrencyUnused then
    SetCurrencyUnused = C_CurrencyInfo.SetCurrencyUnused
end


--------------------- C_EncounterJournal ---------------------

if not EJ_GetLootInfo then
    function EJ_GetLootInfo(...)
        local info = C_EncounterJournal.GetLootInfo(...)
        if type(info) ~= 'table' then return info end
        return info.itemID, info.encounterID, info.name, info.icon, info.slot, info.armorType, info.link
    end
end

if not EJ_GetLootInfoByIndex then
    function EJ_GetLootInfoByIndex(...)
        local info = C_EncounterJournal.GetLootInfoByIndex(...)
        if type(info) ~= 'table' then return info end
        return info.itemID, info.encounterID, info.name, info.icon, info.slot, info.armorType, info.link
    end
end

if not EJ_GetSlotFilter then
    function EJ_GetSlotFilter(...)
        return C_CurrencyInfo.GetSlotFilter(...)
    end
end

if not EJ_ResetSlotFilter then
    function EJ_ResetSlotFilter(...)
        return C_CurrencyInfo.ResetSlotFilter(...)
    end
end

if not EJ_SetSlotFilter then
    function EJ_SetSlotFilter(...)
        return C_CurrencyInfo.SetSlotFilter(...)
    end
end


--------------------- C_GossipInfo ---------------------

if not CloseGossip then
    CloseGossip = C_GossipInfo.CloseGossip
end

if not ForceGossip then
    ForceGossip = C_GossipInfo.ForceGossip
end

if not GetGossipActiveQuests then
    function GetGossipActiveQuests(...)
        local infos = C_GossipInfo.GetActiveQuests(...)
        if type(infos) ~= 'table' then return infos end
        local arr = {}
        for i = 1, #infos do
            local info = infos[i]
            table.insert(arr, info.title)
            table.insert(arr, info.questLevel)
            table.insert(arr, info.isTrivial)
            table.insert(arr, info.isComplete)
            table.insert(arr, info.isLegendary)
            table.insert(arr, info.isIgnored)
            table.insert(arr, info.questID)
        end
        return unpack(arr)
    end
end

if not GetGossipAvailableQuests then
    function GetGossipAvailableQuests(...)
        local infos = C_GossipInfo.GetAvailableQuests(...)
        if type(infos) ~= 'table' then return infos end
        local arr = {}
        for i = 1, #infos do
            local info = infos[i]
            table.insert(arr, info.title)
            table.insert(arr, info.questLevel)
            table.insert(arr, info.isTrivial)
            table.insert(arr, info.isComplete)
            table.insert(arr, info.isLegendary)
            table.insert(arr, info.isIgnored)
            table.insert(arr, info.questID)
        end
        return unpack(arr)
    end
end

if not GetNumGossipActiveQuests then
    GetNumGossipActiveQuests = C_GossipInfo.GetNumActiveQuests
end

if not GetNumGossipAvailableQuests then
    GetNumGossipAvailableQuests = C_GossipInfo.GetNumAvailableQuests
end

if not GetNumGossipOptions then
    GetNumGossipOptions = C_GossipInfo.GetNumOptions
end

if not GetGossipOptions then
    function GetGossipOptions(...)
        local infos = C_GossipInfo.GetOptions(...)
        if type(infos) ~= 'table' then return infos end
        local arr = {}
        for i = 1, #infos do
            local info = infos[i]
            table.insert(arr, info.name)
            table.insert(arr, info.type)
        end
        return unpack(arr)
    end
end

if not C_GossipInfo.GetGossipPoiForUiMapID then
    C_GossipInfo.GetGossipPoiForUiMapID = C_GossipInfo.GetPoiForUiMapID
end

if not C_GossipInfo.GetGossipPoiInfo then
    C_GossipInfo.GetGossipPoiInfo = C_GossipInfo.GetPoiInfo
end

if not GetGossipText then
    GetGossipText = C_GossipInfo.GetText
end

if not SelectGossipActiveQuest then
    SelectGossipActiveQuest = C_GossipInfo.SelectActiveQuest
end

if not SelectGossipAvailableQuest then
    SelectGossipAvailableQuest = C_GossipInfo.SelectAvailableQuest
end

if not SelectGossipOption then
    SelectGossipOption = C_GossipInfo.SelectOption
end


--------------------- C_GossipInfo ---------------------

if not C_LossOfControl.GetEventInfo then
    function C_LossOfControl.GetEventInfo(...)
        local info = C_EncounterJournal.GetLootInfoByIndex(...)
        if type(info) ~= 'table' then return info end
        return info.locType, info.spellID, info.displayText, info.iconTexture, info.startTime, info.timeRemaining, info.duration, info.lockoutSchool, info.priority, info.displayType
    end
end

if not C_LossOfControl.GetNumEvents then
    C_LossOfControl.GetNumEvents = C_LossOfControl.GetActiveLossOfControlDataCount
end


--------------------- C_PlayerChoice ---------------------

if not C_QuestChoice then
    C_QuestChoice = C_PlayerChoice
end

if not C_QuestChoice.GetQuestChoiceInfo then
    C_QuestChoice.GetQuestChoiceInfo = C_PlayerChoice.GetPlayerChoiceInfo
end

if not GetQuestChoiceInfo then
    function GetQuestChoiceInfo(...)
        local info = C_EncounterJournal.GetLootInfoByIndex(...)
        if type(info) ~= 'table' then return info end
        return info.choiceID, info.questionText, info.numOptions, info.uiTextureKit, info.soundKitID, info.hideWarboardHeader, info.keepOpenAfterChoice
    end
end

if not C_QuestChoice.GetQuestChoiceOptionInfo then
    function GetQuestChoiceOptionInfo(...)
        local info = C_PlayerChoice.GetPlayerChoiceOptionInfo(...)
        if type(info) ~= 'table' then return info end
        info.responseID = info.id
        return info
    end
end

if not GetQuestChoiceOptionInfo then
    GetQuestChoiceOptionInfo = C_QuestChoice.GetQuestChoiceOptionInfo
end

if not GetQuestChoiceRewardCurrency then
    function GetQuestChoiceRewardCurrency(index, subindex)
        local info = C_PlayerChoice.GetPlayerChoiceRewardInfo(index)
        if type(info) ~= 'table' then return info end
        info = info.currencyRewards[subindex]
        if type(info) ~= 'table' then return info end
        return info.currencyId, info.currencyTexture, info.quantity
    end
end

if not GetQuestChoiceRewardFaction then
    function GetQuestChoiceRewardFaction(index, subindex)
        local info = C_PlayerChoice.GetPlayerChoiceRewardInfo(index)
        if type(info) ~= 'table' then return info end
        info = info.repRewards[subindex]
        if type(info) ~= 'table' then return info end
        return info.factionId, info.quantity
    end
end

if not GetQuestChoiceRewardInfo then
    function GetQuestChoiceRewardInfo(...)
        local info = C_PlayerChoice.GetPlayerChoiceRewardInfo(...)
        if type(info) ~= 'table' then return info end
        return nil, nil, nil, info.money, info.xp, #info.itemRewards, #info.currencyRewards, nil, #info.numReps
    end
end

if not GetQuestChoiceRewardItem then
    function GetQuestChoiceRewardItem(index, subindex)
        local info = C_PlayerChoice.GetPlayerChoiceRewardInfo(index)
        if type(info) ~= 'table' then return info end
        info = info.itemRewards[subindex]
        if type(info) ~= 'table' then return info end
        -- TODO: may we need to convert `textureFileId` to `texture`
        return info.itemId, info.name, info.textureFileId, info.quantity
    end
end

if not CloseQuestChoice then
    CloseQuestChoice = ClosePlayerChoice
end

if not SendQuestChoiceResponse then
    SendQuestChoiceResponse = SendPlayerChoiceResponse
end


--------------------- C_PvP ---------------------

if not GetBattlefieldVehicleInfo then
    function GetBattlefieldVehicleInfo(...)
        local info = C_PvP.GetBattlefieldVehicleInfo(...)
        if type(info) ~= 'table' then return info end
        -- TODO: is these ok? `vehicleType` -> `atlas`, `orientation` -> `facing`
        -- Origin define:
        -- vehicleX, vehicleY, unitName, isOccupied, vehicleType, orientation, isPlayer, isAlive = GetBattlefieldVehicleInfo(i, mapID)
        return info.x, info.y, info.name, info.isOccupied, info.atlas, info.facing, info.isPlayer, info.isAlive
    end
end


--------------------- C_QuestLog ---------------------

if not AbandonQuest then
    AbandonQuest = C_QuestLog.AbandonQuest
end

if not AddQuestWatch then
    function AddQuestWatch(index, time)
        -- TODO: arg `time`?
        local questID = C_QuestLog.GetQuestIDForLogIndex(index)
        if not questID then return questID end
        return C_QuestLog.AddQuestWatch(questID)
    end
end

if not AddQuestWatchForQuestID then
    function AddQuestWatchForQuestID(questID , hardWatch)
        return C_QuestLog.AddQuestWatch(questID, hardWatch and 1 or 0)
    end
end

if not AddWorldQuestWatch then
    AddWorldQuestWatch = C_QuestLog.AddWorldQuestWatch
end

if not CanAbandonQuest then
    CanAbandonQuest = C_QuestLog.CanAbandonQuest
end

if not GetAbandonQuestName then
    function GetAbandonQuestName()
        local questID = C_QuestLog.GetAbandonQuest()
        if not questID then return questID end
        local index = C_QuestLog.GetLogIndexForQuestID(questID)
        if not index then return index end
        local info = C_QuestLog.GetInfo(index)
        if type(info) ~= 'table' then return info end
        return info.title
    end
end

if not GetAbandonQuestItems then
    GetAbandonQuestItems = C_QuestLog.GetAbandonQuestItems
end

if not GetQuestsCompleted then
    function GetQuestsCompleted()
        local arr = C_QuestLog.GetAllCompletedQuestIDs()
        if type(arr) ~= 'table' then return arr end
        local map = {}
        for i = 1, #arr do
            map[arr[i]] = true;
        end
        return map;
    end
end

--[[
if not GetQuestBountyInfoForMapID then
    function GetQuestBountyInfoForMapID(...)
        local info = C_QuestLog.GetBountiesForMapID(...)
        -- TODO: How to convert it from struct `BountyInfo`
        -- Origin define:
        -- bounties, displayLocation, lockedQuestID = GetQuestBountyInfoForMapID(mapID);
        return info
    end
end
]]

if not GetDistanceSqToQuest then
    GetDistanceSqToQuest = C_QuestLog.GetDistanceSqToQuest
end

if C_TaskQuest and not C_TaskQuest.GetDistanceSqToQuest then
    C_TaskQuest.GetDistanceSqToQuest = C_QuestLog.GetDistanceSqToQuest
end

if not C_QuestLog.GetQuestInfo then
    function C_QuestLog.GetQuestInfo(questID)
        local index = C_QuestLog.GetLogIndexForQuestID(questID)
        if not index then return index end
        local info = C_QuestLog.GetInfo(index)
        if type(info) ~= 'table' then return info end
        return info.title
    end
end

if not GetQuestLogIndexByID then
    GetQuestLogIndexByID = C_QuestLog.GetLogIndexForQuestID
end

if not GetNumQuestLogEntries then
    GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
end

if not GetNumQuestWatches then
    GetNumQuestWatches = C_QuestLog.GetNumQuestWatches
end

if not GetNumWorldQuestWatches then
    GetNumWorldQuestWatches = C_QuestLog.GetNumWorldQuestWatches
end

if not GetQuestTagInfo then
    function GetQuestTagInfo(...)
        local info = C_QuestLog.GetQuestTagInfo(...)
        if type(info) ~= 'table' then return info end
        return info.tagID, info.tagName, info.worldQuestType, info.quality, info.isElite, info.tradeskillLineID, info.displayExpiration
    end
end

if not GetQuestLogRequiredMoney then
    GetQuestLogRequiredMoney = C_QuestLog.GetRequiredMoney
end

if not GetQuestLogSelection then
    GetQuestLogSelection = C_QuestLog.GetSelectedQuest
end

if not GetQuestLogGroupNum then
    GetQuestLogGroupNum = C_QuestLog.GetSuggestedGroupSize
end

if not GetQuestLogTimeLeft then
    function GetQuestLogTimeLeft(...)
        local totalTime, elapsedTime = C_QuestLog.GetTimeAllowed(...)
        if not totalTime then return totalTime end
        return totalTime - elapsedTime
    end
end

if not GetQuestLogTitle then
    GetQuestLogTitle = C_QuestLog.GetTitleForLogIndex
end

if not GetQuestLogTitle then
    GetQuestLogTitle = C_QuestLog.GetTitleForQuestID
end

if not IsQuestComplete then
    IsQuestComplete = C_QuestLog.IsComplete
end

if not GetQuestLogPushable then
    GetQuestLogPushable = C_QuestLog.IsPushableQuest
end

if not IsQuestBounty then
    IsQuestBounty = C_QuestLog.IsQuestBounty
end

if not IsQuestCriteriaForBounty then
    IsQuestCriteriaForBounty = C_QuestLog.IsQuestCriteriaForBounty
end

if not IsQuestInvasion then
    IsQuestInvasion = C_QuestLog.IsQuestInvasion
end

if not IsQuestTask then
    IsQuestTask = C_QuestLog.IsQuestTask
end

if not IsUnitOnQuest then
    function IsUnitOnQuest(index, unit)
        local questID = C_QuestLog.GetQuestIDForLogIndex(index)
        if not questID then return questID end
        return C_QuestLog.IsUnitOnQuest(unit, questID)
    end
end

if not IsUnitOnQuestByQuestID then
    function IsUnitOnQuestByQuestID(questID, unit)
        return C_QuestLog.IsUnitOnQuest(unit, questID)
    end
end

if not RemoveQuestWatch then
    function RemoveQuestWatch(index)
        local questID = C_QuestLog.GetQuestIDForLogIndex(index)
        if not questID then return questID end
        return C_QuestLog.RemoveQuestWatch(questID)
    end
end

if not RemoveQuestWatchForQuestID then
    RemoveQuestWatchForQuestID = C_QuestLog.RemoveQuestWatch
end

if not RemoveWorldQuestWatch then
    RemoveWorldQuestWatch = C_QuestLog.RemoveWorldQuestWatch
end

if not SetAbandonQuest then
    SetAbandonQuest = C_QuestLog.SetAbandonQuest
end

if not SelectQuestLogEntry then
    SelectQuestLogEntry = C_QuestLog.SetSelectedQuest
end

if not SortQuestWatches then
    SortQuestWatches = C_QuestLog.SortQuestWatches
end

if not GetQuestGreenRange then
    function GetQuestGreenRange()
        return UnitQuestTrivialLevelRange("player")
    end
end


--------------------- C_SuperTrack ---------------------

if not GetSuperTrackedQuestID then
    GetSuperTrackedQuestID = C_SuperTrack.GetSuperTrackedQuestID
end

if not SetSuperTrackedQuestID then
    SetSuperTrackedQuestID = C_SuperTrack.SetSuperTrackedQuestID
end


--------------------- C_Unit ---------------------

-- TODO: 判断条件似乎写错了，先暂时注释掉

--[[
if not UnitInPhase then
    function UnitInPhase(unit)
        local reason = UnitPhaseReason(unit)
        return reason == 0 or reason == 1 or reason == 3
    end
end

if not UnitIsWarModePhased then
    function UnitIsWarModePhased(unit)
        local reason = UnitPhaseReason(unit)
        return reason == 2
    end
end
]]


--------------------- C_UserFeedback ---------------------

if not GMSubmitBug then
    GMSubmitBug = C_UserFeedback.SubmitBug
end

if not GMSubmitSuggestion then
    GMSubmitSuggestion = C_UserFeedback.SubmitSuggestion
end


--------------------- Global APIs ---------------------

if not GetSuggestedGroupNum then
    GetSuggestedGroupNum = GetSuggestedGroupSize
end

