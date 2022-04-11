if obj_player.pause
{
	audio_stop_sound(sfx_run)
	
	if instance_exists(obj_hitstun)
		instance_destroy(obj_hitstun)
	
	_time++

	if abs(selector_height - selector_targetheight) > 1
		selector_height += (selector_targetheight - selector_height) / 5
	else
		selector_height = selector_targetheight
	if abs(selector_x - selector_target_x) > 1
		selector_x += (selector_target_x - selector_x) / 5
	else
		selector_x = selector_target_x
	if abs(scroll_disp - scroll) > 1
		scroll_disp += (scroll - scroll_disp) / 5
	else
		scroll_disp = scroll

	if disp_state = 0
	{
		if selector_targetheight < 350
			selector_targetheight = 600
		if selector_targetheight > 600
			selector_targetheight = 350
	
		if selector_targetheight = 350
		{
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				pause_state = obj_player.previous_pause
				obj_player.pause = 0
				if pause_state = pausestate.playerpause && !instance_exists(obj_hitstun)
					if instance_exists(obj_freezetimer)
						pause_state = pausestate.nonplayerpause
					else
						pause_state = pausestate.none
			}
			selector_target_x = 375
		}
		if selector_targetheight = 475
		{
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				selector_target_x = 125
				disp_state = 1
				selector_targetheight = 75
				display_logo = 0
				keyboard_clear(cont_jump)
				obj_player.key_jump_press = 0
			}
			selector_target_x = 280
		}
		if selector_targetheight = 600
		{
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				pause_state = obj_player.previous_pause
				obj_player.pause = 0
				if pause_state = pausestate.playerpause && !instance_exists(obj_hitstun)
					if instance_exists(obj_freezetimer)
						pause_state = pausestate.nonplayerpause
					else
						pause_state = pausestate.none
				if room != rm_hub1
					room_goto(rm_hub1)
				else
					room_goto(rm_title)
				obj_player.key_jump_press = 0
				obj_player.spawn = 1
				obj_player.key_jump_press = 0
				obj_player.key_jump = 0
			}
			selector_target_x = 430
		}
	}
	if disp_state = 1
	{
		ini_open("savedata.lmao")
		if obj_player.key_attack_press
		{
			selector_target_x = 450
			selector_height -= scroll
			disp_state = 0
			selector_targetheight = 475
			display_logo = 1
			keyboard_clear(cont_jump)
			obj_player.key_jump_press = 0
			audio_play_sound(sfx_menupick1,1,0)
			scroll = 0
			scroll_disp = 0
		}
		
		if selector_targetheight < 75
			selector_targetheight = 825
		if selector_targetheight > 825
			selector_targetheight = 75
	
		if selector_targetheight = 75
		{
			selector_target_x = 450
			scroll = 0
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				selector_target_x = 450
				disp_state = 0
				selector_targetheight = 475
				display_logo = 1
				keyboard_clear(cont_jump)
				obj_player.key_jump_press = 0
			}
		}
		if selector_targetheight = 200
		{
			selector_target_x = 240
			if obj_player.key_left
				if sfx_vol > 0
					sfx_vol -= 0.01
				else
					sfx_vol = 0
			if obj_player.key_right
				if sfx_vol < 1
					sfx_vol += 0.01
				else
					sfx_vol = 1
			ini_write_real("settings","sfx_vol",sfx_vol)
			audio_group_set_gain(audio_sfx,sfx_vol,0)
		}
		if selector_targetheight = 325
		{
			selector_target_x = 240
			if obj_player.key_left
				if mu_vol > 0
					mu_vol -= 0.01
				else
					mu_vol = 0
			if obj_player.key_right
				if mu_vol < 1
					mu_vol += 0.01
				else
					mu_vol = 1
			ini_write_real("settings","mu_vol",mu_vol)
			scroll = 0
		}
		if selector_targetheight = 450
		{
			selector_target_x = 240
			scroll = 250
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				keyboard_clear(keyboard_key)
				disp_state = 2
				selector_target_x = -100
				binding = 1
				bind_pos = 0
			}
		}
		if selector_targetheight = 575
		{
			selector_target_x = 190
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				if window_get_fullscreen()
					window_set_fullscreen(0)
				else
					window_set_fullscreen(1)
				ini_write_real("settings","fullscreen",window_get_fullscreen())
			}
		}
		if selector_targetheight = 700
		{
			selector_target_x = 140
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				if use_varjump
				{
					ini_write_real("settings","varjump",0)
					use_varjump = 0
				}
				else
				{
					ini_write_real("settings","varjump",1)
					use_varjump = 1
				}
			}
		}
		if selector_targetheight = 825
		{
			selector_target_x = 240
			scroll = 250
			if obj_player.key_jump_press
			{
				audio_play_sound(sfx_menupick1,1,0)
				audio_play_sound(sfx_menupick2,1,0)
				if hitstun_enable
				{
					ini_write_real("settings","hitstun",0)
					hitstun_enable = 0
				}
				else
				{
					ini_write_real("settings","hitstun",1)
					hitstun_enable = 1
				}
			}
		}
	}
	if disp_state = 2
	{
		scroll_disp = 0
		if binding
		{
			if keyboard_check_pressed(keyboard_key) && keyboard_key != vk_nokey
			{
				audio_play_sound(sfx_menupick1,1,0)
				switch bind_pos {
					case 0: { ini_write_real("settings","bind_left",keyboard_key) } break;
					case 1: { ini_write_real("settings","bind_right",keyboard_key) } break;
					case 2: { ini_write_real("settings","bind_up",keyboard_key) } break;
					case 3: { ini_write_real("settings","bind_down",keyboard_key) } break;
					case 4: { ini_write_real("settings","bind_jump",keyboard_key) } break;
					case 5: { ini_write_real("settings","bind_attack",keyboard_key) } break;
					case 6: { ini_write_real("settings","bind_taunt",keyboard_key) } break;
				}
				keyboard_clear(keyboard_key)
				bind_pos++
				if bind_pos > 6
				{
					scroll_disp = 250
					disp_state = 1
					selector_target_x = 125
					binding = 0
					bind_pos = 0
					cont_left = ini_read_real("settings","bind_left",vk_left)
					cont_right = ini_read_real("settings","bind_right",vk_right)
					cont_up = ini_read_real("settings","bind_up",vk_up)
					cont_down = ini_read_real("settings","bind_down",vk_down)
					cont_jump = ini_read_real("settings","bind_jump",ord("Z"))
					cont_attack = ini_read_real("settings","bind_attack",ord("X"))
					cont_taunt = ini_read_real("settings","bind_taunt",ord("C"))
				}
			}
		}
	}

	if obj_player.key_up_press
	{
		selector_targetheight -= 125
		audio_play_sound(sfx_menuselect,1,0)
	}
	if obj_player.key_down_press
	{
		selector_targetheight += 125
		audio_play_sound(sfx_menuselect,1,0)
	}
}
else if leftoffset > 350
{
	_time = 0

	display_logo = 1
	disp_state = 0
	selector_targetheight = 350
	selector_height = 350
	scroll = 0
	scroll_disp = 0
	selector_target_x = 375
	selector_x = 375
}

if abs(upperoffset - upperoffset_t) > 1
	upperoffset += (upperoffset_t - upperoffset) / 5
else
	upperoffset = upperoffset_t
if abs(loweroffset - loweroffset_t) > 1
	loweroffset += (loweroffset_t - loweroffset) / 5
else
	loweroffset = loweroffset_t
if abs(leftoffset - leftoffset_t) > 1
	leftoffset += (leftoffset_t - leftoffset) / 5
else
	leftoffset = leftoffset_t
if abs(rightoffset - rightoffset_t) > 1
	rightoffset += (rightoffset_t - rightoffset) / 5
else
	rightoffset = rightoffset_t
if obj_player.pause
{
	loweroffset_t = 0
	upperoffset_t = 0
	leftoffset_t = 0
	rightoffset_t = 0
}
else
{
	loweroffset_t = 750
	upperoffset_t = 750
	leftoffset_t = 750
	rightoffset_t = 750
	selector_target_x = -100
}