return Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_bg.png"))  .. {
			InitCommand=cmd(Center;setsize,SCREEN_WIDTH,480);
			OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.2;addx,SCREEN_WIDTH);
		};
		LoadActor(THEME:GetPathB("","_bg2.png")) .. {
			InitCommand=cmd(Center;setsize,SCREEN_WIDTH,480);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.2;addx,-SCREEN_WIDTH);
		};
	};