local t = Def.ActorFrame{}

local t_num = #t+1
t[t_num] = Def.ActorFrame{
	SetCommand=function(self,params)
		local song = params.Song
		if SCREENMAN:GetTopScreen() then
			local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
			if GAMESTATE:GetCurrentSong() == song and mw:GetSelectedType() == 'WheelItemDataType_Song' then
				self:xy( 25 , - 25 )
			else
				self:xy( 0 , 0 )
			end
		end
	end,

	Def.Banner{
		Name="BannerWheel",
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45),
		SetMessageCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			if song and not course then
				-- this is where we do all song-specific stuff
				self:LoadFromSong(song)
				self:zoom(0.7)

			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(course)
				self:zoom(0.7)
			else
				self:Load( THEME:GetPathG("Common fallback","banner"))
				self:zoom(0.7)
			end
		end
	},
  
	LoadActor("blue hl")..{
		InitCommand=cmd(rotationz,-45;zoom,0.7),
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:visible(false)
			end
		end
	}

}

local t_1 = t[t_num]

for i=1,-1,-1 do

	if i ~= 0 then
		t_1[#t_1+1] = LoadActor("yellow top.png")..{
			InitCommand=cmd(rotationz,-45;zoom,0.7),
			SetCommand=function(self,param)
				if param.Song then
					if PROFILEMAN:IsSongNew(param.Song) then
						self:cropbottom(0.9)
						self:customtexturerect(0,0,1,1)
						self:texcoordvelocity(-0.25,0)
						self:visible(true)
						if i == -1 then
							self:rotationz( 90+45 )
						end
					else
						self:visible(false)
					end
				else
					self:visible(false)
				end
			end
		}

		t_1[#t_1+1] = LoadActor("yellow side.png")..{
			InitCommand=cmd(rotationz,-45;zoom,0.7),
			SetCommand=function(self,param)
				if param.Song then
					if PROFILEMAN:IsSongNew(param.Song) then
						self:cropleft(0.99)
						self:customtexturerect(0,0,1,1)
						self:addimagecoords(0,75)
						self:texcoordvelocity(0,-0.5)
						self:visible(true)
						if i == -1 then
							self:rotationz( 90+45 )
						end
					else
						self:visible(false)
					end
				else
					self:visible(false)
				end
			end
		}
	end

end

local factorsx = {-230, 0, 230}
local indexes = {7, 8, 9}

for i = 1,3 do
	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
			InitCommand=cmd(xy,factorsx[i],-170-5),
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							if song:HasBackground() then
								self:Load(song:GetBackgroundPath())
							else
								self:Load( THEME:GetPathG("Common fallback","banner"))
							end
							self:visible(true)
							self:scaletoclipped(320,240)
							self:cropbottom(0.35):croptop(0.25)
							self:addimagecoords(0,5)
							if params.HasFocus then
								self:diffuse(color("#FFFFFF"))
							else
								self:diffuse(color("0.5,0.5,0.5,1"))
							end
						else
							self:visible(false)
						end
					end
				end
			end
		},
    
		LoadActor("bar")..{
			InitCommand=cmd(xy,factorsx[i],-126-5),
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							self:visible(true)
							self:setsize(320,16)
						else
							self:visible(false)
						end
					end
				end
			end
		},
    
		Def.BitmapText{
			Font="Pos numbers 10x2",
			Name="Index",
			InitCommand=cmd(xy,factorsx[i]+150,-126-5;halign,1),
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song and SCREENMAN:GetTopScreen() and GAMESTATE:GetSortOrder() == 'SortOrder_Group' then
					local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
					if index then
						if index == indexes[i] and mw:GetCurrentIndex() ~= 0 then
							self:visible(true)
							local group = song:GetGroupName()
							local sig = SONGMAN:GetSongsInGroup(group)
							local pos = (mw:GetCurrentIndex()+1+i-3)
							self:settext(pos.."/"..#sig)
							self:zoom(0.125)
						else
							self:visible(false)
						end
					end
				end
			end
		},
    
		LoadActor("diff.lua")..{
			InitCommand=cmd(xy,factorsx[i],-130-5);
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							self:visible(true)
						else
							self:visible(false)
						end
					end
				end
			end
		},
    
		LoadActor("diffcover.png")..{
			InitCommand=cmd(xy,factorsx[i],-130-5),
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							self:visible(true)
							if params.HasFocus then
								self:diffusealpha(0)
							else
								self:diffusealpha(0.5)
							end
						else
							self:visible(false)
						end
					end
				end
			end
		},
	}
  
end

return t
