var i;
for (i = 0; i < 25; i++)
{
	with instance_create_depth(x,y,-500,obj_explosionparticle)
	{
		sprite_index = spr_beerparts
		image_index = random_range(0,4)
		rot = choose(5,-5)
	}
}
audio_play_sound(sfx_water2,1,0)