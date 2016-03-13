return Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_bg.png"))  .. {
			OnCommand=cmd(x,SCREEN_CENTER_X-640;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X);
		};
		LoadActor(THEME:GetPathB("","_bg2.png")) .. {
			OnCommand=cmd(x,SCREEN_CENTER_X+640;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X);
		};
	};