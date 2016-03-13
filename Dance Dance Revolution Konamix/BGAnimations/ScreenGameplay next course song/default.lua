local t = Def.ActorFrame{};

if not GAMESTATE:IsCourseMode() then return t; end;

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
  OnCommand=cmd(stoptweening;addx,30;linear,3;addx,-30);
		LoadActor("Screen") .. {
			InitCommand=cmd(Center;addx,-320;addy,-240;zoom,0.5);
			StartCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
	LoadFont("MusicScroll titles") .. {
		InitCommand=cmd(strokecolor,Color("Outline");y,-10);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			local NextSong = SCREENMAN:GetTopScreen():GetNextCourseSong();
			self:settext( NextSong:GetDisplayFullTitle() );
		end;
		StartCommand=cmd(faderight,1;diffusealpha,0;linear,0.5;faderight,0;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
--[[ LoadFont("MusicScroll titles") .. {
		Text=GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetCourseType() or GAMESTATE:GetCurrentSong():GetDisplayArtist();
		InitCommand=cmd(strokecolor,Color("Outline");zoom,0.75);
		OnCommand=cmd(faderight,1;diffusealpha,0;linear,0.5;faderight,0;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	}; --]]
	LoadFont("MusicScroll titles") .. {
		InitCommand=cmd(strokecolor,Color("Outline");diffuse,Color("Orange");diffusebottomedge,Color("Yellow");zoom,0.75;y,10);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			local NextSong = SCREENMAN:GetTopScreen():GetNextCourseSong();
			self:settext( SecondsToMSSMsMs( NextSong:MusicLengthSeconds() ) );
		end;
		StartCommand=cmd(faderight,1;diffusealpha,0;linear,0.5;faderight,0;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
};

return t;