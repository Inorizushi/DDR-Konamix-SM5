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
		InitCommand=cmd(addx,-176;player,PLAYER_1);
	};
	LoadActor(scoreFrame).. {
		InitCommand=cmd(addx,196;player,PLAYER_2);
	};
};