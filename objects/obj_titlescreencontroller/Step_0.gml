_time++

if abs(selector_height - selector_targetheight) > 1
	selector_height += (selector_targetheight - selector_height) / 5
else
	selector_height = selector_targetheight
if abs(selector_x - selector_target_x) > 1
	selector_x += (selector_target_x - selector_x) / 5
else
	selector_x = selector_target_x

if disp_state = 0
{
	if selector_targetheight < 350
		selector_targetheight = 600
	if selector_targetheight > 600
		selector_targetheight = 350
	
	if selector_targetheight = 350 && keyboard_check_pressed(cont_jump)
		room_goto(rm_hub1)
	if selector_targetheight = 475 && keyboard_check_pressed(cont_jump)
	{
		selector_target_x = 125
		disp_state = 1
		selector_targetheight = 75
		display_logo = 0
		keyboard_clear(cont_jump)
	}
	if selector_targetheight = 600 && keyboard_check_pressed(cont_jump)
		game_end()
}
if disp_state = 1
{
	if selector_targetheight < 75
		selector_targetheight = 600
	if selector_targetheight > 600
		selector_targetheight = 75
	
	if selector_targetheight = 75 && keyboard_check_pressed(cont_jump)
	{
		selector_target_x = 450
		disp_state = 0
		selector_targetheight = 475
		display_logo = 1
		keyboard_clear(cont_jump)
	}
	if selector_targetheight = 200
	{
		if keyboard_check(cont_left)
			if sfx_vol > 0
				sfx_vol -= 0.01
			else
				sfx_vol = 0
		if keyboard_check(cont_right)
			if sfx_vol < 1
				sfx_vol += 0.01
			else
				sfx_vol = 1
		ini_write_real("settings","sfx_vol",sfx_vol)
		audio_group_set_gain(audio_sfx,sfx_vol,0)
	}
	if selector_targetheight = 325
	{
		if keyboard_check(cont_left)
			if mu_vol > 0
				mu_vol -= 0.01
			else
				mu_vol = 0
		if keyboard_check(cont_right)
			if mu_vol < 1
				mu_vol += 0.01
			else
				mu_vol = 1
		ini_write_real("settings","mu_vol",mu_vol)
		audio_group_set_gain(audio_mu,mu_vol,0)
		audio_stop_sound(mu_secret)
	}
	if selector_targetheight = 450 && keyboard_check_pressed(cont_jump)
	{
		keyboard_clear(keyboard_key)
		disp_state = 2
		selector_target_x = -100
		binding = 1
		bind_pos = 0
	}
	if selector_targetheight = 575 && keyboard_check_pressed(cont_jump)
	{
		if window_get_fullscreen()
			window_set_fullscreen(0)
		else
			window_set_fullscreen(1)
		ini_write_real("settings","fullscreen",window_get_fullscreen())
	}
}
if disp_state = 2
{
	if binding
	{
		if keyboard_check_pressed(keyboard_key) && keyboard_key != vk_nokey
		{
			switch bind_pos {
				case 0: { ini_write_real("settings","bind_left",keyboard_key) } break;
				case 1: { ini_write_real("settings","bind_right",keyboard_key) } break;
				case 2: { ini_write_real("settings","bind_up",keyboard_key) } break;
				case 3: { ini_write_real("settings","bind_down",keyboard_key) } break;
				case 4: { ini_write_real("settings","bind_jump",keyboard_key) } break;
				case 5: { ini_write_real("settings","bind_attack",keyboard_key) } break;
			}
			keyboard_clear(keyboard_key)
			bind_pos++
			if bind_pos > 5
			{
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
			}
		}
	}
}

if keyboard_check_pressed(cont_up)
	selector_targetheight -= 125
if keyboard_check_pressed(cont_down)
	selector_targetheight += 125