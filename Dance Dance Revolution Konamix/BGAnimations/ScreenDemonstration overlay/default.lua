local t = Def.ActorFrame{
	LoadActor("gameover")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+5);
		OnCommand=cmd(diffuseblink;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,0.266);
	};
	LoadFont("MusicScroll Titles")..{
		Name="SongTitle";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+16;zoom,0.5;shadowlength,1;valign,0);
		BeginCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			local text = "";
			if song then
				local artist = song:GetDisplayArtist()
				local title = song:GetDisplayFullTitle()
				local group = song:GetGroupName()
				text = string.format(Screen.String("%s - %s   [from %s]"),artist,title,group)
			end;
			self:settext(text);
		end;
-- 		OnCommand=cmd(queuecommand,"Scroll");
-- 		ScrollCommand=cmd(linear,10;x,-SCREEN_WIDTH*2;sleep,1;x,SCREEN_WIDTH*2;queuecommand,"Scroll");
	};
};

return t;