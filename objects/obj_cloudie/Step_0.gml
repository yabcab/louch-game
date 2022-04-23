if pause_state != pausestate.playerpause
{
	xs = lerp(xs,1,0.075)
	ys = lerp(ys,1,0.075)
	
	_time++
	yoff = sin(_time / 20) * 3
	if collected
	{
		if !instance_exists(following)
			if instance_exists(obj_player)
				following = obj_player
			else
			{
				instance_destroy()
				for (i = 0; i < 5; i++)
				{
					with instance_create_depth(x + random_range(-4,4),y + random_range(-4,4),depth - 1,obj_explosionparticle)
					{
						sprite_index = spr_cloudparts
						speed = 2
						anim_end = 1
						image_index = choose(0,1,2)
					}
				}
				obj_player.jump_charged = 1
				exit;
			}
		var x_diff = (following.x - x)
		var y_diff = (following.y - y)
		x += (x_diff + (32 * -obj_player.facing)) / 10
		y += y_diff / 10
		var s = sign(obj_player.x - x)
		if s != 0
			image_xscale = s
		
		if curr_clouds > obj_player.clouds
		{
			instance_destroy()
			ds_list_set(destroy_list,id,1)
			for (i = 0; i < 5; i++)
			{
				with instance_create_depth(x + random_range(-4,4),y + random_range(-4,4),depth - 1,obj_explosionparticle)
				{
					sprite_index = spr_cloudparts
					speed = 2
					anim_end = 1
					image_index = choose(0,1,2)
					rot = random_range(3,-3)
				}
			}
			obj_player.jump_charged = 1
		}
	}
}

if trialdependant
	visible = is_timetrial