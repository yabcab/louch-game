if !other.trialdependant || is_timetrial
{
	if state != playerstate.dying && pause_state != pausestate.playerpause && state != playerstate.boost && state != playerstate.taunt
	{
		hspeed = 0//8 * other.image_xscale
		state = playerstate.boost
		audio_play_sound(sfx_boost,1,0)
	}
}