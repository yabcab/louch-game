if other.vspeed > 0.5 && y + 5 > other.y
{
	/*if state = 1 && wait > 25
	{
		state = 2
		hspeed = 7 * other.facing
		xs = -(other.facing)
		sprite_index = spr_bella_hit
	} */
	if state = 0
	{
		do_hitstun(3)
		state = 1
		vspeed = -3
	
		if keyboard_check(ord("Z"))
		{
			other.vspeed = -9
			other.jumping = 1
		}
		else
			other.vspeed = -6
		
		other.beginjump = 1
		other.image_index = 0
		other.justhitenemy = 1
		other.alarm[0] = 5
	
		var snd = audio_play_sound(sfx_bonk,1,0)
		audio_sound_pitch(snd,1 + (other.combo / 10))
		other.combo += 1
		ds_list_set(destroy_list,id,1)
	}
}
else if other.state != 11 && other.inv = 0
{
	if other.state != 3 && other.state != 4 && state = 0
	{
		other.inv = 1
		other.alarm[1] = 150
		other.state = 4
		other.hp -= 1
		other.vspeed = -7
		other.hspeed = 4 * -(other.facing)
		if !audio_is_playing(sound)
			sound = audio_play_sound(sfx_pain,1,0)
		
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
		instance_create_depth(other.x,other.y,-1,obj_physicsdrop)
			
		if other.hp < 1
			with other {
				state = 11
				hspeed = random_range(10,15) * (facing * -1)
				vspeed = random_range(-13,-18)
				audio_play_sound(sfx_ricochet,1,0)
			}
	}
	if other.state = 3
	{
		scr_enemy_death(0)
	}
}