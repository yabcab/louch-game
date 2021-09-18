instance_destroy()
	with instance_create_depth(x,y,obj_player.depth + 1,obj_eatenapple)
	{
		sprite_index = spr_bella_dead
		vspeed = random_range(-3,-5)
	}
	
	audio_play_sound(sfx_bonk,1,0)