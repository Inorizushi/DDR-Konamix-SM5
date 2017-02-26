local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,613,480);
	};
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,613,480;addx,613);
	};
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;SetSize,613,480;addx,-613);
	};
		LoadActor("Header.png") .. {
		InitCommand=cmd(CenterX;y,SCREEN_TOP+53/2);
		OnCommand=cmd();
	};
		LoadActor("Header.png") .. {
		InitCommand=cmd(CenterX;y,SCREEN_TOP+53/2;addx,640);
		OnCommand=cmd();
	};
		LoadActor("Header.png") .. {
		InitCommand=cmd(CenterX;y,SCREEN_TOP+53/2;addx,-640);
		OnCommand=cmd();
	};
		LoadActor("_Name Option.png") .. {
		InitCommand=cmd(CenterX;y,SCREEN_TOP+28);
		OnCommand=cmd(addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH);
	};
		LoadActor("Info.png") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-120/2;diffusealpha,0.75);
		OnCommand=cmd();
	};

};

return t;