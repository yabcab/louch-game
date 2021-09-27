if spawn = 1 && instance_exists(obj_spawn_a)
{
	x = obj_spawn_a.x
	y = obj_spawn_a.y
}
else
if spawn = 2 && instance_exists(obj_spawn_b)
{
	x = obj_spawn_b.x
	y = obj_spawn_b.y
}
else
if spawn = 3 && instance_exists(obj_spawn_c)
{
	x = obj_spawn_c.x
	y = obj_spawn_c.y
}

state = statesave
if state = -1
	if idlestate != -1
		state = idlestate
	else
	{
		state = 0
		idlestate = 0
	}
	
checkpoint_x = x
checkpoint_y = y