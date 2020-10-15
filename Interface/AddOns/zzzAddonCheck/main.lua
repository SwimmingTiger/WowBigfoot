local LoaderFrame = CreateFrame("FRAME")
LoaderFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

if BigFoot_DelayCall == nil then
    BigFoot_DelayCall = function()
        -- do nothing
    end
end

local function IsAddOnLoadable(name)
    return GetAddOnEnableState(nil, name) == 2
end

local function zzzAddonCheck_Init_BugSack()
    local patchVersion = '2020-10-15-09'
    if BugSack and BugSack.db and BugSack.db.BugSackPatchVersion ~= patchVersion then
        -- 使 BugSack 静音
        BugSack.db.mute = true
        BugSack.db.BugSackPatchVersion = patchVersion
    end
end

-- 全局函数，被 BigFoot/Config/RaidToolkit.lua 使用
function zzzAddonCheck_Init_Decursive()
    -- 禁止Decursive在聊天窗口和屏幕中央显示信息
    local patchVersion = '2020-05-12-18'
    if DecursiveDB and DecursiveDB.profiles and DecursiveDB.profiles.Default and DecursiveDB.profiles.Default.DecursivePatchVersion ~= patchVersion then
        DecursiveDB.profiles.Default.Print_ChatFrame = false
        DecursiveDB.profiles.Default.Print_CustomFrame = false
        DecursiveDB.profiles.Default.Print_Error = false
        DecursiveDB.profiles.Default.DecursivePatchVersion = patchVersion
    end
end

local function zzzAddonCheck_Init_DBM()
    -- 为DBM选择夏一可语音包
    local patchVersion = '2020-06-27-11'
    if DBM and DBM.Options and DBM.Options.DBMPatchVersion ~= patchVersion then
        DBM.Options.ChosenVoicePack = 'Yike'
        DBM.Options.CountdownVoice = 'VP:Yike'
        DBM.Options.CountdownVoice2 = 'VP:Yike'
        DBM.Options.CountdownVoice3 = 'VP:Yike'
        DBM.Options.DBMPatchVersion = patchVersion
    end
end

local function zzzAddonCheck_Init_NeatPlates()
    -- 姓名板：打开目标高亮和友方施法条，禁用仇恨指示器
    local patchVersion = '2020-06-27-15'
    if NeatPlatesOptions and NeatPlatesOptions.FirstSpecProfile and
       NeatPlatesHubSettings and NeatPlatesHubSettings['HubPanelProfile'..NeatPlatesOptions.FirstSpecProfile] and
       NeatPlatesHubSettings['HubPanelProfile'..NeatPlatesOptions.FirstSpecProfile].neatplatesPatchVersion ~= patchVersion
    then
        local db = NeatPlatesHubSettings['HubPanelProfile'..NeatPlatesOptions.FirstSpecProfile]
        db.HighlightTargetMode = 3
        db.SpellCastEnableFriendly = true
        db.WidgetThreatIndicator = false
        db.neatplatesPatchVersion = patchVersion
    end
end

local function zzzAddonCheck_Init_MonkeyQuest()
    -- 设置MonkeyQuest初始样式
    local patchVersion = '2020-07-29-22'
    if not MonkeyQuestConfig then
        return
    end
    if MonkeyQuestConfig.mqPatchVersion == patchVersion then
        return
    end
    if MonkeyBuddySlash_CmdDismiss then
        MonkeyBuddySlash_CmdDismiss()
    end
    if MonkeyQuestInit_ResetConfig then
        BigFoot_DelayCall(MonkeyQuestInit_ResetConfig, 1)
    end
    MonkeyQuestConfig.mqPatchVersion = patchVersion
end

local function zzzAddonCheck_Init_alaGearMan()
    -- 为有爱一键换装添加功能函数
    if not __ala_meta__ then return end
    local func = __ala_meta__.gear.func
    local ui = __ala_meta__.gear.ui

    -- 启用/禁用快捷栏
    function func.toggle_quick_panel(show)
        if show == nil then
            show = not ui.secure:IsShown()
        end
        if show then
            ui.secure:Show();
        else
            ui.secure:Hide();
        end
    end

    -- 打开/关闭套装配置
    function func.toggle_gear_win(show)
        if show == nil then
            show = not ui.gearWin:IsShown()
        end
        if show then
            ui.gearWin:Show()
        else
            ui.gearWin:Hide();
        end
    end
end

local function LoaderEvents(frame, event, arg1)
    frame:UnregisterEvent("PLAYER_ENTERING_WORLD")

    -- 使 BugSack 静音
    zzzAddonCheck_Init_BugSack()

    -- 禁止Decursive在聊天窗口和屏幕中央显示信息
    zzzAddonCheck_Init_Decursive()

    -- 为DBM选择夏一可语音包
    zzzAddonCheck_Init_DBM()

    -- 姓名板：打开目标高亮和友方施法条，禁用仇恨指示器
    zzzAddonCheck_Init_NeatPlates()

    -- 设置MonkeyQuest初始样式
    zzzAddonCheck_Init_MonkeyQuest()

    -- 为有爱一键换装添加功能函数
    zzzAddonCheck_Init_alaGearMan()

    -- 禁用DBM的过期提示
    if DBM and DBM.Options and not DBM.Options.DontShowReminders then
        DBM.Options.DontShowReminders = true
    end

    -- 禁止Details弹出天赋面板
    if Details and not Details.disable_talent_feature then
        Details.disable_talent_feature = true
    end
end

LoaderFrame:SetScript("OnEvent", LoaderEvents)
