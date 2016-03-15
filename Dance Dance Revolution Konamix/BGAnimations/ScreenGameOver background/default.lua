return Def.ActorFrame{
	
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffuse,color("0,0,0,1"));
	};
	LoadActor("1")..{
		InitCommand=cmd(Center);
	};
	
};