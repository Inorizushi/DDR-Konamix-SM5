local t = Def.ActorFrame{
	-- I hate my life because fuck trying to make an animated sprite fill the
	-- screen and tile properly. FUCKKKKKKKK

	Def.ActorFrame{
--Dim on intro
		Def.Quad{
			InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("0,0,0,1");diffusealpha,0.7);
			OnCommand=cmd(sleep,2.8;linear,0.5;diffusealpha,0);
		};
-- Middle Sprites		
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		LoadActor("_danger bg")..{
		InitCommand=cmd(xy,SCREEN_LEFT+128,SCREEN_TOP;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		LoadActor("_danger bg")..{
		InitCommand=cmd(xy,SCREEN_LEFT+256,SCREEN_TOP;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-128,SCREEN_TOP;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-256,SCREEN_TOP;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};		
-- (+128) -128 Top Sprites

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP-128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+128,SCREEN_TOP-128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+256,SCREEN_TOP-128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};	

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-128,SCREEN_TOP-128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-256,SCREEN_TOP-128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};		

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP+128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+128,SCREEN_TOP+128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+256,SCREEN_TOP+128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};	

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-128,SCREEN_TOP+128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-256,SCREEN_TOP+128;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};			
		
-- (+256) -256 Top Sprites	
		
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP-256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+128,SCREEN_TOP-256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+256,SCREEN_TOP-256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};		
		
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-128,SCREEN_TOP-256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-256,SCREEN_TOP-256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP+256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+128,SCREEN_TOP+256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT+256,SCREEN_TOP+256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};		
		
		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-128,SCREEN_TOP+256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};

		LoadActor("_danger bg 4x2")..{
		InitCommand=cmd(xy,SCREEN_LEFT-256,SCREEN_TOP+256;diffusealpha,0);
		ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
		RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
		HideDangerAllMessageCommand=cmd(stopeffect;linear,0.25;diffusealpha,0);
		};
		
		Name="BarPart";
		InitCommand=cmd(Center);

		Def.Quad{
			Name="TheBar";
			InitCommand=cmd(zoomto,SCREEN_WIDTH,76;diffuse,color("0,0,0,0"));
			ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"Repeat");
			RepeatCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;sleep,1;queuecommand,"ShowDangerAllMessage");
			HideDangerAllMessageCommand=cmd(diffusealpha,0);
		};

		-- danger name
		LoadActor("_danger name 2x1")..{
			InitCommand=cmd(diffusealpha,0;zoom,2);
			ShowDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffuseshift;animate,false;setstate,0;linear,0.25;diffusealpha,1;sleep,1;linear,0.25;diffusealpha,0;sleep,1;linear,0.25;diffusealpha,1;setstate,1;sleep,1;queuecommand,"ShowDangerAllMessage");
			HideDangerAllMessageCommand=cmd(linear,0.25;diffusealpha,0);
		};
	};
};

return t