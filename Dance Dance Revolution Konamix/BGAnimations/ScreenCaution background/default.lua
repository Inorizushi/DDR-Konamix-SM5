local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
	};
};
-- Screen
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	OnCommand=cmd(diffusealpha,1);
	LoadActor("Caution") .. {
		OnCommand=cmd();
	};
};
return t
