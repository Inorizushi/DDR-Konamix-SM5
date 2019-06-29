local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+120;setsize,SCREEN_WIDTH,280;diffuse,color("#000000");diffusealpha,0;draworder,1);
		StartSelectingStepsMessageCommand=cmd(linear,0.5;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(stoptweening;linear,0.25;decelerate,0.2;diffusealpha,0;);
	};
};

if not GAMESTATE:IsCourseMode() then

	local t_num = #t+1
	t[#t+1] = Def.ActorFrame{
		LoadActor("Header.png")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+54),
			OnCommand=cmd(addx,SCREEN_WIDTH;smooth,0.5;addx,-SCREEN_WIDTH)
		},
		LoadActor("music.png") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+35),
			OnCommand=cmd(addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH),
			StartSelectingStepsMessageCommand=cmd(stoptweening;diffusealpha,0),
			SongUnchosenMessageCommand=cmd(diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_TOP+35;addx,-SCREEN_WIDTH;smooth,0.5;addx,SCREEN_WIDTH)
		},
		LoadActor("selstep") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+35;diffusealpha,0),
			StartSelectingStepsMessageCommand=cmd(addx,-SCREEN_WIDTH;diffusealpha,1;smooth,0.5;addx,SCREEN_WIDTH),
			SongUnchosenMessageCommand=cmd(stoptweening;diffusealpha,0)
		}
	}

	local t_1 = t[t_num]
	for i=-1,1 do
		t_1[#t_1+1] = LoadActor("Footer")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X+self:GetWidth()*i,462)
		}
	end

	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay")
	t[#t+1] = StandardDecorationFromFileOptional("DifficultyList","DifficultyList")
	
end

if GAMESTATE:IsCourseMode() then

	t[#t+1] = Def.ActorFrame {

		Def.Quad {
			InitCommand=cmd(
				x,THEME:GetMetric(Var "LoadingScreen","CourseContentsListX"),
				y,THEME:GetMetric(Var "LoadingScreen","CourseContentsListY") - 118,
				zoomto,256+32,192
			),
			OnCommand=cmd(diffuse,Color.Green;MaskSource)
		},
		Def.Quad {
			InitCommand=cmd(
				x,THEME:GetMetric(Var "LoadingScreen","CourseContentsListX"),
				y,THEME:GetMetric(Var "LoadingScreen","CourseContentsListY") + 186,
				zoomto,256+32,64
			),
			OnCommand=cmd(diffuse,Color.Blue;MaskSource)
		}
	}

		t[#t+1] = Def.ActorFrame{
		LoadActor(THEME:GetPathG("ScreenSelectMusic","BannerFrame")) .. {

			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-94;zoom,0.97;zoomy,1.5)
		}

	}

	t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList")..{ InitCommand=cmd( addx, 5 ) }

	local t_num = #t+1
	t[t_num] = Def.ActorFrame{

		LoadActor("CourseH")..{
			OnCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X+637.5,54)
		},
		LoadActor("CourseH")..{
			OnCommand=cmd(zoomx,-1;xy,SCREEN_CENTER_X-637.5,54)
		},
		LoadActor("CourseH")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X,54);
		}

	}

	local t_1 = t[t_num]
	for i=-1,1 do
		t_1[#t_1+1] = LoadActor("CourseF")..{
			OnCommand=cmd(xy,SCREEN_CENTER_X+self:GetWidth()*i,462)
		}
	end
end

t[#t+1] = StandardDecorationFromFileOptional("SortOrder","SortOrderText") .. {
	BeginCommand=cmd(playcommand,"Set"),
	SortOrderChangedMessageCommand=cmd(playcommand,"Set"),
	SetCommand=function(self)
		local s = GAMESTATE:GetSortOrder()
		if s ~= nil then
			local s = SortOrderToLocalizedString( s )
			self:settext( s )
			self:playcommand("Sort")
		else
			return
		end
	end
}

