return Def.ActorFrame {
	Def.Quad{
	InitCommand=cmd(Center;FullScreen;diffusealpha,0);
	OnCommand=cmd(linear,0.5;diffuse,color("1,1,1,1"));
	};
};