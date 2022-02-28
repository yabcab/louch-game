if !set
{
	vspeed = -8
	hspeed = random_range(-2,2)
	audio_play_sound(sfx_gonkhit,1,0)
	audio_play_sound(deathsfx,1,0)
	do_hitstun(10)
	sprite_index = deathsprite
	alarm[0] = 10
}
set = 1