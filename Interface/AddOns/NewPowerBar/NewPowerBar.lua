local addonName = ...
NEWPOWERBAR_VERSION = 1.02
local defaultValues= {
	width = 30,
	height = 150,
}
local t_ClassInfo = {}
local t_ClassPowers = {
	WARRIOR = SPELL_POWER_RAGE,
	DRUID = SPELL_POWER_ECLIPSE,
	HUNTER = SPELL_POWER_FOCUS,
	MONK = SPELL_POWER_ENERGY,
}
local t_ClassColors = {
	WARRIOR={
		Max = {1,0,0},
		Mid = {1,1,0},
		Min = {0.4,1,0}
	},
	HUNTER = {
		Min = {1,0,0},
		Mid = {1,1,0},
		Max = {0.4,1,0}
	},
	DRUID = {
		Max = {1,0.6,0.4},
		Mid = {1,0.8,0.2},
		Min = {1,1,0},
		_Max = {0.2,0.6,1},
		_Mid = {0.2,0.8,0.8},
		_Min = {0.2,1,0.6}
	},
	MONK = {
		Min = {1,0,0},
		Mid = {1,1,0},
		Max = {0.4,1,0}
	},
}
local DRUIDECLIPSESHIFT = nil
local IsInCombat = nil

--------------------------------
--初始化职业信息
--------------------------------
do
	__,t_ClassInfo.Class = UnitClass("player")
	if t_ClassPowers[t_ClassInfo.Class] then
		t_ClassInfo.PowerType = t_ClassPowers[t_ClassInfo.Class]
	end
	t_ClassInfo.PowerMax = UnitPowerMax("player",t_ClassInfo.PowerType)
	
end

--------------------------------
--创建分割线
--------------------------------
function NewPowerBar_CreateLines(MaxPower)
	local numLines = (MaxPower/10)-1
	local offSetY = (NewPowerBarStructFrame:GetHeight()-14)/numLines
	local templine 
	for i = 1 ,numLines do
		templine = NewPowerBarStructFrame:CreateTexture("NewPowerBarLine" .. i,"ARTWORK","NewPowerBarLineTemplate")
		templine:ClearAllPoints()
		if i == 1 then
			templine:SetPoint("CENTER",NewPowerBarStructFrame,"TOP",0,-(offSetY+3.5))
		else
			templine:SetPoint("CENTER",_G["NewPowerBarLine" .. i-1],"CENTER",0,-offSetY)
		end
	end
end

--------------------------------
--刷新
--------------------------------
function NewPowerBar_SetPowerValue(power)
	local percent = power/t_ClassInfo.PowerMax
	if power > 0 then
		NewPowerBarStructFrame.powerValueBar:Show()
		NewPowerBarStructFrame.powerValueBar:SetSize(9,119*percent)
		NewPowerBarStructFrame.powerNum:SetText(power)
		NewPowerBar_Pinting(percent,t_ClassInfo.Class)
	elseif power<0 then
		NewPowerBarStructFrame.powerValueBar:Show()
		NewPowerBarStructFrame.powerValueBar:SetSize(9,119*-percent)
		NewPowerBarStructFrame.powerNum:SetText(-power)
		NewPowerBar_Pinting(percent,t_ClassInfo.Class)
	else
		NewPowerBarStructFrame.powerValueBar:Hide()
		NewPowerBarStructFrame.powerNum:SetText(power)
	end
	
end

local function _setColor(t_param)
	NewPowerBarStructFrame.powerValueBar:SetVertexColor(t_param[1],t_param[2],t_param[3])
	NewPowerBarStructFrame.powerNum:SetVertexColor(t_param[1],t_param[2],t_param[3])
end

--------------------------------
--为能量条着色
--------------------------------
function NewPowerBar_Pinting(percent,class)
	if type(t_ClassColors[class]) ~= "table" then
		return 
	end
	if percent>0 then
		if percent>0.66 then
			_setColor(t_ClassColors[class].Max)
		elseif percent<0.33 then
			_setColor(t_ClassColors[class].Min)
		else
			_setColor(t_ClassColors[class].Mid)	
		end
	elseif percent<0 then
		if percent<-0.66 then
			_setColor(t_ClassColors[class]._Max)
		elseif percent>-0.33 then
			_setColor(t_ClassColors[class]._Min)
		else
			_setColor(t_ClassColors[class]._Mid)	
		end
	else
		
	end
end
--------------------------------
--小德切换形态时对能量条的控制
--------------------------------
local function  NewPowerBar_DruidShiftContrl()
	if t_ClassInfo.Class == "DRUID" then
		if GetShapeshiftFormID() == 31 then
			NewPowerBarStructFrame:Show()
			DRUIDECLIPSESHIFT = true
		else
			DRUIDECLIPSESHIFT = false
			NewPowerBarStructFrame:Hide()
		end
	end
end
--------------------------------
--出入战斗显示控制
--------------------------------
local function _class_PowerBarShowHide()
	if t_ClassInfo.Class =="DRUID" then--DRUID
		if DRUIDECLIPSESHIFT then
			return true
		else
			return false
		end
	else
		return true
	end
end
local function  NewPowerBar_CombatContrl()
	if not InCombatLockdown() and IsInCombat~=false then
		NewPowerBarStructFrame.alphaOut:Play()
		IsInCombat = false
	elseif InCombatLockdown() and _class_PowerBarShowHide()  and IsInCombat~=true then
		NewPowerBarStructFrame:SetAlpha(1)
		IsInCombat = true
	end
end
--------------------------------
--OnUpdate
--------------------------------
local f = CreateFrame("Frame")
do 
	f:RegisterEvent("UNIT_PORTRAIT_UPDATE")
	f:SetScript("OnUpdate",function(self)
		NewPowerBar_SetPowerValue(UnitPower("player",t_ClassInfo.PowerType))
		NewPowerBar_CombatContrl()
	end)
end

--------------------------------
--OnEvent
--------------------------------
do
	f:SetScript("OnEvent",function(self,event,args)
		if event == "UNIT_PORTRAIT_UPDATE" then
			NewPowerBar_DruidShiftContrl()
		end
	end)
end
--------------------------------
--test
--------------------------------