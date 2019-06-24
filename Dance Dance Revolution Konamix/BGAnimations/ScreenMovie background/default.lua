local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		};	
	};
};

return t


	



