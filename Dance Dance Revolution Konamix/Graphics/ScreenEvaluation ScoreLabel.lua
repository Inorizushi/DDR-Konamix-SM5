return Def.ActorFrame{
	LoadActor("ScoreLabel")..{
		InitCommand=cmd(player,PLAYER_1);
	};
	LoadActor("ScoreLabel")..{
		InitCommand=cmd(addx,295;player,PLAYER_2);
	};
};