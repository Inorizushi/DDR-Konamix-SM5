
local tbl = {}
tbl.count_1 = 0
tbl.count_2 = 0

function WheelTransformation(self,offsetFromCenter,itemIndex,numItems)

	self:x( offsetFromCenter*85 )

	if SCREENMAN:GetTopScreen() then

		local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")

		if mw:GetSelectedType() == 'WheelItemDataType_Song'
		or mw:GetSelectedType() == 'WheelItemDataType_Section' and mw:GetCurrentIndex() == 0 then 

			local num = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetNumItems()

			if - 2 + tbl.count_1 < 0 then 
				tbl.count_1 = num + tbl.count_1
			elseif - 2 + tbl.count_1 > num - 1 then
				tbl.count_1 = tbl.count_1 - num
			end

			if 3 + tbl.count_2 < 0 then 
				tbl.count_2 = num + tbl.count_2
			elseif 3 + tbl.count_2 > num - 1 then
				tbl.count_2 = tbl.count_2 - num
			end

			SCREENMAN:SystemMessage( mw:GetCurrentIndex() .. " \n" .. - 2 + tbl.count_1 .. " \n" .. 3 + tbl.count_2 .. " \n" )

			if mw:GetCurrentIndex() < - 2 + tbl.count_1 and mw:GetCurrentIndex() > - 2 - 6 + tbl.count_1 then
				tbl.count_1 = tbl.count_1 - 6
				tbl.count_2 = tbl.count_2 - 6
			end

			if mw:GetCurrentIndex() > 3 + tbl.count_2 and mw:GetCurrentIndex() < 3 + 6 + tbl.count_2 then
				tbl.count_1 = tbl.count_1 + 6
				tbl.count_2 = tbl.count_2 + 6
			end

		else
			tbl.count_1 = 0
			tbl.count_2 = 0
		end

	end

end

function Wheel_C_Transformation(self,offsetFromCenter,itemIndex,numItems)
	self:x( offsetFromCenter*85*3.5 )
end