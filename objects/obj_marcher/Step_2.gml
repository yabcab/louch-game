if state = 0
{
	hspeed = lerp(hspeed,0,0.1)
	if obj_metronome.note_4
	{
		hspeed = 3.5 * xs
		stepping = 1
		image_index = 0
		if stepstate = 1
			stepstate = 0
		else
			stepstate = 1
	}
}