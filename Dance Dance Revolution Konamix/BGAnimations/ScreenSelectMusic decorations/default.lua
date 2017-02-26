if GAMESTATE:IsCourseMode() then 
		UseFont = "ScreenSystemLayer credits normal"
		elseif not GAMESTATE:IsCourseMode() then 
		UseFont = "MusicScroll titles"
		end;

local t = LoadFallbackB();

if not GAMESTATE:IsCourseMode() then 
t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+120;setsize,SCREEN_WIDTH,200;diffuse,color("#000000");diffusealpha,0;draworder,1);
		StartSelectingStepsMessageCommand=cmd(sleep,0.25;linear,0.5;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(stoptweening;decelerate,0.2;diffusealpha,0;);
	};
};
end;

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
		LoadActor("bar")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-15;setsize,SCREEN_WIDTH,16);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
		LoadActor("diff frame")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-19);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
		LoadActor("diff frame")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y-19);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
		LoadActor("diff frame")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-19);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
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
	t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList")..{InitCommand=cmd(addx,5);};
	t[#t+1] = Def.ActorFrame{
	LoadActor("CourseH.png") .. {
		InitCommand=cmd(xy,SCREEN_CENTER_X,54);
		OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.4;addx,SCREEN_WIDTH);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
		LoadActor("CourseHB")..{
			InitCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X+637.5,54);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
		};
		LoadActor("CourseHB")..{
			InitCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X-637.5,54);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
		};	
		LoadActor("CourseHB")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X,54);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
		};	
		LoadActor("CourseF")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X,464);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
		};
					LoadActor("CourseF")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X+640,464);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
		};
				LoadActor("CourseF")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X-640,464);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
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

t[#t+1] = LoadFont(UseFont) .. { 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomx,0.75;horizalign,center;horizalign,center); 
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set"); 
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"); 
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
	SetCommand=function(self) 
    local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel");
	local group = wheel:GetCurrentIndex();
    if wheel:GetSelectedType() == "WheelItemDataType_Section" then
			self:settext(wheel:GetWheelItem(8):GetText()); 
			self:playcommand("Refresh");
			else
			self:settext("");
			self:playcommand("Refresh");
		end 
	end;
};

-- Song Title/Artist Info
t[#t+1] = LoadFont(UseFont) .. { 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomx,0.75;horizalign,center;horizalign,center); 
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
			self:settext(string.upper(course:GetDisplayFullTitle())):maxwidth(325)
			self:y(SCREEN_TOP+75)
			self:diffuse(color("#9EFE38"))
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
--[[
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
--]]
if not GAMESTATE:IsCourseMode() then 
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState( player );
	end

	local t = Def.StepsDisplay {
		InitCommand=cmd(Load,"StepsDisplay",GAMESTATE:GetPlayerState(pn););
	};

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		t.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return t;
end


--default difficulty stuff
local function GetDifListY(d)
	local r=0;
	if d == "Difficulty_Easy" then
		r=(42*1);
	elseif d == "Difficulty_Medium" then
		r=(42*2);
	elseif d == "Difficulty_Hard" then
		r=(42*3);
	end;
	return r;
end;

local function GetDifListX(self,pn,offset,fade)
	if pn==PLAYER_1 then
		self:x(SCREEN_CENTER_X);
		if fade>0 then
			self:faderight(fade);
		end;
	end;
	return r;
end;

local function DrawDifList(pn,diff)
	local t=Def.ActorFrame {
		InitCommand=cmd(player,pn;y,SCREEN_CENTER_Y-18);
		OnCommand=cmd(addx,SCREEN_WIDTH;decelerate,0.5;addx,-SCREEN_WIDTH);
--meter
	LoadFont("MusicScroll titles")..{
		InitCommand=cmd(zoom,0.9;halign,0);
		SetCommand=function(self)
		local st=GAMESTATE:GetCurrentStyle():GetStepsType();
		local song=GAMESTATE:GetCurrentSong();
		local course = GAMESTATE:GetCurrentCourse();
		if song then
			GetDifListX(self,pn,110,0);
			if song:HasStepsTypeAndDifficulty(st,diff) then
			local steps = song:GetOneSteps( st, diff );
				self:settext(steps:GetMeter());
			else
				self:settext("");
			end;
		end;
		end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
	};
	return t;
end;

	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Easy')..{
	OnCommand=cmd(halign,0;addx,-24;diffuse,color("#EFE600"));
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Medium')..{
	OnCommand=cmd(halign,0;addx,7;diffuse,color("#f80000"))
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Hard')..{
	OnCommand=cmd(halign,0;addx,37;diffuse,color("#08DE18"));
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
end;
return t
