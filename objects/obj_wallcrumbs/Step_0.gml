if pause_state = pausestate.none
{
	vspeed += 0.15
	image_angle += 3
}
else
{
	y -= vspeed
	x -= hspeed
}