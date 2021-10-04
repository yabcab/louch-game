if idlestate != playerstate.high
{
	if state = playerstate.idle
		state = playerstate.high
	instance_create_depth(x,y,1,obj_whiteout)
	audio_play_sound(sfx_gothigh,1,0)
	audio_play_sound(sfx_applemunch,1,0)
}
idlestate = playerstate.high
obj_shaders.drunk = 1