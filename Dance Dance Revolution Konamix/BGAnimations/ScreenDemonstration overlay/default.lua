local t = Def.ActorFrame{
	LoadActor("gameover")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+5);
		OnCommand=cmd(diffuseblink;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,1;effectperiod,1);
	};
};

return t;