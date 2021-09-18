if !started
{
	started = 1
	vspeed = -8
	hspeed = random_range(-2,2)
	is_trial = 0
	if instance_exists(obj_timer)
		instance_destroy(obj_timer)
}