if state = playerstate.balloon_normal
{
	state = 0
	idlestate = 0
	var i;
	for (i = 0; i < 20; i++)
	{
		with instance_create_depth(x,y - 64,depth,obj_explosionparticle)
		{
			sprite_index = spr_balloonpopparticles
			image_index  = random_range(0,4)
			rot = choose(5,-5)
		}
	}
	audio_play_sound(sfx_balloonpop,1,0)
}
if state = playerstate.balloon_pound && drawballoon
{
	idlestate = 0
	var i;
	for (i = 0; i < 20; i++)
	{
		with instance_create_depth(x,y - 64,depth,obj_explosionparticle)
		{
			sprite_index = spr_balloonpopparticles
			image_index  = random_range(0,4)
			rot = choose(5,-5)
		}
	}
	audio_play_sound(sfx_balloonpop,1,0)
}