return Def.ActorFrame {
		LoadActor(THEME:GetPathS("","TransitionSound"))..{
			StartTransitioningCommand=cmd(play);
		};
	};