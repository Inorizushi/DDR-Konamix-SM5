ModeIconColors = {
	Normal		= color("#FFEE00"),
	Rave		= color("#FFEE00"), 
	Nonstop		= color("#5ca9ff"),
	Oni			= color("#2D0ADC"),
	Endless		= color("#2D0ADC"),
}

function PlayerColor( pn )
	if pn == PLAYER_1 then return color("#00F0B1") end
	if pn == PLAYER_2 then return color("#F08100") end
	return color("1,1,1,1")
end

CustomDifficultyColor = {

	Beginner	= color("#39FFFF"),			-- light blue
	Basic		= color("#EFE600"),			-- yellow
	Trick	= color("#F639AC"),			-- pink
	Maniac		= color("#08DE18"),			-- green
	SManiac = color("#2D0ADC"),			-- todo: dark blue
	Edit		= color("0.8,0.8,0.8,1"),	-- grey

}
	
function CustomDifficultyToColor( sCustomDifficulty )
	return CustomDifficultyColor[sCustomDifficulty] or color("#FFFFFF")
end
