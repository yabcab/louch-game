var shd = shader_current()
//pal_swap_set(spr_playerpalette,0,0)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_set(shd)

//lol no
if debug
	draw_text(x - 50, y - 64,string(state) + "  " + string(idlestate) + "  " + string(statesave))
	
draw_set_font(fnt_text)
draw_set_color(c_black)
draw_text(x - (string_width(name) / 2),y - 48,name)
draw_set_color(c_white)
