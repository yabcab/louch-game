if !gms_chat_istyping()
	if chatopen
	{
		chatopen = 0
		gms_draw_toggle(0)
	}
	else
	{
		chatopen = 1
		gms_draw_toggle(1)
	}

//chat pause
if instance_exists(obj_player)
	if chatopen
		pause_state = pausestate.playerpause
	else if obj_player.pause = 0 && pause_state = pausestate.playerpause && !instance_exists(obj_hitstun)
		if instance_exists(obj_freezetimer)
			pause_state = pausestate.nonplayerpause
		else
			pause_state = pausestate.none