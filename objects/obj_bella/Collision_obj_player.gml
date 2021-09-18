if !instance_place(obj_player.x,obj_player.y + 5,obj_solid) && obj_player.vspeed > 2
{
	/*if state = 1 && wait > 25
	{
		state = 2
		hspeed = 7 * obj_player.facing
		xs = -(obj_player.facing)
		sprite_index = spr_bella_hit
	} */
	if state = 0
	{
		state = 1
		vspeed = -3
	
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
}
else if obj_player.state != 11 && obj_player.inv = 0
{
	if obj_player.state != 3 && obj_player.state != 4 && state = 0
	{
		obj_player.inv = 1
		obj_player.alarm[1] = 150
		obj_player.state = 4
		obj_player.hp -= 1
		obj_player.vspeed = -7
		obj_player.hspeed = 4 * -(obj_player.facing)
		if !audio_is_playing(sound)
			sound = audio_play_sound(sfx_pain,1,0)
		
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_eatenapple)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_eatenapple)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_eatenapple)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_eatenapple)
		instance_create_depth(obj_player.x,obj_player.y,-1,obj_eatenapple)
			
		if obj_player.hp < 1
			with obj_player {
				state = 11
				hspeed = random_range(10,15) * (facing * -1)
				vspeed = random_range(-13,-18)
				audio_play_sound(sfx_ricochet,1,0)
			}
	}
	if obj_player.state = 3
	{
		scr_enemy_death(0)
	}
}