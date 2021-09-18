instance_destroy()
var h = hspeed
	with instance_create_depth(x,y,obj_player.depth + 1,obj_eatenapple)
	{
		sprite_index = spr_gonk_dead
		vspeed = random_range(-5,-7)
		hspeed = obj_player.hspeed + h
		effect = 1
	}
	
	audio_play_sound(sfx_bonk,1,0)