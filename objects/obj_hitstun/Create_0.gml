if instance_number(obj_hitstun) > 1
{
	instance_destroy()
	exit;
}

if instance_exists(obj_freezetimer)
	previous = pausestate.nonplayerpause
else
	previous = pausestate.none
pause_state = pausestate.playerpause
alarm[0] = 5