return Def.ActorFrame{ 
	LoadActor(THEME:GetPathB("ScreenEditMenu","background/bg.png")) .. {
		InitCommand=cmd(Center);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenEditMenu","background/bg.png")) .. {
		InitCommand=cmd(Center;addx,-512);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenEditMenu","background/bg.png")) .. {
		InitCommand=cmd(Center;addx,512);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
}