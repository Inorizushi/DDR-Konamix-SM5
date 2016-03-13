local outColor = color("#00326B")

return Def.ActorFrame{

	LoadActor("bg")..{ 
		InitCommand=cmd(Center;diffusealpha,0;linear,0.5;diffusealpha,1;sleep,4;linear,0.5;diffusealpha,0);
	};
	
}