local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	Def.Sprite {
		InitCommand=cmd(draworder,0;cropto,SCREEN_WIDTH,SCREEN_HEIGHT;Center;playcommand,"Set");
		SetCommand=function(self,params)
		local song = GAMESTATE:GetCurrentSong();
			if song then
				self:LoadFromSongBackground(song);
			else
				self:Load(THEME:GetPathG("","Common fallback background"));
			end;
		end;
	};
	Def.Quad{
			InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("0,0,0,1");diffusealpha,0.5);
	};
};

return t;
	