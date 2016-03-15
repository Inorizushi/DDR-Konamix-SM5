local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,#000000;linear,0.5;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffuse,#000000);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OffCommand=cmd(linear,0.5;diffuse,#000000);
	};
};


return t;