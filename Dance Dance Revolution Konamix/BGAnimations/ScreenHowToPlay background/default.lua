local outColor = color("#00326B")

return Def.ActorFrame{

	LoadActor("bgtile")..{ 
		InitCommand=cmd(Center;zoom,10;texcoordvelocity,0.15,0.15;customtexturerect,0,0,10,10);
	};
		--[[LoadActor(THEME:GetPathS("ScreenScreenHowToPlay","music")) .. {
			
		};--]]
	
}