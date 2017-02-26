local t = Def.ActorFrame{};
 
t[#t+1] = Def.ActorFrame{
    Def.Banner{
        Name="BannerWheel";
        InitCommand=cmd(scaletoclipped,256,80;rotationz,0);
        SetMessageCommand=function(self,params)
            local course = params.Course;
            local song = params.Song;
            if course and not song then
                -- this is where we do all course-specific stuff
                self:LoadFromCourse(course);
                self:zoom(0.7);
                end;
        end;
    };
};
for count=1, 3 do
t[#t+1] = Def.Banner{
        Name="BannerSongWheel";
        InitCommand=cmd(scaletoclipped,256,80;rotationz,0;visible,false);
        SetMessageCommand=function(self,params)
            local course = params.Course;
            local song = params.Song;
            if course and not song then
                -- this is where we do all course-specific stuff
                local crs_entries = course:GetCourseEntries()
                if crs_entries[count] then
                    self:visible(true):LoadFromSong(crs_entries[count]:GetSong());
                else
                    self:visible(false);
                end
                self:zoom(0.7);
                self:y(80*count)
                end;
        end;
    };
end
return t;