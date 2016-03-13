-- ScreenSelectStyle overlay
local t = Def.ActorFrame{
	LoadActor("_linkmode")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+65;y,SCREEN_CENTER_Y+156);
	};

	LoadActor("_arrowright")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-85;y,SCREEN_CENTER_Y+156;bob;effectmagnitude,-4,0,0;effectperiod,0.5); 
	};
	LoadActor("black.png")..{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,480);
		OnCommand=cmd(sleep,0.25;linear,0.25;addx,-SCREEN_WIDTH);
	};
	LoadActor("black2.png")..{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,480);
		OnCommand=cmd(sleep,0.25;linear,0.25;addx,SCREEN_WIDTH);
	};
};
return t;
