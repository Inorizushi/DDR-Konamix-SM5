if IsNetSMOnline() then
	-- don't show "Ready" online; it will obscure the immediately-starting steps.
	return Def.ActorFrame{}
end

return Def.ActorFrame{

	LoadActor("ready")..{
	InitCommand=cmd(Center);
	StartTransitioningCommand=cmd(diffusealpha,0;addx,50;addy,-50;linear,0.25;diffusealpha,0.785;zoom,1.35;addx,-50;addy,50;decelerate,0.3;sleep,1;linear,0.15;addx,50;addy,-50;diffusealpha,0;);
	};
	LoadActor("ready")..{
	InitCommand=cmd(Center);
	StartTransitioningCommand=cmd(diffusealpha,0;addx,-50;addy,50;linear,0.25;diffusealpha,0.785;zoom,1.35;addx,50;addy,-50;decelerate,0.3;sleep,1;linear,0.15;addx,-50;addy,50;diffusealpha,0;);
	};
};