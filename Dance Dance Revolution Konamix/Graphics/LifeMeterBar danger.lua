local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("LifeMeterBar","under"))..{
		InitCommand=cmd(diffuseshift;effectcolor1,color("#ff0000"));
	};
};

return t;
