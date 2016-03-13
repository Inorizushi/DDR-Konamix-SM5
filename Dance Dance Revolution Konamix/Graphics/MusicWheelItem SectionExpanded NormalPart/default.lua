local t = Def.ActorFrame{}

t[#t+1] =	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	}
t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;rotationz,45;x,SCREEN_CENTER_X-190;y,SCREEN_CENTER_Y-490);
		OnCommand=cmd(animate,true;effectoffset,0.3);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;rotationz,45;x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y-460);
		OnCommand=cmd(animate,true;effectoffset,0.6);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(zoom,2;rotationz,45;x,SCREEN_CENTER_X-130;y,SCREEN_CENTER_Y-430);
		OnCommand=cmd(animate,true;effectoffset,0.9;);
	};

return t;