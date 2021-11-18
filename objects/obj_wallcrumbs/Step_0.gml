if pause_state = pausestate.none
{
	if vspeed < 9
		vspeed += 0.15
	image_angle += 3
}
else
{
	y -= vspeed
	x -= hspeed
}
if y > room_height
	instance_destroy()