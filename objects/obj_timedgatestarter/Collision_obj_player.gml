if !set
{
	vspeed = -8
	hspeed = random_range(-2,2)
	audio_play_sound(sfx_gonkhit,1,0)
	audio_play_sound(sfx_uhoh,1,0)
	do_hitstun(10)
	sprite_index = spr_gonk_alsodead
	alarm[0] = 10
}
set = 1