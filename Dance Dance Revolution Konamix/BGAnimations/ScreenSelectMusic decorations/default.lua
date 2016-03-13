local t = LoadFallbackB();

-- Legacy StepMania 4 Function
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

local function PercentScore(pn)
	local t = LoadFont("MusicScroll Titles")..{
		InitCommand=cmd(zoom,0.625;shadowlength,1);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
				local cd = GetCustomDifficulty(st, diff, courseType);
				self:diffuse(CustomDifficultyToColor(cd));

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist)
				local scores = scorelist:GetHighScores();
				local topscore = scores[1];
				if topscore then
					text = string.format("%.2f%%", topscore:GetPercentDP()*100.0);
					-- 100% hack
					if text == "100.00%" then
						text = "100%";
					end;
				else
					text = string.format("%.2f%%", 0);
				end;
			else
				text = "";
			end;
			self:settext(text);
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		t.CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	else
		t.CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		t.CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	end

	return t;
end

-- Legacy StepMania 4 Function
for pn in ivalues(PlayerNumber) do
	local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn);
	t[#t+1] = StepsDisplay(pn) .. {
		InitCommand=function(self) self:player(pn); self:name(MetricsName); ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
	};
	if ShowStandardDecoration("PercentScore"..ToEnumShortString(pn)) then
		t[#t+1] = StandardDecorationFromTable("PercentScore"..ToEnumShortString(pn), PercentScore(pn));
	end;
end

if not GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame{
		LoadActor("Header")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+54);
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH);
		};
		LoadActor("bar")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-15);
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
	t[#t+1] = StandardDecorationFromFileOptional("NumCourseSongs","NumCourseSongs")..{
		InitCommand=cmd(horizalign,right);
		SetCommand=function(self)
			local curSelection= nil;
			local sAppend = "";
			if GAMESTATE:IsCourseMode() then
				curSelection = GAMESTATE:GetCurrentCourse();
				if curSelection then
					sAppend = (curSelection:GetEstimatedNumStages() == 1) and "Stage" or "Stages";
					self:visible(true);
					self:settext( curSelection:GetEstimatedNumStages() .. " " .. sAppend);
				else
					self:visible(false);
				end;
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
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
          InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+2;horizalign,center;horizalign,center;shadowlength,1;shadowcolor,color("#000000");diffuse,color("#1cfff6");); 
          CurrentSongChangedMessageCommand=cmd(playcommand,"Set"); 
          CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"); 
          ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
		  OffCommand=cmd(accelerate,0.2;diffusealpha,0;);
          SetCommand=function(self) 
               local song = GAMESTATE:GetCurrentSong() or GAMESTATE:GetCurrentCourse(); 
               if song then 
                    self:settext(song:GetDisplayFullTitle()); 
                    self:playcommand("Refresh");
				else
					self:settext("");
					self:playcommand("Refresh"); 	
               end 
          end; 
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
