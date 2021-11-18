if pause_state = pausestate.none
{
	vspeed += 0.15
	if vspeed > 0
		depth = -1
	image_speed = 1
}
else
{
	y -= vspeed
	x -= hspeed
	image_speed = 0
}