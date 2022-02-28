if started
{
	if !stun_finish
	{
		audio_play_sound(sfx_run,1,0)
		stun_finish = 1
	}
	vspeed += 0.2
	if vspeed > 2
		instance_destroy()
	image_angle += 15
}


if pause_state != pausestate.none
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
	{
		pause_player_end()
		if started
			image_angle -= 15	
	}

if pause_state != pausestate.playerpause
	_time++
if bopeffect
	bop = sin(_time / 20) * 4
else
	bop = 0