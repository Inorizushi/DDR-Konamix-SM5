return Def.ActorFrame {
	LoadActor(THEME:GetPathS("","TransitionSound"))..{
		StartTransitioningCommand=cmd(play);
		}; 
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(linear,0.3;diffusealpha,0);
	};
};