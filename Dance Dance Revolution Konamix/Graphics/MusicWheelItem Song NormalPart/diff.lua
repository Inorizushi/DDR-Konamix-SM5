local t = Def.ActorFrame{};

local masterPlayer = GAMESTATE:GetMasterPlayerNumber()

t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(draworder,1);
		LoadActor("diff frame.png");
	};
	Def.ActorFrame{
		InitCommand=cmd(draworder,2;y,1);
    SetCommand=function(self,params)
    end;
		Def.BitmapText{
			Font="MusicScroll titles";
			Name = "Difficulty_Easy";
			SetMessageCommand=function(self,params)
        local song = params.Song
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        if song then
          local diff = song:GetOneSteps( st, "Difficulty_Easy");
          if diff then
            self:settext( diff:GetMeter() );
            self:visible(true);
          else
            self:visible(false);
          end;
        end;
        self:x(-24);
        self:zoom(0.9):halign(0):diffuse(color("#EFE600"))
      end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:queuecommand("Set") end;
      CurrentStepsP2ChangedMessageCommand=function(self) self:queuecommand("Set") end;
			CurrentSongChangedMessageCommand=function(self) self:queuecommand("Set") end;
		};
    Def.BitmapText{
			Font="MusicScroll titles";
			Name = "Difficulty_Medium";
			SetMessageCommand=function(self,params)
        local song = params.Song
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        if song then
          local diff = song:GetOneSteps( st, "Difficulty_Medium");
          if diff then
            self:settext( diff:GetMeter() );
            self:visible(true);
          else
            self:visible(false);
          end;
        end;
        self:x(7);
        self:zoom(0.9):halign(0):diffuse(color("#f80000"))
      end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:queuecommand("Set") end;
      CurrentStepsP2ChangedMessageCommand=function(self) self:queuecommand("Set") end;
			CurrentSongChangedMessageCommand=function(self) self:queuecommand("Set") end;
		};
    Def.BitmapText{
			Font="MusicScroll titles";
			Name = "Difficulty_Medium";
			SetMessageCommand=function(self,params)
        local song = params.Song
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        if song then
          local diff = song:GetOneSteps( st, "Difficulty_Hard");
          if diff then
            self:settext( diff:GetMeter() );
            self:visible(true);
          else
            self:visible(false);
          end;
        end;
        self:x(37);
        self:zoom(0.9):halign(0):diffuse(color("#08DE18"))
      end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:queuecommand("Set") end;
      CurrentStepsP2ChangedMessageCommand=function(self) self:queuecommand("Set") end;
			CurrentSongChangedMessageCommand=function(self) self:queuecommand("Set") end;
		};
	};
};

return t;
