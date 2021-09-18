function scr_enemy_death(hurt){
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
	
	audio_play_sound(sfx_hitwall3,1,0)
}
else if obj_player.state != playerstate.dying
{
	if !instance_place(obj_player.x,obj_player.y + 5,obj_solid) && obj_player.vspeed > 2
	{
		var s = spr_dead
		instance_destroy()
		with instance_create_depth(x,y,obj_player.depth + 1,obj_eatenapple)
		{
			sprite_index = s
			vspeed = random_range(-3,-5)
		}
	
		if keyboard_check(ord("Z"))
			obj_player.vspeed = -9
		else
			obj_player.vspeed = -6
		
		obj_player.beginjump = 1
		obj_player.image_index = 0
	
		var snd = audio_play_sound(sfx_bonk,1,0)
		audio_sound_pitch(snd,1 + (obj_player.combo / 10))
		obj_player.combo += 1
	}
	else if hurt && !obj_player.inv
	{
		if obj_player.state != playerstate.boost && obj_player.state != playerstate.hurt
		{
			obj_player.inv = 1
			obj_player.alarm[1] = 150
			obj_player.state = playerstate.hurt
			obj_player.hp -= 1
			obj_player.vspeed = -7
			obj_player.hspeed = 4 * -(obj_player.facing)
			obj_player.combo = 0
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
}
}