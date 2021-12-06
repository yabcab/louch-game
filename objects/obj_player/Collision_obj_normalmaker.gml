if idlestate != playerstate.idle
{
	if state = playerstate.high
		state = playerstate.idle
	instance_create_depth(x,y,1,obj_whiteout)
	audio_play_sound(sfx_gothigh,1,0)
	audio_play_sound(sfx_applemunch,1,0)
}
idlestate = playerstate.idle
obj_shaders.drunk = 0

