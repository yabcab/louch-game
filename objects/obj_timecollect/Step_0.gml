if pause_state != pausestate.none
	image_speed = 0
else
	image_speed = 1

visible = is_timetrial

if collected
{
	image_alpha -= 0.15
	image_xscale += 0.1
	image_yscale += 0.1
}