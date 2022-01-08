if opened
{
	if obj_player.key_left_press && obj_player.paletteselect > 0
	{
		offset = -75
		offset2 = 0
		obj_player.paletteselect -= 1
		audio_play_sound(sfx_menuselect,1,0)
	}
	if obj_player.key_right_press && obj_player.paletteselect < 14
	{
		offset = 75
		offset2 = 0
		obj_player.paletteselect += 1
		audio_play_sound(sfx_menuselect,1,0)
	}
	if obj_player.key_jump_press
	{
		pause_state = pausestate.none
		opened = 0
		audio_play_sound(sfx_menupick1,1,0)
		audio_play_sound(sfx_menupick2,1,0)
	}
	
	if offset > 0
	{
		offset -= offset / 5
	} else {
		if offset < 0
		{
			offset += -(offset / 5)
		}
	}
	if offset2 > 0
	{
		offset2 -= offset2 / 5
	} else {
		if offset2 < 0
		{
			offset2 += -(offset2 / 5)
		}
	}
}