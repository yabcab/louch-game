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
		instance_create_depth(x,y,1,obj_circletransition)
		state = playerstate.none
	}
}