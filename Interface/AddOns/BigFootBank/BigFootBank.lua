
-----------------------------------------------------
-- Update: 添加服务器判断，优化函数逻辑处理
-----------------------------------------------------
local debugmod = false
local print = function(...)  if debugmod then print(...) end end

if (GetLocale() == "zhCN") then
	BigFootBank_BFchannel="大脚世界频道";		--
	BigFootBank_SayTitle="<大脚黑市助手通知> 已经更新黑市拍卖行数据"
	BigFootBank_LogoutSayTitle ="<大脚黑市助手通知> 您的黑市拍卖行有物品:%s 剩余时间为：%s";

	BigFootBank_MINIMAP_TOOLTIP1="大脚黑市助手"
	BigFootBank_MINIMAP_TOOLTIP2="点击打开黑市界面"

	BigFootBank_OffLineTime="<大脚黑市助手> 黑市数据更新时间："
	BigFootBank_OffLineNoData="<大脚黑市助手> 沒有黑市数据。"
elseif (GetLocale() == "zhTW") then
	BigFootBank_BFchannel="大腳世界頻道";
	BigFootBank_SayTitle="<大腳黑市助手通知> 已經更新黑市拍賣行數據"
	BigFootBank_LogoutSayTitle="<大腳黑市助手通知> 您的黑市拍賣行有物品:%s 剩餘時間為：%s"

	BigFootBank_MINIMAP_TOOLTIP1="大脚黑市助手"
	BigFootBank_MINIMAP_TOOLTIP2="点击打开黑市界面"

	BigFootBank_OffLineTime="<大腳黑市助手> 黑市數據更新時間："
	BigFootBank_OffLineNoData="<大脚黑市助手> 沒有黑市數據。"
else
	BigFootBank_BFchannel="";
	BigFootBank_SayTitle=""
	BigFootBank_LogoutSayTitle="%s ：%s"

	BigFootBank_MINIMAP_TOOLTIP1=""
	BigFootBank_MINIMAP_TOOLTIP2=""

	BigFootBank_OffLineTime=""
	BigFootBank_OffLineNoData=""
end

local BF_NIL = "BF_NIL"
local realmName = "";
local laseShoeTime =0;
local reseverdata={};
local AllReseverData={};
local BigFootBank_BindItemtab={}

--[[no use
local function BigFootBank_GetAllPlayer()
	local channel, header, collapsed, channelNumber, count, active, category;
	local num=0;
	for i= 0,20 do
		channel, header, collapsed, channelNumber, count, active, category= GetChannelDisplayInfo(i);
		if channel == BigFootBank_BFchannel then
			num =i
			break;
		end
	end
	channel, header, collapsed, channelNumber, count, active, category= GetChannelDisplayInfo(num);
	local name, owner, moderator, muted, active, enabled;
	local talktab={};
	if count and count>0 then
		for rosterIndex =1,count do
			name, owner, moderator, muted, active, enabled = GetChannelRosterInfo(num, rosterIndex);
			if name then
				table.insert(talktab,name)
			end
		end
	end
	return talktab;
end
--]]

