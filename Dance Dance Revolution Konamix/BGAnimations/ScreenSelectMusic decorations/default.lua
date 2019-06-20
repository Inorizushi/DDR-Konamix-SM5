local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+120;setsize,SCREEN_WIDTH,200;diffuse,color("#000000");diffusealpha,0;draworder,1);
		StartSelectingStepsMessageCommand=cmd(sleep,0.25;linear,0.5;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(stoptweening;decelerate,0.2;diffusealpha,0;);
	};
};

if not GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame{
		LoadActor("Header")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+54);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
		LoadActor("music") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+35);
			OnCommand=cmd(addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH);
			StartSelectingStepsMessageCommand=cmd(sleep,0.5;diffusealpha,0);
			SongUnchosenMessageCommand=cmd(stoptweening;diffusealpha,1);
		};
		LoadActor("selstep") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+35;diffusealpha,0);
			StartSelectingStepsMessageCommand=cmd(addx,-SCREEN_WIDTH;diffusealpha,1;smooth,0.5;addx,SCREEN_WIDTH);
			SongUnchosenMessageCommand=cmd(stoptweening;diffusealpha,0);
		};
		LoadActor("Footer")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X,464)
		};
				LoadActor("Footer")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X+640,464)
		};
				LoadActor("Footer")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X-640,464)
		};
	};
	t[#t+1] = StandardDecorationFromFileOptional("DifficultyList","DifficultyList");
	t[#t+1] = StandardDecorationFromFileOptional("NewSong","NewSong") .. {
	-- 	ShowCommand=THEME:GetMetric(Var "LoadingScreen", "NewSongShowCommand" );
	-- 	HideCommand=THEME:GetMetric(Var "LoadingScreen", "NewSongHideCommand" );
		InitCommand=cmd(playcommand,"Set");
		BeginCommand=cmd(playcommand,"Set");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
	-- 		local pTargetProfile;
			local sSong;
			-- Start!
			if GAMESTATE:GetCurrentSong() then
				if PROFILEMAN:IsSongNew(GAMESTATE:GetCurrentSong()) then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			else
				self:playcommand("Hide");
			end
		end;
	};
	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
end;

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(
				x,THEME:GetMetric(Var "LoadingScreen","CourseContentsListX");
				y,THEME:GetMetric(Var "LoadingScreen","CourseContentsListY") - 118;
				zoomto,256+32,192;
			);
			OnCommand=cmd(diffuse,Color.Green;MaskSource);
		};
		Def.Quad {
			InitCommand=cmd(
				x,THEME:GetMetric(Var "LoadingScreen","CourseContentsListX");
				y,THEME:GetMetric(Var "LoadingScreen","CourseContentsListY") + 186;
				zoomto,256+32,64;
			);
			OnCommand=cmd(diffuse,Color.Blue;MaskSource);
		};
	};
		t[#t+1] = Def.ActorFrame{
		LoadActor(THEME:GetPathG("ScreenSelectMusic","BannerFrame")) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-94;zoom,0.97;zoomy,1.5);
		};
	};
	t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList")..{InitCommand=cmd(addx,5);};
	t[#t+1] = Def.ActorFrame{
						LoadActor("CourseH")..{
			OnCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X+637.5,54);
		};
				LoadActor("CourseH")..{
			OnCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X-637.5,54);
		};
		LoadActor("CourseH")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X,54);
		};
		LoadActor("CourseF")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X,464);
		};
					LoadActor("CourseF")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X+640,464);
		};
				LoadActor("CourseF")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X-640,464);
			OnCommand=cmd(xy,SCREEN_CENTER_X-640,464);
		};
	};
end

t[#t+1] = StandardDecorationFromFileOptional("SortOrder","SortOrderText") .. {
	BeginCommand=cmd(playcommand,"Set");
	SortOrderChangedMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local s = GAMESTATE:GetSortOrder()
		if s ~= nil then
			local s = SortOrderToLocalizedString( s )
			self:settext( s )
			self:playcommand("Sort")
		else
			return
		end
	end;
};

t[#t+1] = Def.ActorFrame {
	StandardDecorationFromFileOptional("DifficultyList","DifficultyList");
	InitCommand=cmd(draworder,99); -- hack to stop difficulty list appearing above options list
};

t[#t+1] = StandardDecorationFromFileOptional("BannerFrame","BannerFrame");

-- Song Title/Artist Info
t[#t+1] = LoadFont("MusicScroll titles") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomx,0.75;horizalign,center;horizalign,center;);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()
		if song then
			if PROFILEMAN:IsSongNew(song) then
					self:diffuse(color("#52f029"));
				else
					self:diffuse(color("#1cfff6"));
				end;
			self:settext(song:GetDisplayMainTitle());
			self:playcommand("Refresh");
		elseif course then
			self:settext(course:GetDisplayFullTitle());
			self:playcommand("Refresh");
		else
			self:settext("");
			self:playcommand("Refresh");
		end
	end;
};
--Subtitle
t[#t+1] = LoadFont("MusicScroll titles") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+12;zoomx,0.75;horizalign,center;horizalign,center;shadowlength,1;shadowcolor,color("#000000");diffuse,color("#1cfff6"));
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			if PROFILEMAN:IsSongNew(song) then
					self:diffuse(color("#52f029"));
				else
					self:diffuse(color("#1cfff6"));
				end;
			self:settext(song:GetDisplaySubTitle());
			self:playcommand("Refresh");
		else
			self:settext("");
			self:playcommand("Refresh");
		end
	end;
};

t[#t+1] = LoadFont("Group Folder") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+80;zoomx,0.75;horizalign,center;uppercase,true);
	OnCommand=cmd(draworder,105;addx,-SCREEN_WIDTH;sleep,0.3;smooth,0.5;addx,SCREEN_WIDTH);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local so = GAMESTATE:GetSortOrder();
		local groupName;
		if song then
			self:diffusealpha(1);
			if so == "SortOrder_Group" then
				self:settext(song:GetGroupName());
				self:playcommand("Refresh");
			else
				self:settext("ALL MUSIC");
				self:playcommand("Refresh");
			end;
		end;
	end;
};

--Left Arrows
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_CENTER_Y-75;zoom,1);
	OnCommand=cmd(addx,SCREEN_WIDTH;decelerate,0.5;addx,-SCREEN_WIDTH);
	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-280;);
		OnCommand=cmd(animate,true;effectoffset,0.3);
	};
	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-260;);
		OnCommand=cmd(animate,true;effectoffset,0.8);
	};
	LoadActor(THEME:GetPathG("EditMenu","Left 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-240;);
		OnCommand=cmd(animate,true;effectoffset,1.3;);
	};
};

--Right Arrows
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,1;y,SCREEN_CENTER_Y-75);
	OnCommand=cmd(addx,SCREEN_WIDTH;decelerate,0.5;addx,-SCREEN_WIDTH);
	LoadActor(THEME:GetPathG("EditMenu","Right 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+280;);
		OnCommand=cmd(animate,true;effectoffset,0.3);
	};
	LoadActor(THEME:GetPathG("EditMenu","Right 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+260;);
		OnCommand=cmd(animate,true;effectoffset,0.6);
	};
	LoadActor(THEME:GetPathG("EditMenu","Right 1x2")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+240;);
		OnCommand=cmd(animate,true;effectoffset,0.9;);
	};
};

-- Sounds
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("_switch","up")) .. {
		SelectMenuOpenedMessageCommand=cmd(stop;play);
	};
	LoadActor(THEME:GetPathS("_switch","down")) .. {
		SelectMenuClosedMessageCommand=cmd(stop;play);
	};
};
return t
