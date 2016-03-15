local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	Def.Sprite {
		InitCommand=cmd(draworder,0;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center);
		SetMessageCommand=function(self,params)
			local bgsong = params.Song;
			if bgsong then
				self:LoadFromSongBackground(bgsong);
			else
				self:Load(THEME:GetPathG("","Common fallback background"));
			end;
		end;
	};
};

return t;
	