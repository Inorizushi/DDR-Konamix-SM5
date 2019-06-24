local gc = Var("GameCommand");

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName().."Explanation")
local icon_color = ModeIconColors[gc:GetName()];

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	GainFocusCommand=cmd(addx,20;linear,0.1;addx,-40;linear,0.1;addx,20);
	LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.1);

	LoadActor("_background base")..{
		InitCommand=cmd();
	};

	-- todo: generate a better font for these.
	LoadFont("ScreenSystemLayer credits normal")..{
		Text=string.upper(string_name);
		InitCommand=cmd(maxwidth,232);
		OnCommand=cmd(zoom,2;diffuse,Color.Yellow;skewx,-0.5);
	};
	LoadActor("_background base")..{
		GainFocusCommand=cmd(visible,true;diffusealpha,0.5;glowshift;blend,Blend.Add;;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.5");effectperiod,0.5);
		LoseFocusCommand=cmd(visible,false);
	};
};
return t