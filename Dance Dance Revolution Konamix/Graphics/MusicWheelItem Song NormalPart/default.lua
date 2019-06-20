local t = Def.ActorFrame{};


t[#t+1] = Def.ActorFrame{
	Def.Banner{
		Name="BannerWheel";
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45;addy,-2);
		SetMessageCommand=function(self,params)
			local course = params.Course;
			local song = params.Song;
			if song and not course then
				-- this is where we do all song-specific stuff
				self:LoadFromSong(song);
				self:zoom(0.7);
			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(course);
				self:zoom(0.7);
			else
				self:Load( THEME:GetPathG("Common fallback","banner"));
				self:zoom(0.7);
			end;
		end;
	};
	LoadActor("blue hl")..{
		InitCommand=cmd(rotationz,-45;addy,-2;zoom,0.7);
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
	};
};

local factorsx = {-230, 0, 230};
local indexes = {7, 8, 9};

for i = 1,3 do
	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
			InitCommand=cmd(xy,factorsx[i],-170);
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							if song:HasBackground() then
								self:Load(song:GetBackgroundPath())
							else
								self:Load( THEME:GetPathG("Common fallback","banner"));
							end;
							self:visible(true)
							self:scaletoclipped(320,320)
							self:cropbottom(0.35):croptop(0.25)
							if params.HasFocus then
								self:diffuse(color("#FFFFFF"))
							else
								self:diffuse(color("0.5,0.5,0.5,1"));
							end;
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
		LoadActor("bar")..{
			InitCommand=cmd(xy,factorsx[i],-126);
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
						end;
					end;
				end;
			end;
		};
		Def.BitmapText{
			Font="MusicScroll titles";
			Name="Index";
			InitCommand=cmd(xy,factorsx[i]+150,-126;halign,1);
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							self:visible(true)
							local group = song:GetGroupName()
							local sig = SONGMAN:GetSongsInGroup(group)
							self:settext("idk".."/"..#sig)
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
		LoadActor("diff.lua")..{
			InitCommand=cmd(xy,factorsx[i],-130);
			SetMessageCommand=function(self,params)
				local song = params.Song
				local index = params.DrawIndex
				if song then
					if index then
						if index == indexes[i] then
							self:visible(true)
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
		LoadActor("diffcover.png")..{
			InitCommand=cmd(xy,factorsx[i],-130);
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
							end;
						else
							self:visible(false)
						end;
					end;
				end;
			end;
		};
	};
end;

return t;