local function BigFootBank_SendData(sender)
	local completely = true
	local Str="BigFootBankData:";
	local SayTab={}
	local ii =0;
	if BigFootBankSaveData[realmName].bankData then
		if BigFootBankSaveData[realmName].bankData.numItems and BigFootBankSaveData[realmName].bankData.numItems>0 then
			Str = Str..BigFootBankSaveData[realmName].bankData.time.."#"..BFU_GetServerName().."#"..BigFootBankSaveData[realmName].bankData.numItems.."#";
			for k,v in pairs(BigFootBankSaveData[realmName].bankData.Items) do
				for i,j in pairs(v) do
					if string.len(Str)+string.len(tostring(j)..",")>250 then
						if ii >0 then
							Str = Str.."&&";
						end
						ii =ii+1;
						table.insert(SayTab,Str)
						Str =tostring(j)..",";
					else
						Str =Str..tostring(j)..",";
					end
				end
				Str =Str..";";
			end
			if string.len(Str)+string.len("BigFootBankDataend&&")>250 then
				table.insert(SayTab,Str.."&&")
				table.insert(SayTab,"BigFootBankDataend&&")
			else
				Str =Str.."BigFootBankDataend&&";
				table.insert(SayTab,Str)
			end
		end
	end

	-- local target,serverName = UnitName("target")
	-- if serverName then
		-- target = target.."-"..serverName;
	-- end
	for k,v in pairs (SayTab) do
		if string.find(v,BF_NIL) then
			-- print("send nil")
			completely = false
		end
	end
	if completely then
		for k,v in pairs (SayTab) do
			-- SendAddonMessage("BigFootBankData",v,'WHISPER',target)
			if sender then
				C_ChatInfo.SendAddonMessage("BigFootBankData",v,'WHISPER',sender)
				-- print("send",v)
			else
				if IsInGroup() then
					C_ChatInfo.SendAddonMessage("BigFootBankData",v,"RAID");
				end
				if IsInGuild() then
					C_ChatInfo.SendAddonMessage("BigFootBankData",v,"GUILD");
				end
				-- print("send",v)
			end
		end
	end
	-- local playerlist =BigFootBank_GetAllPlayer()
	-- for k,v in pairs(playerlist) do
		-- for i,j in pairs (SayTab) do
			-- SendAddonMessage("BigFootBankData",j,'WHISPER',v)
		-- end
	-- end
	-- return SayTab;
end

local function BigFootBank_CheckItemData()
	local reseiveItemData =reseverdata.Items
	local selfItem;
	if BigFootBankSaveData[realmName].bankData then
		selfItem = BigFootBankSaveData[realmName].bankData.Items
	end
	if not selfItem then
		return true;
	end
	for k,v in pairs(reseiveItemData) do
		if not selfItem[k] then
			return true;
		end
		if v[1] ~= selfItem[k][1] then
			return true;
		end
	end
	return false;
end

local function BigFootBank_SayEvent()
	local _linkString1 = "|CFF00B4FF|HBigFootBank:2010|h[点击打开黑市界面]|h|r";
	local _warning1 = BigFootBank_SayTitle .. _linkString1;
	DEFAULT_CHAT_FRAME:AddMessage(_warning1, 1, 0.9, 0.4);
end

local function BigFootBankCheck_SelfData()
	local bhaveitem =false;
	local Updatatime=0;
	for k,v in pairs (BigFootBank_BindItemtab) do
		bhaveitem =false;
		if BigFootBankSaveData[realmName].bankData.Items then
			for i,j in pairs(BigFootBankSaveData[realmName].bankData.Items) do
				if k ==j[15] then
					bhaveitem =true;
					Updatatime=j[14];
					break;
				end
			end
			if bhaveitem then
				BigFootBank_BindItemtab[k] =Updatatime;
			else
				BigFootBank_BindItemtab[k] =nil;
			end
		end
	end
end

