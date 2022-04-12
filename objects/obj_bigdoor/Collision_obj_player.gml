if set = 0 && other.key_up_press
{
	other.obj_to_hit = id
	other.state = playerstate.level_enter
	other.vspeed = -12
	other.hspeed = 0
	other.facing = 1
	can_pause = 0
	other.pause = 0
	
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

if set && other.vspeed > 3
{
	with other
	{
		entering_level = 1
		state = -1
		rot = 0
		speed = 0
		var i;
		for (i = 0; i < 100; i++)
		{
			with instance_create_depth(x + random_range(-8,8),y + random_range(-8,8),depth - 1,obj_explosionparticle)
			{
				sprite_index = spr_highjumppart
				speed = 2
				anim_end = 1
			}
		}
	}
	
	alarm[0] = 100
}
