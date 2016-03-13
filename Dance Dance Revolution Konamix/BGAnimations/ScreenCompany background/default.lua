local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			OnCommand=cmd(zoomx,1.1;diffuse,0,0,0,1;linear,0.5;diffuse,1,1,1,1;sleep,4;linear,0.5;diffusealpha,0);
		};
        	LoadActor("2") .. {
			OnCommand=cmd(zoomx,1.1;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1);
		};
	};
};

return t


	



