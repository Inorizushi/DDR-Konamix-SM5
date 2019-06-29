return Def.ActorFrame{ 
	LoadActor("bg.png") .. {
		InitCommand=cmd(Center);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
	LoadActor("bg.png") .. {
		InitCommand=cmd(Center;addx,-512);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
	LoadActor("bg.png") .. {
		InitCommand=cmd(Center;addx,512);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
		LoadActor("Info.png") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-120/2;diffusealpha,0.75;setsize,700,90);
		OnCommand=cmd();
	};
	LoadActor("header.png") .. {
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
		OnCommand=cmd();
	};
	LoadActor("header.png") .. {
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
		OnCommand=cmd(addx,640;zoomx,-1);
	};
	LoadActor("header.png") .. {
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
		OnCommand=cmd(addx,-640;zoomx,-1);
	};
	LoadActor("Edit.png") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,30;zoom,2);
		OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.4;addx,SCREEN_WIDTH);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
}