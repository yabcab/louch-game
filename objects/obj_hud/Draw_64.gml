if display
{
	draw_set_font(score_font)
	
	//hp
	draw_sprite_ext(spr_hud_hpbar,1,5,5,2,2,0,c_white,1)
	draw_sprite_part_ext(spr_hud_hpbar,2,0,0,157 - ((5 - hp) * 31),sprite_get_height(spr_hud_hpbar),5,5,2,2,c_white,1)
	draw_sprite_ext(spr_hud_hpbar,0,5,5,2,2,0,c_white,1)

	//score
	draw_sprite_ext(spr_hud_scoreicon,0,870,5,2,2,0,c_white,1)
	draw_text_transformed(960,13,string(score),2,2,0)
	
	draw_set_font(fnt_text)
}