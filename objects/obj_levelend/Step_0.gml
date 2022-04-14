bg_alpha = lerp(bg_alpha,0.7,0.05)

if !exit_
{
	if bring_title
	{
		titleoff = lerp(titleoff,0,0.05)
		title_alpha = lerp(title_alpha,1,0.05)
	}
	if bring_score
	{
		score_off = lerp(score_off,0,0.05)
		score_alpha = lerp(score_alpha,1,0.05)
	}
	if bring_crown
	{
		crown_off = lerp(crown_off,0,0.05)
		crown_alpha = lerp(crown_alpha,1,0.05)
	}
	if bring_combo
	{
		combo_off = lerp(combo_off,0,0.05)
		combo_alpha = lerp(combo_alpha,1,0.05)
	}
}
else
{
	titleoff = lerp(titleoff,0,0.05)
	title_alpha = lerp(title_alpha,1,0.05)
	score_off = lerp(score_off,-100,0.1)
	score_alpha = lerp(score_alpha,0,0.1)
	crown_off = lerp(crown_off,-100,0.1)
	crown_alpha = lerp(crown_alpha,0,0.1)
	combo_off = lerp(combo_off,-100,0.1)
	combo_alpha = lerp(combo_alpha,0,0.1)
	
	final_off = lerp(final_off,0,0.05)
	final_alpha = lerp(final_alpha,1,0.05)
	
	if final_showscore
	{
		final_display = final_score
		if obj_player.key_jump_press
			room_goto(rm_hub1)
		extras_off = lerp(extras_off,0,0.05)
		extras_alpha = lerp(extras_alpha,1,0.05)
	}
	else
		final_display = irandom_range(0,100)
}

if score_startcounting
{
	if score_display < score
		score_display += irandom_range(50,150)
	if score_display > score
		score_display = score
		
	if score = score_display && !crown_set
	{
		bring_crown = 1
		crown_set = 1	
		alarm[3] = 60
		audio_stop_sound(sfx_levelenddrumroll)
		audio_play_sound(sfx_levelenddrumhit,1,0)
	}
}
if crown_startcounting
{
	if crown_display < crowncollects
	{
		crown_display += 0.05
		if crown_display = round(crown_display)
		{
			audio_stop_sound(sfx_crowncollect)
			var snd = audio_play_sound(sfx_crowncollect,1,0)
			audio_sound_pitch(snd,1 + ((crown_display / crowncollecttotal) / 1.5))
		}
	}
	else
		crown_display = crowncollects
		
	if crown_display = crowncollects && !combo_set
	{
		bring_combo = 1
		combo_set = 1
		alarm[4] = 60
	}
}
if combo_startcounting
{
	if combo_display < rank_highestcombo
	{
		combo_display += 0.1
		if combo_display = round(combo_display)
		{
			audio_stop_sound(sfx_bonk)
			var snd = audio_play_sound(sfx_bonk,1,0)
			audio_sound_pitch(snd,1 + (clamp((other.combo_display - 1),0,6) / 10))
		}
	}
	else
		combo_display = rank_highestcombo
}

if (combo_display = rank_highestcombo && !exit_set) || obj_player.key_jump_press
{
	exit_set = 1	
	alarm[5] = 60
	alarm[6] = 180
	if obj_player.key_jump_press
	{
		alarm[0] = -1
		alarm[1] = -1
		alarm[2] = -1
		alarm[3] = -1
		alarm[4] = -1
		alarm[5] = -1
		bring_title = 1
		alarm[6] = 60
		exit_ = 1	
	}
}
