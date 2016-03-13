local Player = ...
if not Player then error("ScreenEvaluation DifficultyIcon requires a Player") end

local CustomDifficultyToState = {
	Beginner = 0,
	Basic = 1,
	Trick = 2,
	Maniac = 3,
	SManiac = 4,
	Edit = 5,
}
local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

return LoadActor(THEME:GetPathG("ScreenSelectMusic","DifficultyIcon/_difficulty icons"))..{
	InitCommand=cmd(pause);
	BeginCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			-- change icon index based on difficulty
			local steps = GAMESTATE:GetCurrentSteps(Player)
			if steps then
				self:setstate(GetDifficultyIconFrame(steps:GetDifficulty()))
				self:visible(true)
			end
		else
			self:visible(false)
		end
	end;
};