------------返回1 自己的时间比对方的新。返回0 对方比自己新。返回-1 比较失败------------------------
local function BigFootBank_IsTimeNew(selfTime,OtherTime)
	-- local hour, minute = GetGameTime();
	-- local weekday, month, day, year = CalendarGetDate();
	-- BigFootBankSaveData[realmName].bankData.time= year.."-"..month.."-"..day.."-"..hour.."-"..minute
	if not selfTime then
		return 0;
	end
	if not OtherTime then
		return 1;
	end
	local myear,mmonth,mday,mhour,mminute = 0,0,0,0,0;
	selfTime =selfTime.."-";
	local i =0;
	for s in string.gmatch(selfTime, "(.-)%-") do
		i =i+1;
		if i==1 then
			myear = tonumber(s) or 0;
		elseif i==2 then
			mmonth = tonumber(s) or 0;
		elseif i==3 then
			mday = tonumber(s) or 0;
		elseif i==4 then
			mhour =	tonumber(s) or 0;
		elseif i==5 then
			mminute = tonumber(s) or 0;
		end
	end

	i=0;
	local yyear,ymonth,yday,yhour,yminute = 0,0,0,0,0;
	OtherTime =OtherTime.."-";
	for s in string.gmatch(OtherTime, "(.-)%-") do
		i =i+1;
		if i==1 then
			yyear =tonumber(s) or 0;
		elseif i==2 then
			ymonth =tonumber(s) or 0;
		elseif i==3 then
			yday =tonumber(s) or 0;
		elseif i==4 then
			yhour =tonumber(s) or 0;
		elseif i==5 then
			yminute =tonumber(s) or 0;
		end
	end

	if yyear and ymonth and yday and yhour and yminute  and myear and mmonth and mday and mhour and mminute then
		if myear> yyear then
			return 1;
		elseif myear < yyear then
			return 0;
		end

		if mmonth> ymonth then
			return 1;
		elseif mmonth < ymonth then
			return 0;
		end

		if mday> yday then
			return 1;
		elseif mday < yday then
			return 0;
		end

		if mhour> yhour then
			return 1;
		elseif mhour < yhour then
			return 0;
		end

		if mminute> yminute then
			return 1;
		elseif mminute < yminute then
			return 0;
		end
	end
	return -1;
end

local function BigFootBank_CheckDataTime(itemTime,sender)
	local selfTime=BigFootBankSaveData[realmName].bankData.time;
	-- print(selfTime,itemTime,sender,BigFootBank_IsTimeNew(selfTime,itemTime))
	local checkdata =BigFootBank_IsTimeNew(selfTime,itemTime);
	if checkdata==1 then
		-- print("回调 send")
		BigFootBank_SendData(sender) 					--自己的数据比对方新 用自己的更新对方的数据
		reseverdata={};
	elseif checkdata==0 then
		local BSay =false
		if BigFootBank_CheckItemData() then
			BigFootBank_SayEvent();
			BSay =true;
		end
		BigFootBankSaveData[realmName].bankData ={}  	-- 对方 比自己新 用对方的数据更新自己的数据。
		BigFootBankSaveData[realmName].bankData =reseverdata;
		BigFootBankCheck_SelfData()
		reseverdata={};
		local m_time =time()
		if  m_time -laseShoeTime >=60*30 then
			if not BSay then
				BigFootBank_SayEvent();
			end
			laseShoeTime = m_time;
		end
	else
		reseverdata={}; ---比较失败  放弃接受的数据。
	end
	collectgarbage("collect");
end

local function BigFootBank_CheckResiveData(reseverStr,sender)
	if InCombatLockdown() then return end
	-- print("BigFootBank_CheckResiveData")
	local itemServer=""
	local itemnumber;
	local itemTime="";
	local checkStr="";
	local itemnumber1 =0;
	local onedata;
	if reseverStr and reseverStr~="" then
		reseverStr = reseverStr.."#"
		for s in string.gmatch(reseverStr, "(.-)%#") do
			itemnumber1 =itemnumber1+1;
			if itemnumber1==1 then
				itemTime =s;
			elseif itemnumber1==2 then
				itemServer =s;
			elseif itemnumber1==3 then
				itemnumber =tonumber(s);
			elseif itemnumber1==4 then
				checkStr =s;
			end
		end
		if itemnumber then
			reseverdata.time =itemTime;
			reseverdata.numItems =itemnumber;
			itemnumber1 =0
			reseverdata.Items={}
			-- checkStr =string.sub(reseverStr,string.len(itemTime)+string.len(itemServer)+string.len(tostring(itemnumber))+2,-1)
			for s in string.gmatch(checkStr, "(.-);") do
				itemnumber1 =itemnumber1 +1;
				onedata={};
				for w in string.gmatch(s, "(.-),") do
					if tonumber(w) then
						table.insert(onedata,tonumber(w));
					elseif w=="true" then
						table.insert(onedata,true);
					elseif w=="false" then
						table.insert(onedata,false);
					else
						table.insert(onedata,w);
					end
				end
				table.insert(reseverdata.Items,onedata);
			end
			local Bok =true
			if itemServer ~=BFU_GetServerName() then
				Bok =false
			end
			if itemnumber1 ~=itemnumber then
				-- print(itemnumber1,itemnumber)
				Bok =false
			end
			for k,v in pairs(reseverdata.Items) do
				if #v ~=16 then --------一件物品有16个信息
					Bok =false;
				end
			end
			if Bok then
				BigFootBank_CheckDataTime(itemTime,sender)
				-- BigFootBank_OffLineUpdata()
			end
		end
	end
