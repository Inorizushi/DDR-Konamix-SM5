local t = Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;
		end;
	}
}

return t;