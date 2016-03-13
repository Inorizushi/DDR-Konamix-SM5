local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Sprite{
		Name="BackgroundWheel";
		InitCommand=cmd(draworder,0;rotationz,45);
		SetMessageCommand=function(self,params)
			local bgsong = params.Song;
			local bgcourse = params.Course;
			if bgsong and not bgcourse then
				self:LoadFromSongBackground(bgsong);
				self:scaletoclipped(256,80);
				self:x( 256 );
				self:y( -100 );
			elseif bgcourse and not bgsong then
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","background") );
			end;
		end;
	};
	Def.Banner{
		Name="BannerWheel";
		InitCommand=cmd(scaletoclipped,256,80);
		SetMessageCommand=function(self,params)
			local course = params.Course;
			local song = params.Song;
			if song and not course then
				-- this is where we do all song-specific stuff
				self:LoadFromSong(song);
			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(course);
			else
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	}
}

return t;
