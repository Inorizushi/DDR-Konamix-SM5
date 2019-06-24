local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Banner{
		Name="BannerWheel";
		InitCommand=cmd(scaletoclipped,256,80);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
				if song and not course then
					-- this is where we do all song-specific stuff
					self:LoadFromSong(params.Song);
				elseif course and not song then
					-- this is where we do all course-specific stuff
					self:LoadFromCourse(params.Course);
					end;
				end;
			}
		}

return t;
