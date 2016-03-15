local Prefs =
{
	AutoSetStyle =
	{
		Default = false,
		Choices = { "ON", "OFF" },
		Values = { true, false }
	},
}

ThemePrefs.InitAll(Prefs)

function InitUserPrefs()
	local Prefs = {
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowScore = true,
		UserPrefShowLotsaOptions = false,
		UserPrefAutoSetStyle = false,
		UserPrefLongFail = false,
		UserPrefNotePosition = true,
		UserPrefComboOnRolls = false,
		UserPrefProtimingP1 = false,
		UserPrefProtimingP2 = false,
		FlashyCombos = false,
		UserPrefComboUnderField = true,
		UserPrefFancyUIBG = false,
		UserPrefTimingDisplay = false
	}
	for k, v in pairs(Prefs) do
		-- kind of xxx
		local GetPref = type(v) == "boolean" and GetUserPrefB or GetUserPref
		if GetPref(k) == nil then
			SetUserPref(k, v)
		end
	end
end
