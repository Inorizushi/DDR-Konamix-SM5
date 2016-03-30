local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45;zoom,0.7;addy,-2);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
				self:zoom(0.7);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
				self:zoom(0.7);
			end;
		end;
	};
	Def.Banner{
		InitCommand=cmd(xy,-200,-188;scaletoclipped,288,112);
		SetMessageCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			local group = params.Text;
			
			if group then
				if index == 7 then
					self:LoadFromSongGroup(group);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	};
	Def.Banner{
		InitCommand=cmd(xy,0,-188;scaletoclipped,288,112);
		SetMessageCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			local group = params.Text;
			
			if group then
				if index == 8 then
					self:LoadFromSongGroup(group);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	};
	Def.Banner{
		InitCommand=cmd(xy,200,-188;scaletoclipped,288,112);
		SetMessageCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			local group = params.Text;
			
			if group then
				if index == 9 then
					self:LoadFromSongGroup(group);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	};
};

return t;