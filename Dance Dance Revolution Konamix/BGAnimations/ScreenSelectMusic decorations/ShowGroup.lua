for count=1,30 do
local function PutGroupName(self)
    local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel");
    if wheel:GetSelectedType() == "WheelItemDataType_Section" then
		self:GetChild("GroupNames")
		SetCommand=function(self) 
		local group = wheel:GetCurrentIndex();
		 if group[count] then
		 self:visible(true):settext(group[count]:GetText());
                else
			self:settext(""); 
			self:playcommand("Refresh");
				end;
			end;
				else self:visible(false)
				end;
			end;
end;

--Group Name

ShowGroup = Def.ActorFrame {
	LoadFont(UseFont) .. { 
	Name="GroupNames";
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomx,0.75;horizalign,center;horizalign,center);
		};
	};

ShowGroup.InitCommand=cmd(SetUpdateFunction,PutGroupName);

return ShowGroup