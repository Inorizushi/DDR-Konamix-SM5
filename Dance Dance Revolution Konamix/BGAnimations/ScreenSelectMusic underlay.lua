local t = Def.ActorFrame {};

-- Lock input for half a second so that players don't accidentally start a song
t[#t+1] = Def.Actor { 
	StartSelectingStepsMessageCommand=function() SCREENMAN:GetTopScreen():lockinput(0.5); end;
};

--
t.InitCommand=cmd(Center;x,SCREEN_CENTER_X*1.5;diffusealpha,0);
t.StartSelectingStepsMessageCommand=cmd(linear,0.2;diffusealpha,1);
t.SongUnchosenMessageCommand=cmd(linear,0.2;diffusealpha,0);


return t;
