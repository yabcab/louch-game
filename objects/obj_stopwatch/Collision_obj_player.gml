if !trialdependant || is_trial
{
	if !instance_exists(obj_freezetimer)
	{
		with instance_create_depth(x,y,depth,obj_freezetimer)
		{
			minutes = other.minutes
			seconds = other.seconds
		}
	}
	else with obj_freezetimer {
		seconds = other.seconds
		minutes = other.minutes
	}
}