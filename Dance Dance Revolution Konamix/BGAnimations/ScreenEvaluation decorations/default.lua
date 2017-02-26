local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
		LoadActor(THEME:GetPathS("","TransitionSound"))..{
			StartTransitioningCommand=cmd(play);
		};
		LoadActor("Bg")..{
			InitCommand=cmd(Center;setsize,SCREEN_WIDTH,480);
			OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.75;addx,SCREEN_WIDTH);
		};
		LoadActor("HFalse")..{
			InitCommand=cmd(halign,0;x,SCREEN_LEFT;y,SCREEN_TOP+27);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.75;addx,-SCREEN_WIDTH);
		};
		LoadActor("Letters")..{
			InitCommand=cmd(CenterX;y,SCREEN_TOP+27);
			OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.75;linear,0.75;addx,SCREEN_WIDTH);
		};
		LoadActor("Footer")..{
			InitCommand=cmd(halign,0;x,SCREEN_LEFT;y,SCREEN_BOTTOM-16);
			OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.75;addx,-SCREEN_WIDTH);
		};
		--PlayerTitles
		LoadActor("TitlesP1")..{
			InitCommand=cmd(x,SCREEN_LEFT+80;y,SCREEN_CENTER_Y-42.5);
			OnCommand=cmd(diffusealpha,0;player,PLAYER_1;linear,0.75;diffusealpha,1);
		};
		LoadActor("TitlesP2")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+65;y,SCREEN_CENTER_Y-42.5);
			OnCommand=cmd(diffusealpha,0;player,PLAYER_2;linear,0.75;diffusealpha,1);
		};
	};

-- Song Title/Artist Info
t[#t+1] = LoadFont("MusicScroll titles") .. { 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+65;zoomx,0.75;horizalign,center;horizalign,center;playcommand,"Set"); 
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
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+80;zoomx,0.75;horizalign,center;playcommand,"Set"); 
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

	
if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local t2 = Def.StepsDisplay {
			InitCommand=cmd(Load,"StepsDisplayEvaluation"..PlayerNumberToString(pn),pn;SetFromGameState,pn;);
			UpdateNetEvalStatsMessageCommand=function(self,param)
				if GAMESTATE:IsPlayerEnabled(pn) then
					self:SetFromSteps(param.Steps)
				end;
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "StepsDisplay" .. ToEnumShortString(pn), t2 );
	end
end

if ShowStandardDecoration("RecordText") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local MetricsName = "RecordText" .. PlayerNumberToString(pn);
		local t2 = LoadActor( THEME:GetPathG(Var "LoadingScreen", "RecordText"), pn ) .. {
			InitCommand=function(self) 
				self:player(pn); 
				self:name(MetricsName);
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "RecordText" .. ToEnumShortString(pn), t2 );
	end
end

if ShowStandardDecoration("BonusBar") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local MetricsName = "BonusBar" .. PlayerNumberToString(pn);
		local t2 = LoadActor( THEME:GetPathG(Var "LoadingScreen", "BonusBar"), pn ) .. {
			InitCommand=function(self) 
				self:player(pn); 
				self:name(MetricsName);
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "BonusBar" .. ToEnumShortString(pn), t2 );
	end
end

if ShowStandardDecoration("JudgePercents") then
	local judgeLines = {
		'JudgmentLine_W1',
		'JudgmentLine_W2',
		'JudgmentLine_W3',
		'JudgmentLine_W4',
		'JudgmentLine_W5',
		'JudgmentLine_Miss',
		'JudgmentLine_MaxCombo'
	};
	for i=1,#judgeLines do
		local judge = ToEnumShortString(judgeLines[i]);
		for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
			if ShowStandardDecoration("JudgmentLine"..judge) then
				local metric = judge.."Number"..ToEnumShortString(pn);
				local xPos = THEME:GetMetric(Var "LoadingScreen",metric.."X");
				local yPos = THEME:GetMetric(Var "LoadingScreen",metric.."Y");
				t[#t+1] = LoadFont("_green gradient")..{
					Name=judge.."Percent"..ToEnumShortString(pn); -- e.g. "W1PercentP1"
					InitCommand=cmd(x,xPos;y,yPos;diffuse,color("#FF7400");strokecolor,color("#5208B4"));
					BeginCommand=function(self)
						self:addx(pn == PLAYER_1 and -61 or 100);
						self:halign(1)
						local p;
						local steps = GAMESTATE:GetCurrentSteps(pn);
						local rv = steps:GetRadarValues(pn);
						local totalSteps = rv:GetValue('RadarCategory_TapsAndHolds');
						local totalJumps = rv:GetValue('RadarCategory_Jumps');

						local playerStageStats = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
						if judge == "MaxCombo" then
							local maxCombo = playerStageStats:MaxCombo()
							p = tonumber(string.format("%.00f",(maxCombo/(totalSteps+totalJumps))*100));
						else
							local count = playerStageStats:GetPercentageOfTaps('TapNoteScore_'..judge);
							p = tonumber(string.format("%.00f",count*100));
						end;
						self:settext( p.."%" );
					end;
					OffCommand=THEME:GetMetric(Var "LoadingScreen",metric.."OffCommand");
				};
			end;
		end
	end
end

t[#t+1] = Def.Actor{
	Name="MaxComboHack";
	BeginCommand=function(self)
		local stageStats = STATSMAN:GetCurStageStats()
		local TopScreen = SCREENMAN:GetTopScreen()
		if GAMESTATE:IsHumanPlayer(PLAYER_1) then
			local pssP1 = stageStats:GetPlayerStageStats(PLAYER_1)
			if pssP1:FullCombo() then
				if TopScreen then
					local maxComboP1 = TopScreen:GetChild("MaxComboNumberP1");
					maxComboP1:diffuseblink()
					maxComboP1:effectperiod(0.05)
					maxComboP1:effectcolor1(PlayerColor(PLAYER_1))
					maxComboP1:effectcolor2(PlayerColor(PLAYER_2))
				end
			end;
		end;
		if GAMESTATE:IsHumanPlayer(PLAYER_2) then
			local pssP2 = stageStats:GetPlayerStageStats(PLAYER_2)
			if pssP2:FullCombo() then
				if TopScreen then
					local maxComboP2 = SCREENMAN:GetTopScreen():GetChild("MaxComboNumberP2");
					maxComboP2:diffuseblink()
					maxComboP2:effectperiod(0.05)
					maxComboP2:effectcolor1(PlayerColor(PLAYER_2))
					maxComboP2:effectcolor2(PlayerColor(PLAYER_1))
				end
			end;
		end;
	end;
};

return t;