if opened
{
	can_pause = 0
	if obj_player.key_left_press
	{
		if selecting = 1 && obj_player.paletteselect > 0
		{
			obj_player.paletteselect -= 1
			offset = -75
			offset2 = 0
			audio_play_sound(sfx_menuselect,1,0)
		}
		else if selecting = 2 && hatselect > 0
		{
			hatselect -= 1
			offset = -75
			offset2 = 0
			audio_play_sound(sfx_menuselect,1,0)
			obj_player.hat = hatselect
		}
	}
	if obj_player.key_right_press
	{
		if selecting = 1 && obj_player.paletteselect < 15
		{
			obj_player.paletteselect += 1
			offset = 75
			offset2 = 0			
			audio_play_sound(sfx_menuselect,1,0)
		}
		else if selecting = 2
		{
			hatselect += 1
			offset = 75
			offset2 = 0	
			audio_play_sound(sfx_menuselect,1,0)
			obj_player.hat = hatselect
		}
	}
	if obj_player.key_up_press && selecting = 2
	{
		offset = 0
		offset2 = -75
		selecting = 1
		audio_play_sound(sfx_menuselect,1,0)
	}
	if obj_player.key_down_press && selecting = 1
	{
		offset = 0
		offset2 = 75
		selecting = 2
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
else 
	can_pause = 1
