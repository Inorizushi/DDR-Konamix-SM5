local t = Def.ActorFrame{
	LoadActor("new") .. {
		OnCommand=cmd()
	};
};
return t;