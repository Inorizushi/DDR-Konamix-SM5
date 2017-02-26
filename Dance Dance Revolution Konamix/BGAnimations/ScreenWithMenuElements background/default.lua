-- Loads up a slew of objects to load into the screen, like how 3.9 does.
-- I prefer to keep these optional, incase another screen wants to hide 
-- these elements.
local t = Def.ActorFrame {
	LoadActor("bg.png")..{ InitCommand=cmd(Center) },
};
	LoadActor("bg.png")..{ InitCommand=cmd(Center;addx,553) },
};
	LoadActor("bg.png")..{ InitCommand=cmd(Center;addx,-553) },
};
return t