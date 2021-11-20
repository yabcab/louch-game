with other
{
	can_pause = 0
	pause = 0
	if state != playerstate.level_end && state != playerstate.none
	{
		state = playerstate.level_end
		vspeed = -12
		hspeed = 0
	}
	else if vspeed >= 0 && !instance_exists(obj_circletransition)
	{
		with instance_create_depth(x,y,1,obj_circletransition)
			targetroom = rm_hub1
		state = playerstate.none
	}
}
if set = 0
{
	alarm[1] = 1
	set = 1
	alarm[0] = 100
	obj_shaders.drunk = 0
	if instance_exists(obj_timer)
		instance_destroy(obj_timer)
	other.taunt_qualify = 0
	other.idlestate = 0
	other.statesave = 0
	other.spawn = 1
	other.sprite_index = choose(spr_playerLS_taunt1,spr_playerLS_taunt2,spr_playerLS_taunt3,spr_playerLS_taunt4,spr_playerLS_taunt5,spr_playerLS_taunt6,spr_playerLS_taunt7)
}
