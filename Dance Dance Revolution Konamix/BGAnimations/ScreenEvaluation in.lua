return Def.ActorFrame {
		LoadActor(THEME:GetPathS("","TransitionSound"))..{
			StartTransitioningCommand=cmd(play);
		};
		LoadActor(THEME:GetPathB("","_bg.png"))  .. {
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;linear,0.25;x,SCREEN_CENTER_X-640);
		};
		LoadActor(THEME:GetPathB("","_bg2.png")) .. {
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;;linear,0.25;x,SCREEN_CENTER_X+640);
		};
	};