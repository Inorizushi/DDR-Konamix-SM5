-- gameplay score frame
local scoreFrame = "normal"

-- todo: show oni on life meter battery as well
if GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
	scoreFrame = "normal"
end

if GAMESTATE:IsDemonstration() then return end

if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then scoreFrame = "normal" end

return Def.ActorFrame{
	LoadActor(scoreFrame).. {
		InitCommand=function(self)
		self:addx(-176):player(PLAYER_1)
			if IsUsingWideScreen() then
				self:x(SCREEN_LEFT-57*4.5)
				end;
		end;
	};
	LoadActor(scoreFrame).. {
		InitCommand=function(self)
		self:addx(196):player(PLAYER_2)
				if IsUsingWideScreen() then
					self:x(SCREEN_RIGHT+57*4.5)
				end;
		end;
	};
};
