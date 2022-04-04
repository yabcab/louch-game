if pause_state != pausestate.playerpause
{
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
				with instance_create_depth(x,y,-5,obj_eatenapple)
				{
					sprite_index = spr_key
					rot_speed = 5
				}
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
			with instance_create_depth(x,y,-5,obj_eatenapple)
			{
				sprite_index = spr_key
				rot_speed = 5
			}
		}
	}
}

if trialdependant
	visible = is_timetrial