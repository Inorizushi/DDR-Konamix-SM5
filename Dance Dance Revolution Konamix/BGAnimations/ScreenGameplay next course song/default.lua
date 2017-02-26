local RanVal = math.random(1,2)
if RanVal == 1 then NewSongColor = "#52f029"  else NewSongColor = "#ffff00" end;
local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
  OnCommand=cmd(stoptweening;addx,30;linear,3;addx,-30);
 		LoadActor("Screen") .. {
			InitCommand=cmd();
			StartCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
		LoadActor("Screen") .. {
			InitCommand=cmd(addx,-640);
			StartCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
		LoadActor("Screen") .. {
			InitCommand=cmd(addx,640);
			StartCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
	LoadFont("MusicScroll titles") .. {
		InitCommand=cmd(strokecolor,Color("Outline");y,-1.5);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			local NextSong = SCREENMAN:GetTopScreen():GetNextCourseSong();
					if PROFILEMAN:IsSongNew(NextSong) then
					self:diffuse(color(NewSongColor));
				else
					self:diffuse(color("#1cfff6")); 
				end;
			self:settext( NextSong:GetDisplayFullTitle() );
		end;
		StartCommand=cmd(faderight,1;diffusealpha,0;linear,0.5;faderight,0;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	};
--[[ LoadFont("MusicScroll titles") .. {
		Text=GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetCourseType() or GAMESTATE:GetCurrentSong():GetDisplayArtist();
		InitCommand=cmd(strokecolor,Color("Outline");zoom,0.75);
		OnCommand=cmd(faderight,1;diffusealpha,0;linear,0.5;faderight,0;diffusealpha,1;sleep,1.5;linear,0.5;diffusealpha,0);
	}; --]]
};
return t;