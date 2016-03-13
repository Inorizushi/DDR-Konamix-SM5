return Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.1"));
		OnCommand=cmd(linear,0.5;diffuse,color("0,0,0,1"));
	};
};