end

local function BigFootBank_CreatStrFrame(Str)
	if not BigFootBank_TimeFrameText then
		local Frame = CreateFrame("Frame",nil,BlackMarketFrame)
		Frame:SetPoint("TOPLEFT",80,-27)
		Frame:SetWidth(400);
		Frame:SetHeight(30);
		local FrameText = Frame:CreateFontString(nil,"OVERLAY","GameFontNormal")
		FrameText:SetPoint("LEFT",Frame,"RIGHT",0,0)
		FrameText:SetWidth(400);
		FrameText:SetHeight(30);
		FrameText:SetJustifyH("LEFT")
		if Str then
			FrameText:SetText(BigFootBank_OffLineTime..Str)
		else
			FrameText:SetText(BigFootBank_OffLineNoData)
		end
		Frame.Text =FrameText;
		Frame:Show()
		BigFootBank_TimeFrameText=Frame;
	else
		BigFootBank_TimeFrameText:Show()
		if Str then
			BigFootBank_TimeFrameText.Text:SetText(BigFootBank_OffLineTime..Str)
		else
			BigFootBank_TimeFrameText.Text:SetText(BigFootBank_OffLineNoData)
		end
	end
end

local function BigFootBank_GetData()
	BigFootBankSaveData[realmName].bankData.numItems = C_BlackMarket.GetNumItems();
	if BigFootBankSaveData[realmName].bankData.numItems and BigFootBankSaveData[realmName].bankData.numItems >0 then
		local name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID
		name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID = C_BlackMarket.GetHotItem();
		BigFootBankSaveData[realmName].bankData.HotItem={name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID};
		BigFootBankSaveData[realmName].bankData.Items={}
		local hour, minute = GetGameTime();
		local date = C_DateAndTime.GetCurrentCalendarTime();
		local month, day, year = date.month, date.monthDay, date.year
		BigFootBankSaveData[realmName].bankData.time= year.."-"..month.."-"..day.."-"..hour.."-"..minute
		for index =1,BigFootBankSaveData[realmName].bankData.numItems do
			name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID = C_BlackMarket.GetItemInfoByIndex(index);
			if not string.find(link,"|")then
				link = BF_NIL
				-- print(BF_NIL)
			end
			table.insert(BigFootBankSaveData[realmName].bankData.Items,{name or false, texture or false, quantity or false, itemType or false, usable or false, level or false, levelType or false, sellerName or false, minBid or false, minIncrement or false, currBid or false, youHaveHighBid or false, numBids or false, timeLeft or false, link or false, marketID or false})
			if link then
				if youHaveHighBid  then
					BigFootBank_BindItemtab[link] = timeLeft;
				else
					BigFootBank_BindItemtab[link] =nil;
				end
			end
		end
		BigFootBank_SendData()
	end
end

local function BigFootBank_LogOut()
	local SayStr=""
	for k,v in pairs (BigFootBank_BindItemtab) do
		if _G["AUCTION_TIME_LEFT"..v] then
			SayStr =BigFootBank_LogoutSayTitle:format(k,_G["AUCTION_TIME_LEFT"..v]);
			DEFAULT_CHAT_FRAME:AddMessage(SayStr, 1, 0.9, 0.4);
			SayStr="";
		end
	end
