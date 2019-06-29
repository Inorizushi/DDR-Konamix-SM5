local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
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
	LoadActor("background.png") .. {
		OnCommand=cmd(CenterX;y,SCREEN_CENTER_Y-2;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor("select_style.png") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+40;y,30);
		OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.4;addx,SCREEN_WIDTH);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};

return t;