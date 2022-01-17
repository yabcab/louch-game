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
{
	if entered_door
		state = idlestate
	else
		state = nonstunstate
	
	entered_door = 0	
}
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
hspeed = hspeedsave
vspeed = vspeedsave

recently_entered_room = 1
alarm[2] = 60

if room = rm_hub1
{
	state = 0
	statesave = 0
	idlestate = 0
	nonstunstate = 0
	p_state = 0
	hspeed = 0
	vspeed = 0
}
_time = 0