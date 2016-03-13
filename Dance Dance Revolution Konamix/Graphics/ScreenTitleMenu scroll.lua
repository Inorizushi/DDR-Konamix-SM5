local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] =	Def.Quad{
		InitCommand=cmd(fadeleft,0.10;faderight,0.10);
		OnCommand=cmd(addx,-230);
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;zoomto,SCREEN_WIDTH/2,13;diffusealpha,0.275);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;zoomto,SCREEN_WIDTH/2,13;diffusealpha,0);
	};
t[#t+1] =	Def.Quad{
		InitCommand=cmd(fadeleft,0.10;faderight,0.10);
		OnCommand=cmd(addx,230);
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;zoomto,SCREEN_WIDTH/2,13;diffusealpha,0.275);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;zoomto,SCREEN_WIDTH/2,13;diffusealpha,0);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("ScreenTitle","ParticlesRight.lua")) .. {
		InitCommand=cmd(zoom,0.275;addx,-320;addy,-30);
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;diffusealpha,0);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("ScreenTitle","ParticlesLeft.lua")) .. {
		InitCommand=cmd(zoom,0.275;addx,160;addy,-30);
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;diffusealpha,0);
	};
t[#t+1] =	LoadActor(THEME:GetPathG("TitleScreen","Scroller")) .. {
		InitCommand=cmd(zoom,0.5275;fadeleft,0.45;faderight,0.45;diffusealpha,0.275);
		OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,1"));
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;zoomto,150,26;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;zoomto,150,26;diffusealpha,0);
	};
t[#t+1] =	LoadFont("ScreenTitleMenu") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText());
		OnCommand=cmd(shadowlength,1);
		GainFocusCommand=cmd(stoptweening;linear,0.1;diffuse,Color.Green);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;diffuse,color("0.5,0.5,0.5,1"));
	};
return t;