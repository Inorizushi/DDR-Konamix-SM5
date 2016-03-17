local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("LifeMeterBar","under"))..{
		InitCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1"));
	};
};

return t;
