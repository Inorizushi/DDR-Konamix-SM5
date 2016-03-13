local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(sleep,1;addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH);
	};
	LoadActor("stars") .. {
		InitCommand=cmd(Center);
		OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
	};
};

return t;