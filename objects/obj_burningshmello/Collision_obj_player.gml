if obj_player.state = playerstate.boost
{
	instance_destroy()
	var h = hspeed
	var s = spr_dead
		with instance_create_depth(x,y,obj_player.depth + 1,obj_eatenapple)
		{
			sprite_index = s
			vspeed = random_range(-5,-7)
			hspeed = obj_player.hspeed + h
			effect = 1
			rot_speed = 15
		}
	
	audio_play_sound(sfx_bonk,1,0)
}
else if obj_player.state != playerstate.dying && obj_player.inv = 0
{
	if obj_player.state != playerstate.boost && obj_player.state != playerstate.hurt
	{
		obj_player.inv = 1
		obj_player.alarm[1] = 150
		obj_player.state = playerstate.hurt
		obj_player.hp -= 1
		obj_player.vspeed = -7
		obj_player.hspeed = 4 * -(obj_player.facing)
		if !audio_is_playing(sound)
			sound = audio_play_sound(sfx_pain,1,0)
		
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_physicsdrop)
			
		if obj_player.hp < 1
			with obj_player {
				state = playerstate.dying
				hspeed = random_range(10,15) * (facing * -1)
				vspeed = random_range(-13,-18)
				audio_play_sound(sfx_ricochet,1,0)
			}
	}
}