
local t = Def.ActorFrame {
	LoadActor("KonamixBG.png") .. {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;linear,0.25;diffuse,color("0.5,0.5,0.5,1"));
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
		LoadActor("warning.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,_screen.h-66);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

return t;