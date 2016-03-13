-- ScreenSelectStyle/Versus
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local secondPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","versus"))..{
		OnCommand=cmd(x,SCREEN_LEFT-140;y,SCREEN_CENTER_Y+80;sleep,0.5;linear,0.25;x,SCREEN_CENTER_X+20);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-32;y,SCREEN_TOP-100;sleep,1.25;linear,0.25;y,SCREEN_CENTER_Y-12);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.55,0.55,0.55,1");pause);
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..secondPlayer))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+72;y,SCREEN_TOP-100;sleep,1.25;linear,0.25;y,SCREEN_CENTER_Y-12);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1");pause);
	};
	Def.ActorFrame{
		Name="NumStages";
		OnCommand=cmd(x,SCREEN_LEFT-140;y,SCREEN_CENTER_Y+110;sleep,0.5;linear,0.25;x,SCREEN_CENTER_X+70);
		LoadActor(THEME:GetPathG("_numstage","3blue"))..{
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