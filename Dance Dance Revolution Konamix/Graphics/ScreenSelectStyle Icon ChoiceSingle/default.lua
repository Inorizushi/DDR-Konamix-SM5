-- ScreenSelectStyle/Single
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local unjoinedPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","single"))..{
		OnCommand=cmd(x,SCREEN_LEFT-100;y,SCREEN_CENTER_Y+120;sleep,0.75;linear,0.25;x,SCREEN_CENTER_X-210);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd(x,SCREEN_CENTER_X-210;y,SCREEN_TOP-100;sleep,1.5;linear,0.25;y,SCREEN_CENTER_Y+25);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.55,0.55,0.55,1");pause);
		PlayerJoinedMessageCommand=cmd(playcommand,"CheckNumPlayers");
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:GetNumPlayersEnabled() > 1 then
				self:visible(false)
				-- reload metrics to disable going back to Single
				THEME:ReloadMetrics()
			end
		end;
	};
		Def.ActorFrame{
		Name="NumStages";
		OnCommand=cmd(x,SCREEN_LEFT-100;y,SCREEN_CENTER_Y+150;sleep,0.75;linear,0.25;x,SCREEN_CENTER_X-190);
		LoadActor(THEME:GetPathG("_numstage","normal"))..{
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"););
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		};
	};
		LoadActor("_label")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-148);
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:diffusealpha(0):sleep(1.25):diffusealpha(1);
				self:x(SCREEN_CENTER_X-320);
				self:linear(0.2);
				self:x(SCREEN_CENTER_X-130);
			end
		end;
		OffCommand=cmd(linear,0.5;faderight,10);
		GainFocusCommand=function(self)
				self:visible(true)
				self:x(SCREEN_CENTER_X-320);
				self:linear(0.2);
				self:x(SCREEN_CENTER_X-130);
		end;
		LoseFocusCommand=cmd(visible,false);
	};
};

return t;