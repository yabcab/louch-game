if display
{
	var shake1x = 0
	var shake1y = 0
	if prev_score != new_score || do_shake1 = 1
	{
		shake1x = random_range(-3,3)
		shake1y = random_range(-3,3)
		if !do_shake1
			alarm[0] = 10
		do_shake1 = 1
	}
	var shake2x = 0
	var shake2y = 0
	if old_hp < hp || do_shake2 = 1
	{
		shake2x = random_range(-3,3)
		shake2y = random_range(-3,3)
		if !do_shake2
			alarm[1] = 10
		do_shake2 = 1
	}
	var shake3x = 0
	var shake3y = 0
	if new_combo != prev_combo || do_shake3 = 1
	{
		shake3x = random_range(-3,3)
		shake3y = random_range(-3,3)
		if !do_shake3
			alarm[2] = 10
		do_shake3 = 1
	}
	draw_set_font(score_font)
	
	//hp
	draw_sprite_ext(spr_hud_hpbar,1,5 + shake2x,5 + shake2y,2,2,0,c_white,1)
	draw_sprite_part_ext(spr_hud_hpbar,2,0,0,157 - ((7 - hp) * 22),sprite_get_height(spr_hud_hpbar),5 + shake2x,5 + shake2y,2,2,c_white,1)
	draw_sprite_ext(spr_hud_hpbar,0,5 + shake2x,5 + shake2y,2,2,0,c_white,1)

	//score
	draw_sprite_ext(spr_hud_scoreicon,0,870 + shake1x,5 + shake1y,2,2,0,c_white,1)
	draw_text_transformed(960 + shake1x,13 + shake1y,string(score),2,2,0)
	
	draw_set_font(fnt_text)

	//combo
	draw_sprite_ext(spr_comboletters,0,350,720 - comboletter_rise[0] + (sin(_time / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,1,425,720 - comboletter_rise[1] + (sin((_time - 15) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,2,500,720 - comboletter_rise[2] + (sin((_time - 30) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,3,575,720 - comboletter_rise[3] + (sin((_time - 45) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,4,650,720 - comboletter_rise[4] + (sin((_time - 60) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,5,725,720 - comboletter_rise[5] + (sin((_time - 75) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_combonumbers,combo_amount,775 + shake3x,(720 - comboletter_rise[5] + (sin((_time - 90) / 10) * 5)) + shake3y,1,1,0,c_white,1)
}

//draw_sprite_ext(spr_cursor,0,selector_x,(selector_height + sin(_time / 10) * 3) - scroll_disp,2,2,0,c_white,1)