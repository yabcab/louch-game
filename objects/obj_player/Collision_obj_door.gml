if key_up && onground && state != playerstate.dying && !recently_entered_room && onground
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
	fade = 1
	speed = 0
	spawn = other.spawn
	targetroom = other.targetroom
	hspeedsave = 0
	vspeedsave = 0
	entered_door = 1
}