end

local function BigFootBank_GetDataForBot(t_data,realmName)
	local t_ele = {}
	local t_hot = {}
	if t_data.Items then
		t_ele.Items = {}
		for k,v in pairs(t_data.Items) do
			if type(t_data.Items[k][1]) == "string" then
				t_ele.Items [t_data.Items[k][1]] = {}
				t_ele.Items [t_data.Items[k][1]].name = t_data.Items[k][1] or nil
				t_ele.Items [t_data.Items[k][1]].texture = t_data.Items[k][2] or nil
				t_ele.Items [t_data.Items[k][1]].quantity = t_data.Items[k][3] or nil
				t_ele.Items [t_data.Items[k][1]].itemType = t_data.Items[k][4] or nil
				t_ele.Items [t_data.Items[k][1]].usable = t_data.Items[k][5] or nil
				t_ele.Items [t_data.Items[k][1]].level = t_data.Items[k][6] or nil
				t_ele.Items [t_data.Items[k][1]].levelType = t_data.Items[k][7] or nil
				t_ele.Items [t_data.Items[k][1]].sellerName = t_data.Items[k][8] or nil
				t_ele.Items [t_data.Items[k][1]].minBid = t_data.Items[k][9] or nil
				t_ele.Items [t_data.Items[k][1]].minIncrement = t_data.Items[k][10] or nil
				t_ele.Items [t_data.Items[k][1]].currBid = t_data.Items[k][11] or nil
				t_ele.Items [t_data.Items[k][1]].youHaveHighBid = t_data.Items[k][12] or nil
				t_ele.Items [t_data.Items[k][1]].numBids = t_data.Items[k][13] or nil
				t_ele.Items [t_data.Items[k][1]].timeLeft = t_data.Items[k][14] or nil
				t_ele.Items [t_data.Items[k][1]].link = t_data.Items[k][15] or nil
				t_ele.Items [t_data.Items[k][1]].marketID = t_data.Items[k][16] or nil
				t_ele.server = realmName;
			end
		end
	end

	if t_data.HotItem  and type(t_data.HotItem) == "table" then
		t_hot.name = t_data.HotItem[1]or nil
		t_hot.texture = t_data.HotItem[2]or nil
		t_hot.quantity = t_data.HotItem[3]or nil
		t_hot.itemType = t_data.HotItem[4]or nil
		t_hot.usable = t_data.HotItem[5]or nil
		t_hot.level = t_data.HotItem[6]or nil
		t_hot.levelType = t_data.HotItem[7]or nil
		t_hot.sellerName = t_data.HotItem[8]or nil
		t_hot.minBid = t_data.HotItem[9]or nil
		t_hot.minIncrement = t_data.HotItem[10]or nil
		t_hot.currBid = t_data.HotItem[11]or nil
		t_hot.youHaveHighBid = t_data.HotItem[12]or nil
		t_hot.numBids = t_data.HotItem[13]or nil
		t_hot.timeLeft = t_data.HotItem[14]or nil
		t_hot.link = t_data.HotItem[15]or nil
		t_hot.marketID = t_data.HotItem[16]or nil
		t_ele.HotItem = t_hot
	end

	if  t_data.time then
		t_ele.time =t_data.time
	end

	if t_data.numItems then
		t_ele.numItems = t_data.numItems
	end

	return t_ele
end

