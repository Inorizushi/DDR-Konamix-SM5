local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd();
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			InitCommand=cmd();
		};
		LoadActor("1") .. {
			InitCommand=cmd(addx,640;zoomx,-1);
		};	
		LoadActor("1") .. {
			InitCommand=cmd(addx,-640;zoomx,-1);
		};			
	};
};

return t


	



