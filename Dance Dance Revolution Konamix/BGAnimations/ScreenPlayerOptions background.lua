local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/_bg top")) .. {
		InitCommand=cmd(Center;scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0.5);
	};
	LoadActor(THEME:GetPathB("ScreenOptionsService","background/Header")) .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenOptionsService","background/Header")) .. {
		OnCommand=cmd(x,SCREEN_CENTER_X+360;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenOptionsService","background/Header")) .. {
		OnCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenOptionsService","background/_Name Option")) .. {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+28);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};
return t
