if !bound
{
	bound = 1	
	var i
	for (i = 0; i < 50; i++)
	with instance_create_depth(x + random_range(-8,8),y + random_range(-8,8),depth - 1,obj_explosionparticle)
	{
		sprite_index = spr_highjumppart
		speed = 2
		anim_end = 1
	}
}
