for (i = 0; i < 25; i++)
{
	with instance_create_depth(x + random_range(-4,4),y + random_range(-4,4),depth - 1,obj_explosionparticle)
	{
		sprite_index = spr_highjumppart
		speed = 2
		anim_end = 1
	}
}
