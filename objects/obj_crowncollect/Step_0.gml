if pause_state = pausestate.none
{
	_time++

	image_angle = sin(_time / 10) * 5
	yoff = sin((_time + 185) / 15) * 3

	if collected
	{
		image_xscale += 0.1
		image_yscale += 0.1
		image_alpha -= 0.15
		if image_alpha < 0
			instance_destroy()
	}
}
	
