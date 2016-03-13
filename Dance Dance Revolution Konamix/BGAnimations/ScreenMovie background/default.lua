local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;sleep,13;diffuse,color("1,1,1,1"));
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd(diffuse,0,0,0,1;linear,0.5;diffuse,1,1,1,1;sleep,12;linear,0.5;glow,1,1,1,1);
		};	
	};
};

return t


	



