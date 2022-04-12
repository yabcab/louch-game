draw_sprite_ext(spr_dt_grass1,0,x,y + sin1,1,1,0,c_white,1)
draw_sprite_ext(spr_dt_grass2,0,x,y + sin2,1,1,0,c_white,1)
draw_sprite_ext(spr_dt_grass3,0,x,y + sin3,1,1,0,c_white,1)
draw_sprite_ext(spr_dt_grass4,0,x,y + sin4,1,1,0,c_white,1)
draw_sprite_ext(spr_dt_grass5,0,x,y + sin5,1,1,0,c_white,1)

draw_self()
draw_set_font(score_font)
draw_text_color(x - (string_width(score_str) / 2),y - 150 + score_off,score_str,c_white,c_white,c_white,c_white,score_alpha)
