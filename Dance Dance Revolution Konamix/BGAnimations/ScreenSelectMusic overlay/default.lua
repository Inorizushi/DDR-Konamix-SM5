-- ScreenSelectMusic Overlay
return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_help/_lr-start "..GetGraphicType()))..{
		InitCommand=cmd(x,SCREEN_CENTER_X),
		OnCommand=cmd(diffuseblink;effectperiod,1.056;y,SCREEN_BOTTOM+self:GetHeight()*0.5;linear,0.25;y,SCREEN_BOTTOM-self:GetHeight()-18)
	};
};