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
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,513,480);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,513,480;addx,513);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,513,480;addx,-513);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

return t;