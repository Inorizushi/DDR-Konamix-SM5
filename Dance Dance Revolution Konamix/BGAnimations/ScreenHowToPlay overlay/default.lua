-- ScreenHowToPlay Overlay
local t = Def.ActorFrame{

	LoadActor("_howtoplay.png")..{
		Name="HowToPlaySmall";
		InitCommand=cmd(zoom,0.9;x,SCREEN_CENTER_X-146;y,SCREEN_CENTER_Y-182;);
		OnCommand=cmd();
	};

	LoadActor("_playwithfeet.png")..{
		Name="PlayWithFeet";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-44;addx,-SCREEN_WIDTH;zoomx,0.5;);
		OnCommand=cmd(sleep,3.417;linear,0.3;addx,SCREEN_WIDTH;zoomx,1;sleep,2.333;linear,0.267;zoomy,0);
	};
	Def.ActorFrame{
		Name="Message1";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);

		Def.Quad{
			InitCommand=cmd(zoomto,320,144);
			OnCommand=cmd(diffuse,color("0,0,0,0");hibernate,10;linear,0.3;diffuse,color("0,0,0,0.5");sleep,3;linear,0.3;diffusealpha,0);
		};
	};

	Def.ActorFrame{
		Name="Message2";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);

		Def.Quad{
			InitCommand=cmd(zoomto,320,144);
			OnCommand=cmd(diffuse,color("0,0,0,0");hibernate,18;linear,0.3;diffuse,color("0,0,0,0.5");sleep,3;linear,0.3;diffusealpha,0);
		};
	};

	Def.ActorFrame{
		Name="Message3";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);

		Def.Quad{
			InitCommand=cmd(zoomto,320,144);
			OnCommand=cmd(diffuse,color("0,0,0,0");hibernate,21;linear,0.3;diffuse,color("0,0,0,0.5");sleep,2.5;linear,0.3;diffusealpha,0);
		};
	};
	
	LoadActor("warning1.png")..{
		Name="Message1";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);
		OnCommand=cmd(hibernate,10;linear,0.3;diffusealpha,1;sleep,3;linear,0.3;diffusealpha,0);
	};

	LoadActor("howtoplay_pinkhand_0000.png")..{
		Name="Hand1";
		InitCommand=cmd(x,SCREEN_CENTER_X+188;y,SCREEN_CENTER_Y-105;);
		OnCommand=cmd(zoom,1;hibernate,10;addy,45;linear,0.3;diffusealpha,1;linear,0.2;addy,-45;linear,0.2;addx,-45;linear,0.2;addy,45;linear,0.2;addx,45;sleep,3;linear,0.3;diffusealpha,0);
	};

	LoadActor("warning2.png")..{
		Name="Message2";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);
		OnCommand=cmd(hibernate,18;linear,0.3;diffusealpha,1;sleep,3;linear,0.3;diffusealpha,0);
	};

	LoadActor("howtoplay_bluehand_A.png")..{
		Name="Hand2";
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y-105;);
		OnCommand=cmd(zoom,1;hibernate,18;addy,45;linear,0.3;diffusealpha,1;linear,0.2;addy,-45;linear,0.2;addx,-45;linear,0.2;addy,45;linear,0.2;addx,45;sleep,3;linear,0.3;diffusealpha,0);
	};
	
	LoadActor("howtoplay_bluehand_B.png")..{
		Name="Hand3";
		InitCommand=cmd(x,SCREEN_CENTER_X+210;y,SCREEN_CENTER_Y-105;);
		OnCommand=cmd(zoom,1;hibernate,18;addy,45;linear,0.3;diffusealpha,1;linear,0.2;addy,-45;linear,0.2;addx,45;linear,0.2;addy,45;linear,0.2;addx,-45;sleep,3;linear,0.3;diffusealpha,0);
	};

	LoadActor("warning3.png")..{
		Name="Message3";
		InitCommand=cmd(x,SCREEN_CENTER_X+148;y,SCREEN_CENTER_Y+74;);
		OnCommand=cmd(hibernate,21;linear,0.3;diffusealpha,1;sleep,3;linear,0.3;diffusealpha,0);
	};

		LoadActor("howtoplay_greenhand_0000.png")..{
		Name="Hand4";
		InitCommand=cmd(x,SCREEN_CENTER_X+250;y,SCREEN_CENTER_Y-170;);
		OnCommand=cmd(zoom,1.5;hibernate,21;linear,0.3;diffusealpha,1;bob,3;sleep,3;bob,0;linear,0.3;diffusealpha,0);
	};

	-- let the messages begin

};

return t;