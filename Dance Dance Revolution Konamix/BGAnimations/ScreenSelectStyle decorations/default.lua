local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","TransitionSound"))..{
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("Header.png") .. {
		InitCommand=cmd(halign,1;x,SCREEN_RIGHT;y,SCREEN_TOP+28);
		OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("Footer.png") .. {
		OnCommand=cmd(x,SCREEN_RIGHT+640;y,SCREEN_BOTTOM-17;linear,0.5;x,SCREEN_CENTER_X);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
		LoadActor("select_style.png") .. {
		OnCommand=cmd(x,SCREEN_LEFT-100;y,30;sleep,1;linear,0.5;x,SCREEN_CENTER_X+40);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

return t;