local function BF_BlackMarketScrollFrame_Update(link, text, button)
	if C_BlackMarket.GetNumItems() then
		BlackMarketScrollFrame_Update();
		return;
	end
	local reseverdata =BigFootBankSaveData[realmName].bankData;

	BigFootBank_CreatStrFrame(reseverdata.time or false)

	local numItems = reseverdata.numItems or 0;
	-- local numItems = C_BlackMarket.GetNumItems();

	local scrollFrame = BlackMarketScrollFrame;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;

	for i = 1, numButtons do
		local button = buttons[i];
		local index = offset + i; -- adjust index

		if ( index <= numItems ) then
			-- local name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID = C_BlackMarket.GetItemInfoByIndex(index);
			local name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID =unpack(reseverdata.Items[index])
			if ( name ) then
				button.Name:SetText(name);
				button.Item.IconTexture:SetTexture(texture);
				if ( not usable ) then
					button.Item.IconTexture:SetVertexColor(1.0, 0.1, 0.1);
				else
					button.Item.IconTexture:SetVertexColor(1.0, 1.0, 1.0);
				end

				button.Item.Count:SetText(quantity);
				button.Item.Count:SetShown(quantity > 1);

				button.Type:SetText(itemType);

				button.Seller:SetText(sellerName);

				button.Level:SetText(level);

				local bidAmount = currBid;
				local minNextBid = currBid + minIncrement;
				if ( currBid == 0 ) then
					bidAmount = minBid;
					minNextBid = minBid;
				end
				MoneyFrame_Update(button.CurrentBid, bidAmount);

				button.minNextBid = minNextBid;
				button.youHaveHighBid = youHaveHighBid;
				button.YourBid:SetShown(false);

				button.auctionCompleate = (timeLeft == 0);
				button.TimeLeft.Text:SetText(_G["AUCTION_TIME_LEFT"..timeLeft]);
				button.TimeLeft.tooltip = _G["AUCTION_TIME_LEFT"..timeLeft.."_DETAIL"];

				button.itemLink = link;
				button.marketID = marketID;
				if ( marketID == BlackMarketFrame.selectedMarketID ) then
					button.Selection:Show();
				else
					button.Selection:Hide();
				end

				button:Show();
			else
				button:Hide()
			end
		else
			button:Hide();
		end
	end

	local totalHeight = numItems * scrollFrame.buttonHeight;
	local displayedHeight = numButtons * scrollFrame.buttonHeight;
	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

local done,reWrite;
function BigFootBank_OffLineUpdata(link, text, button)
	if link then
		if not ( strsub(link, 1, 11) == "BigFootBank" ) then
			return;
		end
	end

	if not BlackMarketFrame_Show then
		BlackMarket_LoadUI();
	elseif BlackMarketFrame_Show and not reWrite then
		--重写官方函数
		BlackMarketScrollFrame.update = BF_BlackMarketScrollFrame_Update;

		function BlackMarketItem_OnClick(self, button, down)
			MoneyInputFrame_SetCopper(BlackMarketBidPrice, self.minNextBid);
			BlackMarketFrame.selectedMarketID = self.marketID;
			BF_BlackMarketScrollFrame_Update()
			if ( self.auctionCompleate or self.youHaveHighBid or (GetMoney() < self.minNextBid) ) then
				BlackMarketFrame.BidButton:Disable();
			else
				BlackMarketFrame.BidButton:Enable();
			end
		end
		reWrite = true;
	end
	BlackMarketFrame_Show()
	HybridScrollFrame_CreateButtons(BlackMarketScrollFrame, "BlackMarketItemTemplate", 5, -5);

	BF_BlackMarketScrollFrame_Update(link, text, button)

	if not done then
		BigFoot_DelayCall(BigFootBank_OffLineUpdata, 0.2); -- 延迟调用一下。因为 如果本来官方UI没有载入 第一会被官方界面刷新掉。补一次
		done = true
	end
end

function BigFootBank_OnLoad(self)
	self:RegisterEvent("BLACK_MARKET_ITEM_UPDATE");
	self:RegisterEvent("BLACK_MARKET_BID_RESULT");
	self:RegisterEvent("BLACK_MARKET_OUTBID");
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("CHAT_MSG_ADDON");
	self:RegisterEvent("PLAYER_CAMPING");
	self:RegisterEvent("PLAYER_QUITING");
	self:RegisterEvent("ADDON_LOADED")
