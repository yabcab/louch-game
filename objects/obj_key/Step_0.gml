if pause_state = pausestate.none
{
	_time++
	yoff = sin(_time / 10) * 3
	if collected
	{
		var x_diff = (following.x - x)
		var y_diff = (following.y - y)
		x += (x_diff + (32 * -obj_player.facing)) / 10
		y += y_diff / 10
		
		if keys < keynumb
			instance_destroy()
	}
}