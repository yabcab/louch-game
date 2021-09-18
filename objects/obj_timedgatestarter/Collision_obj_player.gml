set = 1
if !started
{
	started = 1
	vspeed = -8
	hspeed = random_range(-2,2)
	audio_play_sound(sfx_gonkhit,1,0)
	audio_play_sound(sfx_run,1,0)
	audio_play_sound(sfx_uhoh,1,0)
	sprite_index = spr_gonk_alsodead
}