local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
	};
};

-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};
-- Screen
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	OnCommand=cmd(diffusealpha,1);
	LoadActor("Caution") .. {
		OnCommand=cmd();
	};
};
--
return t
