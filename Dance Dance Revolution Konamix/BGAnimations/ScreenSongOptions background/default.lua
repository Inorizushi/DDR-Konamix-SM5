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
		LoadActor("_Name Option.png") .. {
		InitCommand=cmd(CenterX;y,SCREEN_TOP+28);
		OnCommand=cmd(addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH);
	};

};

return t;