t[#t+1] = Def.ActorFrame {
	StandardDecorationFromFileOptional("DifficultyList","DifficultyList"),
	InitCommand=cmd(draworder,99) -- hack to stop difficulty list appearing above options list
}

t[#t+1] = StandardDecorationFromFileOptional("BannerFrame","BannerFrame")

-- Song Title/Artist Info
t[#t+1] = LoadFont("MusicScroll titles") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X+2;y,SCREEN_CENTER_Y-20+2;zoomy,1.25;zoomx,1.2;horizalign,center;horizalign,center),
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set"),
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"),
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"),
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()
		if song then
			if PROFILEMAN:IsSongNew(song) then
				self:diffuse(color("#52f029"))
			else
				self:diffuse(color("#1cfff6"))
			end
			self:settext(song:GetDisplayMainTitle())
			self:playcommand("Refresh")
		elseif course then
			self:settext(course:GetDisplayFullTitle())
			self:playcommand("Refresh")
		else
			self:settext("")
			self:playcommand("Refresh")
		end
	end
}

	t[#t+1] = StandardDecorationFromFileOptional("NewSong","NewSong") .. {
		InitCommand=cmd(playcommand,"Set"),
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set"),
		SetCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				local len = string.len(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
				if PROFILEMAN:IsSongNew(GAMESTATE:GetCurrentSong()) then
					self:x( SCREEN_CENTER_X - len * 0.5 * 10 - self:GetWidth() * 0.5 )
					self:playcommand("Show")
				else
					self:playcommand("Hide")
				end
			else
				self:playcommand("Hide")
			end
		end
	}

t[#t+1] = LoadFont("Group Folder") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+80;zoomx,0.75;horizalign,center;uppercase,true),
	OnCommand=cmd(draworder,105;addx,-SCREEN_WIDTH;sleep,0.3;smooth,0.5;addx,SCREEN_WIDTH),
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set"),
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"),
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"),
	SetCommand=function(self)
		if SCREENMAN:GetTopScreen() then
			local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
			local so = GAMESTATE:GetSortOrder()
			if so == "SortOrder_Group" then
				if mw:GetSelectedType() == 'WheelItemDataType_Section' then
					self:settext(mw:GetSelectedSection())
					self:playcommand("Refresh")
				elseif GAMESTATE:GetCurrentSong() then
					self:settext(GAMESTATE:GetCurrentSong():GetGroupName())
					self:playcommand("Refresh")
				else
					self:settext("ALL MUSIC")
					self:playcommand("Refresh")
				end
			end
		end
	end
}

--Left Arrows

	local t_num = #t+1	
	t[t_num] = Def.ActorFrame{
		InitCommand=cmd(y,SCREEN_CENTER_Y-75-20+6;zoom,1),
		OnCommand=cmd(x,self:GetX()+SCREEN_WIDTH;decelerate,0.5;x,self:GetX()-SCREEN_WIDTH)
	}

	local t_1 = t[t_num]
for i=2,0,-1 do
	t_1[#t_1+1] = Def.Sprite{
		InitCommand=function(self) self:playcommand("Set") end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			self:x(SCREEN_CENTER_X-200-20*i)
			:Load(THEME:GetPathG("EditMenu","2x1"))
			:animate(false)
			:setstate(0):sleep((3-i)/3):setstate(1):sleep((i/3)+1)
			:queuecommand("Set"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	}
end

--Right Arrows

for i=2,0,-1 do
	t_1[#t_1+1] = Def.Sprite{
		OnCommand=function(self)
			self:x(SCREEN_CENTER_X+200+20*i):zoomx(-1)
			:Load(THEME:GetPathG("EditMenu","2x1"))
			:animate(false)
			:setstate(0):sleep((3-i)/3):setstate(1):sleep((i/3)+1)
			:queuecommand("Set"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("On") end
	}
end

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
