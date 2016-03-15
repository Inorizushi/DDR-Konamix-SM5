local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	LoadActor("../ScreenSelectPlayMode background/background")..{
		InitCommand=cmd(Center);
	};
	Def.Quad{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#000000"));
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.2;smooth,0.5;addx,SCREEN_WIDTH);
	};
	LoadActor("stars") .. {
		InitCommand=cmd(Center);
		OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
	};
};

return t;