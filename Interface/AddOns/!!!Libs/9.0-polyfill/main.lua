-- 重新实现一些已被9.0废弃的接口，以便无需修改插件就可以无错运行

if not GameTooltip_AddNewbieTip then
    GameTooltip_AddNewbieTip = function(tooltip,text,r,g,b,newtext)
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
