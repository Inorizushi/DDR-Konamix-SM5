local t = Def.ActorFrame{};


t[#t+1] = Def.ActorFrame{
--[[	Def.Sprite{
		Name="BackgroundWheel";
		InitCommand=cmd(draworder,0;cropto,345.3,108;y,-188);
		SetMessageCommand=function(self,params)
			local bgsong = params.Song;
			local bgcourse = params.Course;
			if bgsong and not bgcourse then
				self:LoadFromSongBackground(bgsong);
			elseif bgcourse and not bgsong then
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","background") );
			end;
		end;
	};
--]]	Def.Banner{
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
};

--[[t[#t+1] = Def.ActorFrame{
	LoadActor("diff frame")..{
		InitCommand=cmd(draworder,99;y,-129);
	};
};
--]]
return t;
