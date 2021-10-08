with other
{
	if state != playerstate.level_end
	{
		state = playerstate.level_end
		vspeed = -12
		hspeed = 0
	}
	else if vspeed > 0
	{
		with instance_create_depth(x,y,1,obj_circletransition)
			targetroom = rm_levelcomplete
		state = playerstate.none
	}
}
if set = 0
{
	alarm[1] = 1
	set = 1
	alarm[0] = 100
}
