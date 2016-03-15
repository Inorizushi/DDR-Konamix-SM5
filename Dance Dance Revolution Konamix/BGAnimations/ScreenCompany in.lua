return Def.ActorFrame {
	Def.Quad{
	InitCommand=cmd(Center;FullScreen;diffuse,color("1,1,1,1"));
	OnCommand=cmd(sleep,0.5;linear,0.2;diffuse,color("0,0,0,0"));
	};
};