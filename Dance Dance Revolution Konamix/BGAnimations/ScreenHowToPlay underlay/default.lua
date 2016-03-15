-- ScreenHowToPlay underlay
local t = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(fov,20);
		Def.Model{
			Name="DoublesPad";
			Meshes=GetCharAnimPath("DancePads.txt");
			--Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			Bones=GetCharAnimPath("DancePads.txt");

			--Meshes=THEME:GetPathG("_pad","textures/DancePads.txt");
			--Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			--Bones=THEME:GetPathG("_pad","textures/DancePads.txt");
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+165;zoom,15;rotationx,12.5;rotationy,180;cullmode,'CullMode_None';);
			OnCommand=cmd(hibernate,3;rotationx,0;zoom,15;x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+70;linear,1;rotationx,45;sleep,2;linear,1;rotationy,360;rotationx,45/1.2;zoom,20;x,SCREEN_CENTER_X-57.5;y,SCREEN_CENTER_Y+100);
		};
	};
};

return t;