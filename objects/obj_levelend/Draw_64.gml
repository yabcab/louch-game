draw_sprite_ext(spr_fade,0,0,0,2000,2000,0,c_black,bg_alpha)
draw_sprite_ext(spr_levelend_title,0,0,0 - titleoff,2,2,0,c_white,title_alpha)
draw_sprite_ext(spr_levelend_pointsgotten,0,52 + score_off,262,2,2,0,c_white,score_alpha)
draw_sprite_ext(spr_levelend_crownsgotten,0,52 + crown_off,358,2,2,0,c_white,crown_alpha)
draw_sprite_ext(spr_levelend_comboammount,0,52 + combo_off,428,2,2,0,c_white,combo_alpha)
draw_sprite_ext(spr_levelend_final,0,300 + final_off,310,2,2,0,c_white,final_alpha)
if final_score > 100
	draw_sprite_ext(spr_levelend_extracredit,0,64,460 - extras_off,2,2,0,c_white,extras_alpha)
if nodamage
	draw_sprite_ext(spr_levelend_nodamage,0,800,460 - extras_off,2,2,0,c_white,extras_alpha)
draw_set_font(score_font)
draw_text_transformed_color(488 + score_off,265,string(score_display) + "/" + string(rank_point_req) + "  " + string((floor((score_display / rank_point_req) * 100))) + "%",2,2,0,c_white,c_white,c_white,c_white,score_alpha)
draw_text_transformed_color(400 + crown_off,362,string(floor(crown_display)) + "/" + string(crowncollecttotal) + "  " + string((floor((crown_display / crowncollecttotal) * 100))) + "%",2,2,0,c_white,c_white,c_white,c_white,crown_alpha)
draw_text_transformed_color(410 + combo_off,432,string(floor(combo_display)) + "/" + string(rank_highestcombo_req) + "  " + string((floor((combo_display / rank_highestcombo_req) * 100))) + "%",2,2,0,c_white,c_white,c_white,c_white,combo_alpha)
draw_text_transformed_color(850 + final_off,308,string(final_display) + "%",2,2,0,c_white,c_white,c_white,c_white,final_alpha)

draw_set_font(fnt_text)
if !exit_
	draw_text_outlined(10,680,c_white,c_black,get_control_string(cont_jump) + ": Skip Tallying",2,2)
else
	draw_text_outlined(10,680,c_white,c_black,get_control_string(cont_jump) + ": Return to Hub",2,2)
