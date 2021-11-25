if other.bbox_bottom <= bbox_top && image_index = 0
{
	audio_play_sound(sfx_gong,1,0)
	debug = 1
	solid = 0
	image_index = 1
	var crumbs = 0
	for (crumbs = 0; crumbs < 20; crumbs++)
		with instance_create_depth(x + random_range(0,64),bbox_bottom,-5,obj_explosionparticle)
		{
			sprite_index = spr_highjumppart
			speed = 2
			anim_end = 1
		}
	instance_destroy()
}