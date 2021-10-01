if pause_state != pausestate.playerpause
{
	_time++
	yoff = sin(_time / 10) * 3
	if collected
	{
		if !instance_exists(following)
			following = obj_player
		var x_diff = (following.x - x)
		var y_diff = (following.y - y)
		x += (x_diff + (32 * -obj_player.facing)) / 10
		y += y_diff / 10
		
		if keys < keynumb
		{
			instance_destroy()
			with instance_create_depth(x,y,-5,obj_eatenapple)
			{
				sprite_index = spr_key
				rot_speed = 5
			}
		}
	}
}