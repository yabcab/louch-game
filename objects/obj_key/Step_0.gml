if pause_state = pausestate.none
{
	_time++
	yoff = sin(_time / 10) * 3
	if collected
	{
		var x_diff = (following.x - x)
		var y_diff = (following.y - y)
		x += (x_diff + (45 * -following.facing)) / 10
		y += y_diff / 10
	}
}