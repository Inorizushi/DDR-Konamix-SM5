local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(scaletoclipped,256,80;rotationz,-45;addy,-2);
		SetMessageCommand=function(self,params)
			local group = params.Text;
			if group then
				self:LoadFromSongGroup(group);
				self:zoom(0.7);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
				self:zoom(0.7);
			end;
		end;
	};
};

return t;