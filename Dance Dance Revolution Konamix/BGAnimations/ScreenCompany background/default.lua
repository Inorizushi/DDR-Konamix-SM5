local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	Def.ActorFrame {
	InitCommand=cmd(Center;);
		Def.Quad {
			InitCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#000000"));
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			OnCommand=cmd(diffuse,0,0,0,1;linear,0.3;diffuse,1,1,1,1;sleep,2.5;linear,0;diffusealpha,0);
		};
        LoadActor("2") .. {
			OnCommand=cmd(diffusealpha,0;sleep,3;linear,0.3;diffusealpha,1);
		};
	};
};

return t


	



