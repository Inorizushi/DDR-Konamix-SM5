local t = Def.ActorFrame {};
if not GAMESTATE:IsCourseMode() then 
t[#t+1] = Def.ActorFrame{
	LoadActor("../ScreenSelectPlayMode background/bg.png")..{
		InitCommand=cmd(Center;setsize,513,480);
	};
	LoadActor("../ScreenSelectPlayMode background/bg.png")..{
		InitCommand=cmd(Center;setsize,513,480;addx,513);
	};
	LoadActor("../ScreenSelectPlayMode background/bg.png")..{
		InitCommand=cmd(Center;setsize,513,480;addx,-513);
	};
};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#000000"));
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.2;smooth,0.5;addx,SCREEN_WIDTH);
	};
		LoadActor("stars") .. {
		InitCommand=cmd(Center);
		OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
};

else

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_link music (loop)"))..{
		InitCommand=cmd(play);
	};
	LoadActor("bg.png")..{
		InitCommand=cmd(Center;setsize,513,480);
	};
	LoadActor("bg.png")..{
		InitCommand=cmd(Center;setsize,513,480;addx,513);
	};
	LoadActor("bg.png")..{
		InitCommand=cmd(Center;setsize,513,480;addx,-513);
	};
};
end;

return t;