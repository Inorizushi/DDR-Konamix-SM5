local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","TransitionSound"))..{
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("background.png") .. {
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("select_style.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X+40;y,30);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

return t;