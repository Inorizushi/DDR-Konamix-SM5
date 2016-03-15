-- ScreenSelectStyle overlay
local t = Def.ActorFrame{
	LoadActor("_linkmode")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+65;y,SCREEN_CENTER_Y+156);
	};
	
	LoadActor("_arrowright")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-85;y,SCREEN_CENTER_Y+156;bob;effectmagnitude,-4,0,0;effectperiod,0.5); 
	};
	LoadActor(THEME:GetPathG("","_help/_SS-start CS"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-42;visible,false);
		OnCommand=cmd(diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("0.5,0.5,0.5,1");effectperiod,1.056;sleep,2;visible,true);
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
