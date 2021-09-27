instance_destroy()
var h = hspeed
var s = spr_dead
	with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
	{
		sprite_index = s
		vspeed = random_range(-5,-7)
		hspeed = obj_player.hspeed + h
		effect = 1
		rot_speed = 15
	}
	
audio_play_sound(sfx_hitwall3,1,0)