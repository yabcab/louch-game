if other.facing != image_xscale
{
	other.facing = image_xscale
	if !audio_is_playing(sfx_boost)
		audio_play_sound(sfx_boost,1,0)
}