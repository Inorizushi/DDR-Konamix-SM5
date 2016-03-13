local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("LifeMeterBar","under"))..{
		InitCommand=cmd(diffuseshift;effectcolor1,color("#ffffff"));
	};
};

return t;
