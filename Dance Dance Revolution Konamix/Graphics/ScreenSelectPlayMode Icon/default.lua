local gc = Var("GameCommand");

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName().."Explanation")
local icon_color = ModeIconColors[gc:GetName()];

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	GainFocusCommand=cmd(glowshift;addx,20;linear,0.1;addx,-40;linear,0.1;addx,20);
	LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.1);

	LoadActor("_background base")..{
		InitCommand=cmd();
	};

	-- todo: generate a better font for these.
	LoadFont("_shared1")..{
		Text=string.upper(string_name);
		InitCommand=cmd(y,-12;maxwidth,232);
		OnCommand=cmd(zoom,2;diffuse,Color.Green;skewx,-0.125);
	};
	LoadFont("MusicScroll titles")..{
		Text=string.upper(string_expl);
		InitCommand=cmd(addx,-20;y,27.5;maxwidth,232);
	};
	LoadActor("_background base") .. {
		DisabledCommand=cmd(diffuse,color("0,0,0,0.5"));
		EnabledCommand=cmd(diffuse,color("1,1,1,0"));
	};
};
return t