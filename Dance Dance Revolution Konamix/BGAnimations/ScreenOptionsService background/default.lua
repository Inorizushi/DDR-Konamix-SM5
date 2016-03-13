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
	LoadActor("bg.png") .. {
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("Header.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
--For 16:9
	LoadActor("Header.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X+360;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("Header.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
		LoadActor("_Name Option.png") .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};

};

return t;