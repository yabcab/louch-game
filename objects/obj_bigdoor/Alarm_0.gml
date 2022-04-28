with obj_player
{
	if state != playerstate.none
		if state = playerstate.high
			sprite_index = spr_playerLS_high_idle
		else
			sprite_index = spr_playerLS_still
	if state != -1
		audio_play_sound(sfx_transition,1,0)
	statesave = state
	state = playerstate.none
	speed = 0
	fade = 1
	spawn = other.spawn
	targetroom = other.targetroom
	hspeedsave = 0
	vspeedsave = 0
	entered_door = 1
	audio_stop_sound(sfx_run)
	live_enter = other.live
}
