local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","TransitionSound"))..{
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("Header.png") .. {
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
		OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.5;addx,SCREEN_WIDTH);
	};
	LoadActor("Footer.png") .. {
		OnCommand=cmd(x,SCREEN_RIGHT+640;y,SCREEN_BOTTOM-17;linear,0.5;x,SCREEN_CENTER_X);
	};
		LoadActor("select_style.png") .. {
		InitCommand=cmd(y,SCREEN_TOP+35;x,SCREEN_CENTER_X+40);
		OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.8;addx,-SCREEN_WIDTH);
	};
};

return t;