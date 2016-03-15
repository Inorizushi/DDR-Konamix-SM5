return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","Common back"))..{
		StartTransitioningCommand=cmd(play);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1");cropright,1;faderight,.5);
		OnCommand=cmd(linear,0.5;cropright,-0.5);
	};
};