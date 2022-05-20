with other
{
	if instance_place(x,y - vspeed,obj_slidewall) && instance_place(x,y + vspeed,obj_slidewall)
	{
		if !inv
		{
			inv = 1
			inv_frames = 1
			invtime = 60
			hp--
			if hp <= 0
			{
				state = -1
				visible = 0
				rot = 0
				speed = 0
				audio_play_sound(sfx_explosion,1,0)
				var i;
				for (i = 0; i < 100; i++)
				{
					instance_create_depth(x,y,-500,obj_explosionparticle)
				}
				with instance_create_depth(x,y,depth - 1,obj_explosionparticle)
				{
					speed = 0
					image_alpha = 5
					sprite_index = spr_boom
				}

				obj_music.alarm[0] = 200
			}
		}
		if !hitfromslide
			vspeed = -11
		alarm[1] = 100
		hitfromslide = 1
	}
}
