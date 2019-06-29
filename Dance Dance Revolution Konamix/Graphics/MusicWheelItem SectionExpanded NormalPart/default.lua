local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45;zoom,0.7;addy,-2);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
				self:zoom(0.7)
				if SCREENMAN:GetTopScreen() then
					local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
					if mw:GetSelectedType() == 'WheelItemDataType_Section' then
						self:diffuse(Color.White)
						self:xy( 25 , - 25 )
					else
						self:diffuse(color("#AAAAAA"))
						self:xy( 0 , 0 )
					end
				end
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
				self:zoom(0.7);
			end;
		end;
	};
};

local factorsx = {-230, 0, 230};
local indexes = {7, 8, 9};

for i = 1,3 do
	t[#t+1] = Def.ActorFrame{
		Def.Banner{
			InitCommand=cmd(xy,factorsx[i],-184-5);
			SetMessageCommand=function(self,params)
				local group = params.Text
				local index = params.DrawIndex
				if group then
					if index then
						if index == indexes[i] then
							self:LoadFromSongGroup(group);
							self:visible(true)
							self:scaletoclipped(320,124)
							if params.HasFocus then
								self:diffuse(color("#FFFFFF"))
							else
								self:diffuse(color("0.5,0.5,0.5,1"));
							end;
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
		LoadActor("bar")..{
			InitCommand=cmd(xy,factorsx[i],-126-5);
			SetMessageCommand=function(self,params)
				local group = params.Text
				local index = params.DrawIndex
				if group then
					if index then
						if index == indexes[i] then
							self:visible(true)
							self:setsize(320,16)
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
	};
end

return t