end

function BigFootBank_OnEvent(self, event, ...)
	if event == "ADDON_LOADED" and select(1,...) == "BigFootBank" then
		realmName = GetRealmName()
		BigFootBankSaveData = BigFootBankSaveData or {}
		local version = GetAddOnMetadata("BigFootBank", "Version");
		if not BigFootBankSaveData.version or BigFootBankSaveData.version < version then
			BigFootBankSaveData = {}
			BigFootBankSaveData.version = version;
		end
		if not BigFootBankSaveData[realmName] then
			BigFootBankSaveData[realmName] = {}
			BigFootBankSaveData[realmName].bankData ={};
		end

		local BigFootBank_SetHyperlink_Origin = ItemRefTooltip.SetHyperlink;
		ItemRefTooltip.SetHyperlink = function(self,link)
			if(strsub(link, 1, 11)=="BigFootBank") then return end
			return BigFootBank_SetHyperlink_Origin(self,link);
		end
		hooksecurefunc("SetItemRef", BigFootBank_OffLineUpdata);

		-- hooksecurefunc("Logout",BigFootBank_LogOut);		改为监视事件
		if BigFootBot_RegisterData then --注册保存数据
			BigFootBot_RegisterData("BigFootBank_Data",function(olddata,...)  return BigFootBank_GetDataForBot(BigFootBankSaveData[realmName].bankData,realmName) end,"PLAYER_LOGOUT")
		end

		C_ChatInfo.RegisterAddonMessagePrefix("BigFootBankData");

		self:UnregisterEvent("ADDON_LOADED");
	elseif ( event == "BLACK_MARKET_BID_RESULT" or event == "BLACK_MARKET_OUTBID" or event == "BLACK_MARKET_ITEM_UPDATE" ) then
		BigFoot_DelayCall(BigFootBank_GetData,0.2)
	elseif ( event == "CHAT_MSG_ADDON" ) then
		local prefix,message,channel,sender = ...;
		if prefix ~="BigFootBankData" then return end
		-- print(channel,sender)
		if (not AllReseverData[sender]) or AllReseverData[sender].BresiveData then
			local ben =false
			if string.find(message,"BigFootBankData:") then
				-- print("begin")
				AllReseverData[sender] ={};
				AllReseverData[sender].BresiveData =true
				AllReseverData[sender].channel= channel;
				AllReseverData[sender].reseverStr="";
				AllReseverData[sender].reseverStr=string.sub(message,17,-1);
				ben =true;
				-- print("CHAT_MSG_ADDON",string.sub(message,17,-1))
			end

			if AllReseverData[sender] and AllReseverData[sender].channel == channel and string.find(message,"BigFootBankDataend") then
				AllReseverData[sender].BresiveData =false;
				AllReseverData[sender].reseverStr =AllReseverData[sender].reseverStr..string.sub(message,0,-3);
				BigFootBank_CheckResiveData(AllReseverData[sender].reseverStr,sender)
				AllReseverData[sender] =nil;
			end
			if not ben and string.find(message,"&&") then
				if AllReseverData[sender] and AllReseverData[sender].BresiveData and AllReseverData[sender].channel == channel then
					AllReseverData[sender].reseverStr =AllReseverData[sender].reseverStr..string.sub(message,0,-3);
				end
			end
		end
	elseif(event == "PLAYER_TARGET_CHANGED") then
		if (not InCombatLockdown()) and UnitIsPlayer("target") and UnitIsConnected("target") then
			local __name, __realm = UnitName("target");
			if not (__realm and __realm~="") then
				if UnitFactionGroup("target") == UnitFactionGroup("player") and UnitName("target") ~= UnitName("player") and __name ~= UNKNOWNOBJECT then
					BigFootBank_SendData(__name);
				end
			end
		end
	elseif (event == "PLAYER_CAMPING" or event == "PLAYER_QUITING") then
		BigFootBank_LogOut();
	end
end
