if instance_exists(obj_freezetimer)
	previous = pausestate.nonplayerpause
else
	previous = pausestate.none
pause_state = pausestate.playerpause
alarm[0] = 5