if key_up && instance_place(x,y+1,obj_solid) && state != playerstate.dying && !recently_entered_room
{
	if state != -1
		audio_play_sound(sfx_transition,1,0)
	statesave = state
	state = playerstate.none
	fade = 1
	speed = 0
	spawn = other.spawn
	targetroom = other.targetroom
	sprite_index = spr_playerLS_still
}