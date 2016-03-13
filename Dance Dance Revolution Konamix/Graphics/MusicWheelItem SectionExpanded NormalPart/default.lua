local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
	Def.Banner{
		Name="BackgroundWheel";
		InitCommand=cmd(draworder,0;scaletoclipped,345.3,108;y,-188);
		SetMessageCommand=function(self,params)
			local group = params.Group;
			if group then
				self:LoadFromSongGroup(group);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","background") );
			end;
		end;
	};
	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
				self:zoom(0.8);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
				self:zoom(0.8);
			end;
		end;
	};
};

t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;x,-90;y,SCREEN_CENTER_Y-430);
		OnCommand=cmd(animate,true;effectoffset,0.3);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;x,-60;y,SCREEN_CENTER_Y-430);
		OnCommand=cmd(animate,true;effectoffset,0.6);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;x,-30;y,SCREEN_CENTER_Y-430);
		OnCommand=cmd(animate,true;effectoffset,0.9;);
	};

return t;