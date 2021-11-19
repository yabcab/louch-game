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

if !instance_exists(obj_secrettransitionchar)
	state = nonstunstate
//if state = -1
//	if idlestate != -1 && idlestate != playerstate.taunt
//		state = idlestate
//	else
//	{
//		state = 0
//		idlestate = 0
//	}
	
checkpoint_x = x
checkpoint_y = y

recently_entered_room = 1
alarm[2] = 60

