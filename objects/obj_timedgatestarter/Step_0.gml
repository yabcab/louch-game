if started
{
	if !stun_finish
	{
		audio_play_sound(sfx_run,1,0)
		stun_finish = 1
	}
		
	
}

if pause_state != pausestate.none
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
{	
	vspeed += 0.2
	if vspeed > 2
		instance_destroy()
	image_angle += 15
	if started_pause
		pause_player_end()	
}