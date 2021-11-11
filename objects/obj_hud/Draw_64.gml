if display
{
	draw_set_font(score_font)
	
	//hp
	draw_sprite_ext(spr_hud_hpbar,1,5,5,2,2,0,c_white,1)
	draw_sprite_part_ext(spr_hud_hpbar,2,0,0,157 - ((7 - hp) * 31),sprite_get_height(spr_hud_hpbar),5,5,2,2,c_white,1)
	draw_sprite_ext(spr_hud_hpbar,0,5,5,2,2,0,c_white,1)

	//score
	draw_sprite_ext(spr_hud_scoreicon,0,870,5,2,2,0,c_white,1)
	draw_text_transformed(960,13,string(score),2,2,0)
	
	draw_set_font(fnt_text)

	draw_sprite_ext(spr_comboletters,0,350,720 - comboletter_rise[0] + (sin(_time / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,1,425,720 - comboletter_rise[1] + (sin((_time - 15) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,2,500,720 - comboletter_rise[2] + (sin((_time - 30) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,3,575,720 - comboletter_rise[3] + (sin((_time - 45) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,4,650,720 - comboletter_rise[4] + (sin((_time - 60) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_comboletters,5,725,720 - comboletter_rise[5] + (sin((_time - 75) / 10) * 5),1,1,0,c_white,1)
	draw_sprite_ext(spr_combonumbers,combo_amount,775,720 - comboletter_rise[5] + (sin((_time - 90) / 10) * 5),1,1,0,c_white,1)
}

//draw_sprite_ext(spr_cursor,0,selector_x,(selector_height + sin(_time / 10) * 3) - scroll_disp,2,2,0,c_white,1)