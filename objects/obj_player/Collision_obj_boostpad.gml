if state != playerstate.dying && pause_state != pausestate.playerpause && state != playerstate.boost
{
	state = playerstate.boost
	audio_play_sound(sfx_boost,1,0)
}