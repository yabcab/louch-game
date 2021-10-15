pal_swap_set(spr_playerpalette,0,0)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_reset()

//lol no
if debug
	draw_text(x - 50, y - 64,string(state) + "  " + string(idlestate) + "  " + string(statesave))
	
